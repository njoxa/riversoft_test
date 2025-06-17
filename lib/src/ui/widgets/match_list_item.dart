import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:riversoft_test/src/bloc/bloc.dart';
import 'package:riversoft_test/src/data/data.dart';
import 'package:riversoft_test/src/utils/extensions.dart';
import 'package:ui_kit/ui_kit.dart';

class MatchListItem extends StatelessWidget {
  final MatchModel match;

  const MatchListItem({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top row: Competitors, Score, and Time
            Row(
              children: [
                Icon(match.sport.type.icon, size: 24, color: colorScheme.onSurfaceVariant),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(match.competitor1, style: textTheme.headlineMedium),
                      const SizedBox(height: 4),
                      Text(match.competitor2, style: textTheme.headlineMedium),
                    ],
                  ),
                ),
                // NEW: Manual refresh button
                IconButton(
                  icon: Icon(Icons.refresh, color: colorScheme.secondary),
                  onPressed: () {
                    context.read<MatchBloc>().add(ManualOddsUpdateRequested(matchId: match.id));
                  },
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    Text(match.scoreDisplay, style: textTheme.displayLarge),
                    Text(DateFormat.Hm().format(match.startTime), style: textTheme.bodyMedium),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            // Bottom row: Odds buttons
            _OddsRow(match: match),
          ],
        ),
      ),
    );
  }
}

class _OddsRow extends StatelessWidget {
  final MatchModel match;

  const _OddsRow({required this.match});

  @override
  Widget build(BuildContext context) {
    // Select the necessary state from the BLoC for this
    final selectedOddKey = context.select((MatchBloc bloc) => bloc.state.selectedOdds[match.id]);
    final isRecentlyUpdated = context.select((MatchBloc bloc) => bloc.state.recentlyUpdatedMatchIds.contains(match.id));

    // Get the previous odds value for comparison. This is a simplification.
    // In a real app, you would get this from a previous state.
    final previousOdds = isRecentlyUpdated
        ? (context.read<MatchBloc>().state.allMatches.firstWhere((m) => m.id == match.id).odds)
        : match.odds;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: match.odds.entries.map((entry) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: OddsButton(
              matchId: match.id,
              oddKey: entry.key,
              oddValue: entry.value,
              previousOddValue: previousOdds[entry.key],
              isSelected: selectedOddKey == entry.key,
              onPressed: () {
                context.read<MatchBloc>().add(OddSelected(matchId: match.id, oddKey: entry.key));
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}
