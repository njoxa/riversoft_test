import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riversoft_test/src/bloc/bloc.dart';
import 'package:riversoft_test/src/data/data.dart';
import 'package:riversoft_test/src/utils/extensions.dart';

class SportFilterBar extends StatelessWidget implements PreferredSizeWidget {
  const SportFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedFilter = context.select((MatchBloc bloc) => bloc.state.selectedFilter);

    return Container(
      height: preferredSize.height,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      color: context.colorScheme.surface,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: SportType.values.map((sport) {
          final isSelected = selectedFilter == sport;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              label: Row(
                children: [
                  Icon(
                    sport.icon,
                    size: 18,
                    color: isSelected
                        ? context.colorScheme.onPrimary
                        : context.colorScheme.onSurface,
                  ),
                  const SizedBox(width: 8),
                  Text(sport.name[0].toUpperCase() + sport.name.substring(1)),
                ],
              ),
              selected: isSelected,
              onSelected: (_) {
                context.read<MatchBloc>().add(MatchEvent.filterChanged(newFilter: sport));
              },
              backgroundColor: context.colorScheme.surfaceContainerHighest,
              selectedColor: context.colorScheme.primary,
              labelStyle: context.textTheme.bodyMedium?.copyWith(
                color: isSelected ? context.colorScheme.onPrimary : context.colorScheme.onSurface,
              ),
              shape: StadiumBorder(
                side: BorderSide(
                  color: isSelected ? context.colorScheme.primary : context.colorScheme.outline,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
