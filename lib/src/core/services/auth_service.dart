import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_model.dart';
import '../models/user.dart';

class AuthService {
  Future<User?> hasLoggedUser() async {
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();

    final userLogged = prefs.getString('@app-teste-rotas');

    if (userLogged == null || userLogged == '') {
      return null;
    }

    return User.fromJson(userLogged);
  }

  Future signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('@app-teste-rotas', '');
  }

  Future<User?> signIn({required LoginModel loginModel}) async {
    try {
      await Future.delayed(const Duration(seconds: 3));

      if (loginModel.email == 'prussdev@gmail.com' &&
          loginModel.password == '123') {
        final prefs = await SharedPreferences.getInstance();

        final userLogged = {
          "id": 1,
          "name": "Mauricio Duarte",
          "email": "prussdev@gmail.com",
        };

        await prefs.setString('@app-teste-rotas', jsonEncode(userLogged));

        return User.fromMap(userLogged);
      } else {
        throw Error();
      }
    } catch (err) {
      throw Error();
    }
  }
}
