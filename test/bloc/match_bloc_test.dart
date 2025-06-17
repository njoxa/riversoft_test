import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riversoft_test/src/bloc/bloc.dart';
import 'package:riversoft_test/src/data/data.dart';

import '../helpers/mocks.dart';

MatchModel _createTestMatch({String id = '1', SportType sportType = SportType.football}) {
  return MatchModel(
    id: 'match_$id',
    sport: SportModel(name: sportType.name, type: sportType),
    competitor1: 'Team A',
    competitor2: 'Team B',
    score1: 1,
    score2: 0,
    startTime: DateTime.now(),
    odds: {'1': 1.5, 'X': 2.5, '2': 3.5},
  );
}

void main() {
  late MatchRepository mockMatchRepository;
  late List<MatchModel> testMatches;

  setUp(() {
    // This runs before each test.
    mockMatchRepository = MockMatchRepository();
    testMatches = [_createTestMatch(id: '1'), _createTestMatch(id: '2', sportType: SportType.basketball)];

    // Stub the repository methods to return predictable data.
    when(() => mockMatchRepository.getMatches()).thenAnswer((_) async => testMatches);
    when(() => mockMatchRepository.getSavedSelections()).thenAnswer((_) async => {});
    // Return an empty stream for odds updates by default.
    when(() => mockMatchRepository.oddsUpdates).thenAnswer((_) => const Stream.empty());
  });

  group('MatchBloc', () {
    test('initial state is correct', () {
      expect(MatchBloc(matchRepository: mockMatchRepository).state, const MatchState(status: MatchStatus.initial));
    });

    blocTest<MatchBloc, MatchState>(
      'emits [loading, success] when MatchesLoaded is added and succeeds',
      build: () => MatchBloc(matchRepository: mockMatchRepository),
      act: (bloc) => bloc.add(const MatchEvent.matchesLoaded()),
      expect: () => <MatchState>[
        const MatchState(status: MatchStatus.loading),
        MatchState(
          status: MatchStatus.success,
          allMatches: testMatches,
          filteredMatches: testMatches,
          selectedOdds: const {},
        ),
      ],
      verify: (_) {
        verify(() => mockMatchRepository.getMatches()).called(1);
        verify(() => mockMatchRepository.getSavedSelections()).called(1);
      },
    );

    blocTest<MatchBloc, MatchState>(
      'emits [loading, failure] when MatchesLoaded is added and fails',
      build: () {
        when(() => mockMatchRepository.getMatches()).thenThrow(Exception('API Error'));
        return MatchBloc(matchRepository: mockMatchRepository);
      },
      act: (bloc) => bloc.add(const MatchEvent.matchesLoaded()),
      expect: () => [
        const MatchState(status: MatchStatus.loading),
        isA<MatchState>().having((s) => s.status, 'status', MatchStatus.failure),
      ],
    );

    blocTest<MatchBloc, MatchState>(
      'filters matches when FilterChanged is added',
      seed: () => MatchState(status: MatchStatus.success, allMatches: testMatches, filteredMatches: testMatches),
      build: () => MatchBloc(matchRepository: mockMatchRepository),
      act: (bloc) => bloc.add(const MatchEvent.filterChanged(newFilter: SportType.basketball)),
      expect: () => [
        isA<MatchState>()
            .having(
              (s) => s.filteredMatches,
              'filteredMatches',
              [testMatches[1]], 
            )
            .having((s) => s.selectedFilter, 'selectedFilter', SportType.basketball),
      ],
    );

    blocTest<MatchBloc, MatchState>(
      'selects and saves an odd when OddSelected is added',
      seed: () => MatchState(status: MatchStatus.success, allMatches: testMatches, filteredMatches: testMatches),
      build: () {
        when(() => mockMatchRepository.saveSelection(any(), any())).thenAnswer((_) async {});
        return MatchBloc(matchRepository: mockMatchRepository);
      },
      act: (bloc) => bloc.add(const MatchEvent.oddSelected(matchId: 'match_1', oddKey: 'X')),
      expect: () => [
        isA<MatchState>().having((s) => s.selectedOdds, 'selectedOdds', {'match_1': 'X'}),
      ],
      verify: (_) {
        verify(() => mockMatchRepository.saveSelection('match_1', 'X')).called(1);
      },
    );
  });
}
