import 'package:myapp/domain/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('userId',user.userId);
    prefs.setString('email',user.email);
    prefs.setString('token',user.token);

    return prefs.commit();

  }

  Future<User> getUser ()  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var userId = prefs.getInt("userId");
    var email = prefs.getString("email");
    var token = prefs.getString("token");
    var renewalToken = prefs.getString("renewalToken");

    return User(
        userId: userId,
        email: email,
        token: token,
        renewalToken: renewalToken);

  }

  void removeUser() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('userId');
    prefs.remove('email');
    prefs.remove('token');

  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }

}