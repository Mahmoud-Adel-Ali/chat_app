//
// ignore_for_file: unused_local_variable

import 'package:chat_app/pages/cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> userlogin(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseException catch (ex) {
      emit(LoginFailure(errorMessage: ex.code));
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }
}
