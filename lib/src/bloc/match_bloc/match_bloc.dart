import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riversoft_test/src/data/data.dart';
import 'package:web_socket_client/web_socket_client.dart';

part 'match_bloc.freezed.dart';
part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final MatchRepository _matchRepository;
  StreamSubscription<OddsUpdate>? _oddsSubscription;

  MatchBloc({required MatchRepository matchRepository})
    : _matchRepository = matchRepository,
      super(const MatchState()) {
    on<MatchesLoaded>(_onMatchesLoaded);
    on<FilterChanged>(_onFilterChanged);
    on<OddSelected>(_onOddSelected);
    on<_OddsUpdated>(_onOddsUpdated);
    on<_HighlightExpired>(_onHighlightExpired);
    on<ManualOddsUpdateRequested>(_onManualOddsUpdateRequested);
  }

  Future<void> _onMatchesLoaded(MatchesLoaded event, Emitter<MatchState> emit) async {
    // Avoid reloading if data is already present.
    if (state.status == MatchStatus.success) return;

    try {
      emit(state.copyWith(status: MatchStatus.loading));

      final [Object matches, Object savedSelections] = await Future.wait(<Future<Object>>[
        _matchRepository.getMatches(),
        _matchRepository.getSavedSelections(),
      ]);

      _oddsSubscription?.cancel();
      _oddsSubscription = _matchRepository.oddsUpdates.listen(
        (OddsUpdate update) => add(MatchEvent.oddsUpdated(update)),
      );

      emit(
        state.copyWith(
          status: MatchStatus.success,
          allMatches: matches as List<MatchModel>,
          filteredMatches: matches,
          selectedOdds: Map<String, String>.from(savedSelections as Map<String, String>),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: MatchStatus.failure, error: e));
    }
  }

  void _onFilterChanged(FilterChanged event, Emitter<MatchState> emit) {
    final SportType? newFilter = state.selectedFilter == event.newFilter ? null : event.newFilter;

    final List<MatchModel> filteredList = newFilter == null
        ? state.allMatches
        : state.allMatches.where((MatchModel match) => match.sport.type == newFilter).toList();

    emit(state.copyWith(selectedFilter: newFilter, filteredMatches: filteredList));
  }

  Future<void> _onOddSelected(OddSelected event, Emitter<MatchState> emit) async {
    final Map<String, String> newSelections = Map<String, String>.from(state.selectedOdds);
    bool isAlreadySelected = newSelections[event.matchId] == event.oddKey;

    if (isAlreadySelected) {
      newSelections.remove(event.matchId);
      await _matchRepository.removeSelection(event.matchId);
    } else {
      newSelections[event.matchId] = event.oddKey;
      await _matchRepository.saveSelection(event.matchId, event.oddKey);
    }

    emit(state.copyWith(selectedOdds: newSelections));
  }

  void _onOddsUpdated(_OddsUpdated event, Emitter<MatchState> emit) {
    final OddsUpdate update = event.update;
    final int matchIndex = state.allMatches.indexWhere((MatchModel m) => m.id == update.matchId);

    if (matchIndex == -1) return;

    final MatchModel updatedMatch = state.allMatches[matchIndex].copyWith(odds: update.newOdds);
    final List<MatchModel> newAllMatches = List<MatchModel>.from(state.allMatches)..[matchIndex] = updatedMatch;
    final List<MatchModel> newFilteredMatches = state.selectedFilter == null
        ? newAllMatches
        : newAllMatches.where((MatchModel m) => m.sport.type == state.selectedFilter).toList();
    final Set<String> newRecentlyUpdated = Set<String>.from(state.recentlyUpdatedMatchIds)..add(update.matchId);

    emit(
      state.copyWith(
        allMatches: newAllMatches,
        filteredMatches: newFilteredMatches,
        recentlyUpdatedMatchIds: newRecentlyUpdated,
      ),
    );

    // Schedule the highlight to be removed after 1 second.
    Future.delayed(const Duration(seconds: 1), () {
      if (!isClosed) {
        add(MatchEvent.highlightExpired(update.matchId));
      }
    });
  }

  void _onHighlightExpired(_HighlightExpired event, Emitter<MatchState> emit) {
    final Set<String> newRecentlyUpdated = Set<String>.from(state.recentlyUpdatedMatchIds)..remove(event.matchId);
    emit(state.copyWith(recentlyUpdatedMatchIds: newRecentlyUpdated));
  }

  @override
  Future<void> close() {
    _oddsSubscription?.cancel();
    _matchRepository.dispose();
    return super.close();
  }

  void _onManualOddsUpdateRequested(ManualOddsUpdateRequested event, Emitter<MatchState> emit) {
    final Random _random = Random();

    // Generate new random odds for the requested match.
    final newOdds = {
      '1': (_random.nextDouble() * 3) + 1.2,
      'X': (_random.nextDouble() * 2) + 2.5,
      '2': (_random.nextDouble() * 3) + 1.2,
    };

    // Create an OddsUpdate object and add the internal _OddsUpdated event.
    // This reuses the existing logic for handling updates.
    add(_OddsUpdated(OddsUpdate(matchId: event.matchId, newOdds: newOdds)));
  }
}
