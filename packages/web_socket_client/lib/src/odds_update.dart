/// Represents a single odds update for a match.
class OddsUpdate {
  final String matchId;
  final Map<String, double> newOdds;

  OddsUpdate({required this.matchId, required this.newOdds});

  @override
  String toString() => 'OddsUpdate(matchId: $matchId, newOdds: $newOdds)';
}