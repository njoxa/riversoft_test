import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riversoft_test/src/bloc/bloc.dart';
import 'package:riversoft_test/src/data/data.dart';
import 'package:riversoft_test/src/ui/widgets/match_list_item.dart';
import 'package:riversoft_test/src/ui/widgets/sports_filter_bar.dart';

class MatchListScreenProvider extends StatelessWidget {
  const MatchListScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MatchBloc(
        matchRepository: context.read<MatchRepository>(),
      )..add(const MatchEvent.matchesLoaded()), // Initial event
      child: const MatchListScreen(),
    );
  }
}

class MatchListScreen extends StatelessWidget {
  const MatchListScreen({super.key});

  static const String path = '/match-list';
  static const String name = 'match-list-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Matches'), bottom: const SportFilterBar()),
      body: BlocBuilder<MatchBloc, MatchState>(
        builder: (context, state) {
          switch (state.status) {
            case MatchStatus.initial:
            case MatchStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case MatchStatus.failure:
              return Center(child: Text('Failed to load matches: ${state.error}'));
            case MatchStatus.success:
              if (state.filteredMatches.isEmpty) {
                return const Center(child: Text('No matches for this filter.  '));
              }

              return ListView.builder(
                itemCount: state.filteredMatches.length,
                itemBuilder: (context, index) {
                  final match = state.filteredMatches[index];
                  return MatchListItem(key: ValueKey(match.id), match: match);
                },
              );
          }
        },
      ),
    );
  }
}
