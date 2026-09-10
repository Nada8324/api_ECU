import 'package:doctors_app/features/login/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
 static Future<void> saveUser(UserModel model) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("name", model.name);
    prefs.setString("token", model.token);
  }

 static Future<String> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("name") ?? "user";
  }

 static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

 static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("name");
    prefs.remove("token");
  }
}
