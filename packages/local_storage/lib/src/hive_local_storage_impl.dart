import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'local_storage_interface.dart';

class HiveLocalStorage implements LocalStorage {
  late final Box<dynamic> _appBox;
  static const _boxName = 'app_storage_box';

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _appBox = await Hive.openBox(_boxName);
  }

  @override
  Future<T?> get<T>(String key) async {
    if (!_appBox.containsKey(key)) return null;

    final dynamic value = _appBox.get(key);
    
    if (T == (Map<String, dynamic>) || T == Map<String, String>) {
       return json.decode(value as String) as T;
    }

    return value as T?;
  }

  @override
  Future<void> store<T>(String key, T value) {
    if (value is Map) {
      return _appBox.put(key, json.encode(value));
    }
    return _appBox.put(key, value);
  }

  @override
  Future<void> delete(String key) {
    return _appBox.delete(key);
  }

  @override
  Future<bool> has(String key) {
    return Future.value(_appBox.containsKey(key));
  }
}