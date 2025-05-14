import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static late SharedPreferences prefs;

  static set isFirstLaunch(bool isFirstLaunch) => prefs.setBool("isFirstLaunch", isFirstLaunch);
  static bool get isFirstLaunch => prefs.getBool("isFirstLaunch") ?? true;

  static set isLoggedIn(bool isLoggedIn) => prefs.setBool("isLoggedIn", isLoggedIn);
  static bool get isLoggedIn => prefs.getBool("isLoggedIn") ?? false;

  static set email(String email) => prefs.setString("email", email);
  static String get email => prefs.getString("email") ?? '';

  static set userId(String userId) => prefs.setString("userId", userId);
  static String get userId => prefs.getString("userId") ?? '';

  static set hasBiometrics(bool hasBiometrics) => prefs.setBool("hasBiometrics", hasBiometrics);
  static bool get hasBiometrics => prefs.getBool("hasBiometrics") ?? false;

  static set isNewLogin(bool isNewLogin) => prefs.setBool("isNewLogin", isNewLogin);
  static bool get isNewLogin => prefs.getBool("isNewLogin") ?? false;

  static void clear() {
    prefs.clear();
  }

// Init Shared Preference
  static Future<SharedPreferences> init() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }
}
