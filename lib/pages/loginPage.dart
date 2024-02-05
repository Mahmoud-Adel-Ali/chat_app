// ignore_for_file: use_build_context_synchronously, unused_local_variable, must_be_immutable

import 'package:chat_app/constant.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/pages/chatPage.dart';
import 'package:chat_app/pages/cubit/chat_cubit.dart';
import 'package:chat_app/pages/cubit/login_cubit.dart';
import 'package:chat_app/pages/cubit/login_state.dart';
import 'package:chat_app/pages/registerPage.dart';
import 'package:chat_app/pages/widgets/customButon.dart';
import 'package:chat_app/pages/widgets/customFormTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static String id = "loginpage";
  bool isLoading = false;
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errorMessage);
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
        
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
                    "LOGIN",
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
                  CustomButon(
                    text: "Login",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context)
                            .userlogin(email: email!, password: password!);
                      } else {
                        showSnackBar(context,
                            "you should fill this form befor register");
                      }
                    },
                  ),
                  const SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("If you wont have an account click "),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
