// ignore_for_file: unused_local_variable

import 'package:chat_app/pages/cubit/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> userRegister(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseException catch (ex) {
      emit(RegisterFailure(errorMessage: ex.code));
    } catch (e) {
      emit(RegisterFailure(errorMessage: e.toString()));
    }
  }
}
