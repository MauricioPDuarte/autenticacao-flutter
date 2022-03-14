import 'package:flutter/cupertino.dart';
import 'package:rotas/src/core/models/login_model.dart';
import 'package:rotas/src/core/services/auth_service.dart';
import 'package:rotas/src/core/stores/auth_state.dart';

import '../models/user.dart';

class AuthStore extends ValueNotifier<AuthState> {
  User? user;
  final AuthService authService;

  AuthStore({required this.authService}) : super(InitialAuthState());

  void hasLoggedUser() async {
    user = await authService.hasLoggedUser();

    if (user != null) {
      value = SuccessAuthState();
    } else {
      value = UnauthenticatedAuthState();
    }
  }

  Future signIn(LoginModel loginModel) async {
    value = LoadingAuthState();
    try {
      user = await authService.signIn(loginModel: loginModel);

      value = SuccessAuthState();
    } catch (e) {
      value = ErrorAuthState(message: "Usuario ou senha incorretos!");
    }
  }

  Future signOut() async {
    await authService.signOut();
    value = UnauthenticatedAuthState();
  }
}
