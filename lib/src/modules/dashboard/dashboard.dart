import 'package:flutter/material.dart';
import 'package:rotas/src/core/stores/auth_state.dart';
import 'package:rotas/src/core/stores/auth_store.dart';

class Dashboard extends StatefulWidget {
  final AuthStore authStore;

  const Dashboard({required this.authStore, Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void listenerAuth() {
    if (widget.authStore.value is UnauthenticatedAuthState) {
      Navigator.pushReplacementNamed(context, "/signin");
    }
  }

  @override
  void initState() {
    widget.authStore.addListener(listenerAuth);
    super.initState();
  }

  @override
  void dispose() {
    widget.authStore.removeListener(listenerAuth);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => {widget.authStore.signOut()},
              icon: const Icon(Icons.exit_to_app))
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text("Dashboard ${widget.authStore.user!.name}"),
      ),
    );
  }
}
