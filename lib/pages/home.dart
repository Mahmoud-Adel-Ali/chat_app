import 'package:chat_app/constant.dart';
import 'package:chat_app/pages/loginPage.dart';
import 'package:chat_app/pages/registerPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = "home page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        children: [
          const SizedBox(height: 70),
          Image.asset(
            "assets/images/scholar.png",
            height: 100,
          ),
          const SizedBox(height: 70),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text(
              "Scholar chat",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  fontFamily: "pacifico"),
            ),
          ),
          const SizedBox(height: 70),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, LoginPage.id);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RegisterPage.id);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: const Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
