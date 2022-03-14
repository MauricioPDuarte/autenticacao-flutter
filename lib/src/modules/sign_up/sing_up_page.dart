import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(
            child: Text("Cadastro"),
          ),
          OutlinedButton(
            onPressed: () => {Navigator.pushNamed(context, '/signin')},
            child: const Text("Voltar Login"),
          )
        ],
      ),
    );
  }
}
