import 'package:local_storage/local_storage.dart';

abstract interface class SelectionLocalDataSource {
  /// The map format is { "matchId": "selectedOddsKey" }, e.g., { "match_1": "1" }.
  Future<Map<String, String>> getSelectedOdds();

  Future<void> saveSelectedOdd(String matchId, String oddsKey);

  Future<void> removeSelectedOdd(String matchId);
}

/// An implementation of [SelectionLocalDataSource] that uses the provided
/// [LocalStorage] interface.
class SelectionLocalDataSourceImpl implements SelectionLocalDataSource {
  final LocalStorage _localStorage;

  SelectionLocalDataSourceImpl(this._localStorage);

  @override
  Future<Map<String, String>> getSelectedOdds() async {
    final result = await _localStorage.get<Map<String, dynamic>>(CacheKeys.selectedOdds);

    return result?.map((key, value) => MapEntry(key, value.toString())) ?? {};
  }

  @override
  Future<void> saveSelectedOdd(String matchId, String oddsKey) async {
    final currentSelections = await getSelectedOdds();
    currentSelections[matchId] = oddsKey;
    await _localStorage.store(CacheKeys.selectedOdds, currentSelections);
  }
  
  @override
  Future<void> removeSelectedOdd(String matchId) async {
      final Map<String, String> currentSelections = await getSelectedOdds();

      currentSelections.remove(matchId);

      await _localStorage.store(CacheKeys.selectedOdds, currentSelections);
  }
}