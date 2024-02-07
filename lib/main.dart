// ignore_for_file: deprecated_member_use

import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/blocs/auth_bloc/auth_bloc.dart';
import 'package:chat_app/pages/chatPage.dart';
import 'package:chat_app/pages/cubit/chat_cubit.dart';
import 'package:chat_app/pages/home.dart';
import 'package:chat_app/pages/loginPage.dart';
import 'package:chat_app/pages/registerPage.dart';
import 'package:chat_app/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BlocOverrides.runZoned(
    () {
      runApp(const ScholarChat());
    },
    blocObserver: SimpleBlocObserver(),
  );
  // runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          // BlocProvider(create: (context) => LoginCubit(),),
          // BlocProvider(create: (context) => RegisterCubit(),),
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
          BlocProvider(
            create: (cntext) => ChatCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          routes: {
            HomePage.id: (context) => const HomePage(),
            ChatPage.id: (context) => ChatPage(),
            LoginPage.id: (context) => LoginPage(),
            RegisterPage.id: (context) => RegisterPage(),
          },
          initialRoute: HomePage.id,
        ),
      ),
    );
  }
}
