// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:chat_app/constant.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/pages/cubit/register_cubit.dart';
import 'package:chat_app/pages/cubit/register_state.dart';
import 'package:chat_app/pages/loginPage.dart';
import 'package:chat_app/pages/widgets/customButon.dart';
import 'package:chat_app/pages/widgets/customFormTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  static String id = 'register page';

  bool isLoading = false;
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();

  RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          showSnackBar(context, "Register successesfull ❤❤");
          Navigator.pushNamed(context, LoginPage.id);
          isLoading = false;
        } else if (state is RegisterFailure) {
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
                  CustomButon(
                    text: "Register",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<RegisterCubit>(context)
                            .userRegister(email: email!, password: password!);
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
      ),
    );
  }
}
