
import 'package:shared_preferences/shared_preferences.dart';

class SharedP {
  Future<bool> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogged') ?? false;
  }

  void setData(bool data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogged', data);
  }

  Future<String> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? '';
  }

  void setUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }
}
