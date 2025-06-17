
import 'package:riversoft_test/src/data/data.dart';
import 'package:web_socket_client/web_socket_client.dart';

/// Abstract interface for the match repository.
///
/// This acts as a single source of truth for match and selection data
/// for the rest of the application.
abstract interface class MatchRepository {
  /// Fetches all matches.
  Future<List<MatchModel>> getMatches();
  
  /// Fetches the user's saved selections.
  Future<Map<String, String>> getSavedSelections();

  /// Provides a stream of real-time odds updates.
  Stream<OddsUpdate> get oddsUpdates;

  /// Saves a user's selection.
  Future<void> saveSelection(String matchId, String oddsKey);
  
  /// Removes a user's selection.
  Future<void> removeSelection(String matchId);
  
  /// Disposes of any active resources like streams.
  void dispose();
}

/// The concrete implementation of [MatchRepository].
///
/// It coordinates data between the remote data source (for matches)
/// and the local data source (for user selections).
class MatchRepositoryImpl implements MatchRepository {
  final MatchRemoteDataSource _remoteDataSource;
  final SelectionLocalDataSource _localDataSource;

  MatchRepositoryImpl({
    required MatchRemoteDataSource remoteDataSource,
    required SelectionLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<List<MatchModel>> getMatches() => _remoteDataSource.getMatches();

  @override
  Stream<OddsUpdate> get oddsUpdates => _remoteDataSource.oddsUpdates;

  @override
  Future<Map<String, String>> getSavedSelections() => _localDataSource.getSelectedOdds();

  @override
  Future<void> saveSelection(String matchId, String oddsKey) =>
      _localDataSource.saveSelectedOdd(matchId, oddsKey);
      
  @override
  Future<void> removeSelection(String matchId) =>
      _localDataSource.removeSelectedOdd(matchId);
      
  @override
  void dispose() {
    _remoteDataSource.dispose();
  }
}
