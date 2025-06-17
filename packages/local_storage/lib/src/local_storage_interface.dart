abstract final class CacheKeys {
  static const String selectedOdds = 'selected_odds';
}


abstract interface class LocalStorage {
  /// Initializes the storage engine. Must be called before any other method.
  Future<void> init();


  Future<T?> get<T>(String key);

  Future<void> store<T>(String key, T value);

  Future<void> delete(String key);

  Future<bool> has(String key);
}