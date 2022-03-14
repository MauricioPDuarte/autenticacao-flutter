import 'package:flutter/material.dart';
import 'package:rotas/src/core/stores/auth_store.dart';
import 'package:rotas/src/modules/dashboard/dashboard.dart';
import 'package:rotas/src/modules/sign_in/sign_in_page.dart';
import 'package:rotas/src/modules/splash/splash_page.dart';

import '../../modules/sign_up/sing_up_page.dart';

class AppRoutes {
  final AuthStore authStore;

  AppRoutes({required this.authStore});

  Route<dynamic> route(RouteSettings setting) {
    var route = setting.name;

    Widget? page;

    switch (route) {
      case '/signin':
        page = SignInPage(authStore: authStore);
        break;
      case '/signup':
        page = const SignUpPage();
        break;
      case '/dashboard':
        page = Dashboard(authStore: authStore);
        break;
      default:
        page = SplashPage(authStore: authStore);
    }

    return MaterialPageRoute(builder: (context) => page!, settings: setting);
  }
}
