
import 'package:finance_flutter_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<int> getUserId() async {
    final SharedPreferences prefs = await _prefs;
    int id = prefs.getInt(Constant.prefUserId) ?? null;
    print("[Preference] UserID = $id");
    return id;
  }

  Future<bool> setUserId(int value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setInt(Constant.prefUserId, value);
  }

  Future<bool> isAuthenticated() async {
    final SharedPreferences prefs = await _prefs;
    bool authState = prefs.getBool(Constant.prefAuthenticated) ?? false;
    return authState;
  }

  Future<bool> onAuth() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setBool(Constant.prefAuthenticated, true);
  }

  Future<bool> onLogout() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setBool(Constant.prefAuthenticated, false);
  }
}