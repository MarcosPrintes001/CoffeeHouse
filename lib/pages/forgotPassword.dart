// ignore_for_file: file_names, use_build_context_synchronously

import 'package:coffee_house/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void passWordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());

      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Um email foi enviado para você, verifique sua caixa de entrada ou spam"),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(e.code),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                "Adicione seu email para redefinir sua senha",
                textAlign: TextAlign.center,
              ),
            ),
            MyTextField(
              controller: _emailController,
              hintText: 'email',
              obscureText: false,
            ),
            MaterialButton(
              onPressed: passWordReset,
              color: Colors.brown,
              child: const Text("Resetar Senha"),
            ),
          ],
        ),
      ),
    );
  }
}
