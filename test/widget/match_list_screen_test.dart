import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riversoft_test/src/bloc/bloc.dart';
import 'package:riversoft_test/src/data/data.dart';
import 'package:riversoft_test/src/ui/screens/match_list_screen/match_list_screen.dart';

import '../helpers/mocks.dart';

void main() {
  late MatchBloc mockMatchBloc;

  // Helper function to create a dummy match for tests.
  MatchModel _createTestMatch({
    String id = '1',
    SportType sportType = SportType.football,
    String competitor1 = 'Team A',
    String competitor2 = 'Team B',
  }) {
    return MatchModel(
      id: 'match_$id',
      sport: SportModel(name: sportType.name, type: sportType),
      competitor1: competitor1,
      competitor2: competitor2,
      score1: 1,
      score2: 0,
      startTime: DateTime.now(),
      odds: {'1': 1.5, 'X': 2.5, '2': 3.5},
    );
  }

  setUp(() {
    mockMatchBloc = MockMatchBloc();

    when(() => mockMatchBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockMatchBloc.state).thenReturn(const MatchState());
    when(() => mockMatchBloc.close()).thenAnswer((_) async {});
  });

  Future<void> pumpWidget(WidgetTester tester, {required MatchBloc bloc}) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<MatchBloc>.value(value: bloc, child: const MatchListScreen()),
      ),
    );
  }

  group('MatchListScreen', () {
    testWidgets('shows loading indicator when status is loading', (tester) async {
      when(() => mockMatchBloc.state).thenReturn(const MatchState(status: MatchStatus.loading));

      await pumpWidget(tester, bloc: mockMatchBloc);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows match list when status is success', (tester) async {
      final matches = [_createTestMatch(competitor1: 'Chelsea', competitor2: 'Arsenal')];
      when(() => mockMatchBloc.state).thenReturn(MatchState(status: MatchStatus.success, filteredMatches: matches));

      await pumpWidget(tester, bloc: mockMatchBloc);

      expect(find.text('Chelsea'), findsOneWidget);
      expect(find.text('Arsenal'), findsOneWidget);
      expect(find.text('1 - 0'), findsOneWidget);
    });

    testWidgets('shows error message when status is failure', (tester) async {
      when(() => mockMatchBloc.state).thenReturn(const MatchState(status: MatchStatus.failure, error: 'Network Error'));

      await pumpWidget(tester, bloc: mockMatchBloc);

      expect(find.text('Failed to load matches: Network Error'), findsOneWidget);
    });
  });
}
