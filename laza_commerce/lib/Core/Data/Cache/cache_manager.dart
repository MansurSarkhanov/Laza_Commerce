import 'package:shared_preferences/shared_preferences.dart';

final class CacheManager {
  Future<void> saveString({required String key, required String value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> readString({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> saveBool({required String key, required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<bool?> readBool({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}
