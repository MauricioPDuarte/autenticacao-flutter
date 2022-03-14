import 'package:flutter/material.dart';
import 'package:rotas/src/core/stores/auth_store.dart';

import '../../core/stores/auth_state.dart';

class SplashPage extends StatefulWidget {
  final AuthStore authStore;

  const SplashPage({required this.authStore, Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void listenerAuth() {
    if (widget.authStore.value is SuccessAuthState) {
      Navigator.pushReplacementNamed(context, "/dashboard");
    } else if (widget.authStore.value is UnauthenticatedAuthState) {
      Navigator.pushReplacementNamed(context, "/signin");
    }
  }

  void initState() {
    super.initState();

    widget.authStore.hasLoggedUser();
    widget.authStore.addListener(listenerAuth);
  }

  @override
  void dispose() {
    super.dispose();
    widget.authStore.removeListener(listenerAuth);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
