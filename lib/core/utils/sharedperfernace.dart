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
}