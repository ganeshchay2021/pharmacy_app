import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static String userIDKey = "USERIDKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";

  Future<bool> saveUserId(String setUserId) async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    return prefes.setString(userIDKey, setUserId);
  }

  Future<bool> saveUserName(String setUserName) async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    return prefes.setString(userNameKey, setUserName);
  }

  Future<bool> saveUserEmail(String setUserEmail) async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    return prefes.setString(userEmailKey, setUserEmail);
  }

  Future<String?> getUserId() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    return prefes.getString(userIDKey);
  }

  Future<String?> getUserName() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    return prefes.getString(userNameKey);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    return prefes.getString(userEmailKey);
  }
}
