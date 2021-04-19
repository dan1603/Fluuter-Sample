import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Cookies {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static final String cookie = "preferencesCookie";

  Future<Map<String, String>> get() async {
    Map<String, String> headers = {};
    final SharedPreferences prefs = await _prefs;
    headers['cookie'] = prefs.getString(cookie);
    return headers;
  }

  void save(http.Response response) async {
    final SharedPreferences prefs = await _prefs;
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      var arr = rawCookie.split(";");
      var result = "";
      arr.forEach((element) {
        print("[] $element");
        if (element.contains("__cfduid")) {
          result += element;
        }
        if (element.contains("path=/,PHPSESSID")) {
          if (result.isNotEmpty) {
            result += ";";
          }
          result += element.replaceAll("path=/,", "");
        }
      });
      prefs.setString(cookie, result);
    }
  }

}