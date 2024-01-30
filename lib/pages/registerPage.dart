import 'package:chat_app/constant.dart';
import 'package:chat_app/pages/loginPage.dart';
import 'package:chat_app/pages/widgets/customButon.dart';
import 'package:chat_app/pages/widgets/customFormTextField.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = 'register page';
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
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
                const Text(
                  "REGISTER",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 10),
                CustomFormTextField(
                  hintText: "email",
                  onChange: (text) {
                    email = text;
                  },
                ),
                const SizedBox(height: 40),
                CustomFormTextField(
                  hintText: "password",
                  onChange: (text) {
                    password = text;
                  },
                  obscureText: true,
                ),
                const SizedBox(height: 70),
                CustomButon(text: "Register",onTap: (){},),
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("If you have an account click "),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginPage.id);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}