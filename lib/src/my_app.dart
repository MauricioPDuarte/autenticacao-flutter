import 'package:flutter/material.dart';
import 'package:rotas/src/core/routes/app_routes.dart';
import 'package:rotas/src/core/services/auth_service.dart';
import 'package:rotas/src/core/stores/auth_store.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRoutes appRoute = AppRoutes(
      authStore: AuthStore(
    authService: AuthService(),
  ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: appRoute.route,
    );
  }
}
