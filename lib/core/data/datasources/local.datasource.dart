import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDatasource {
  static Future<String> saveString(String key, String str) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, str);
    return str;
  }

  static Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> removeKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
