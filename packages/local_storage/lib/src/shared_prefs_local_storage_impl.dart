import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'local_storage_interface.dart';

class SharedPrefsLocalStorage implements LocalStorage {
  late final SharedPreferences _prefs;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<T?> get<T>(String key) async {
    if (!_prefs.containsKey(key)) return null;

    if (T is Map<String, dynamic> || T is Map<String, String>) {
      final jsonString = _prefs.getString(key);
      if (jsonString != null) {
        return json.decode(jsonString) as T;
      }
      return null;
    }

    return _prefs.get(key) as T?;
  }

  @override
  Future<void> store<T>(String key, T value) {
    // Based on the runtime type of the value, call the appropriate setter.
    switch (T) {
      case String:
        return _prefs.setString(key, value as String);
      case int:
        return _prefs.setInt(key, value as int);
      case double:
        return _prefs.setDouble(key, value as double);
      case bool:
        return _prefs.setBool(key, value as bool);
      case const (List<String>):
        return _prefs.setStringList(key, value as List<String>);
      default:
        // For any other type (like Maps), we encode it as a JSON string.
        if (value is Map) {
          return _prefs.setString(key, json.encode(value));
        }
        // Throw an error for unsupported types.
        throw ArgumentError('Unsupported type: $T');
    }
  }

  @override
  Future<void> delete(String key) {
    return _prefs.remove(key);
  }

  @override
  Future<bool> has(String key) {
    return Future.value(_prefs.containsKey(key));
  }
}