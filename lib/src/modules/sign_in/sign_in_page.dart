import 'package:flutter/material.dart';
import 'package:rotas/src/core/stores/auth_state.dart';

import '../../core/models/login_model.dart';
import '../../core/stores/auth_store.dart';

class SignInPage extends StatefulWidget {
  final AuthStore authStore;

  const SignInPage({required this.authStore, Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void listenerAuth() {
    if (widget.authStore.value is SuccessAuthState) {
      Navigator.pushReplacementNamed(context, "/dashboard");
    } else if (widget.authStore.value is ErrorAuthState) {
      var value = widget.authStore.value as ErrorAuthState;

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(value.message)));
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
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: [
            const Center(
              child: Text("Login"),
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(label: Text("E-mail")),
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(label: Text("Senha")),
            ),
            ValueListenableBuilder(
                valueListenable: widget.authStore,
                builder: (_, state, child) {
                  return OutlinedButton(
                    onPressed: state is LoadingAuthState
                        ? null
                        : () => {
                              widget.authStore.signIn(
                                LoginModel(
                                    email: email.text, password: password.text),
                              )
                            },
                    child: state is LoadingAuthState
                        ? const CircularProgressIndicator()
                        : const Text("Entrar"),
                  );
                }),
            TextButton(
              onPressed: () => {Navigator.pushNamed(context, '/signup')},
              child: const Text("Ainda nao possui uma conta? Cadastre-se"),
            )
          ],
        ),
      ),
    );
  }
}
