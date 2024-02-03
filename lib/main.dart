import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/chatPage.dart';
import 'package:chat_app/pages/cubit/login_cubit.dart';
import 'package:chat_app/pages/home.dart';
import 'package:chat_app/pages/loginPage.dart';
import 'package:chat_app/pages/registerPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => LoginCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          routes: {
            HomePage.id: (context) => const HomePage(),
            ChatPage.id: (context) =>  ChatPage(),
            LoginPage.id: (context) =>  LoginPage(),
            RegisterPage.id: (context) => const RegisterPage(),
          },
          initialRoute: HomePage.id,
        ),
      ),
    );
  }
}
