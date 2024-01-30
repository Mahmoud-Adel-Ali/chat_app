import 'package:chat_app/pages/loginPage.dart';
import 'package:chat_app/pages/registerPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        routes: {
          LoginPage.id: (context) => const LoginPage(),
          RegisterPage.id: (context) => const RegisterPage(),
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
