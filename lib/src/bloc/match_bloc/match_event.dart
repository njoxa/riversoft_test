part of 'match_bloc.dart';

@freezed
sealed class MatchEvent with _$MatchEvent {
  /// Event to signal that the initial list of matches should be loaded.
  const factory MatchEvent.matchesLoaded() = MatchesLoaded;

  /// Event to signal that the user has changed the sport filter.
  const factory MatchEvent.filterChanged({required SportType? newFilter}) = FilterChanged;

  /// Event to signal that the user has selected or deselected an odd.
  const factory MatchEvent.oddSelected({required String matchId, required String oddKey}) = OddSelected;

  /// Internal event to handle incoming odds updates from the repository.
  const factory MatchEvent.oddsUpdated(OddsUpdate update) = _OddsUpdated;

  /// Internal event to clear the highlight from a match after the duration has passed.
  const factory MatchEvent.highlightExpired(String matchId) = _HighlightExpired;

  const factory MatchEvent.manualOddsUpdateRequested({required String matchId}) = ManualOddsUpdateRequested;
}
