import 'package:shared_preferences/shared_preferences.dart';

class Sharedperfernace {
  static Future<void> setString(String keyname, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyname, value);
  }

  static Future<String?> getString(String keyname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(keyname);
    return value;
  }

  static Future<void> setbool(String keyname, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyname, value);
  }

  static Future<bool?> getbool(String keyname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool(keyname);
    return value;
  }

  static Future<void> setint(String keyname, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(keyname, value);
  }

  static Future<int?> getint(String keyname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? value = prefs.getInt(keyname);
    return value;
  }
}
