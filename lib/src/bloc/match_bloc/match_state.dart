part of 'match_bloc.dart';

enum MatchStatus { initial, loading, success, failure }

@freezed
sealed class MatchState with _$MatchState {
  const factory MatchState({
    @Default(MatchStatus.initial) MatchStatus status,
    @Default([]) List<MatchModel> allMatches,
    @Default([]) List<MatchModel> filteredMatches,
    SportType? selectedFilter,
    @Default({}) Map<String, String> selectedOdds,
    @Default({}) Set<String> recentlyUpdatedMatchIds,
    Object? error,
  }) = _MatchState;
}