import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService extends GetxService {
  late final SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
  }

  T? getValue<T>(String key, [T Function(Map<String, dynamic>)? fromJson]) {
    switch (T) {
      case const (int):
        return prefs.getInt(key) as T?;
      case const (double):
        return prefs.getDouble(key) as T?;
      case const (String):
        return prefs.getString(key) as T?;
      case const (bool):
        return prefs.getBool(key) as T?;
      default:
        assert(fromJson != null, 'fromJson must be provided for Object values');
        if (fromJson != null) {
          final stringObject = prefs.getString(key);
          if (stringObject == null) return null;
          final jsonObject = jsonDecode(stringObject) as Map<String, dynamic>;
          return fromJson(jsonObject);
        }
    }
    return null;
  }

  void setValue<T>(String key, T value) {
    switch (T) {
      case const (int):
        prefs.setInt(key, value as int);
        break;
      case const (double):
        prefs.setDouble(key, value as double);
        break;
      case const (String):
        prefs.setString(key, value as String);
        break;
      case const (bool):
        prefs.setBool(key, value as bool);
        break;
      default:
        assert(
          value is Map<String, dynamic>,
          'value must be int, double, String, bool or Map<String, dynamic>',
        );
        final stringObject = jsonEncode(value);
        prefs.setString(key, stringObject);
    }
  }
}
