// ignore_for_file: unused_local_variable, avoid_print

import 'package:chat_app/pages/blocs/auth_bloc/auth_event.dart';
import 'package:chat_app/pages/blocs/auth_bloc/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(LoginSuccess());
        } on FirebaseException catch (ex) {
          emit(LoginFailure(errorMessage: ex.code));
        } catch (e) {
          emit(LoginFailure(
              errorMessage: "some thing went wrong please try again"));
        }
      } else if (event is RegisterEvent) {
        emit(RegisterLoading());
        try {
          UserCredential user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(RegisterSuccess());
        } on FirebaseException catch (ex) {
          emit(RegisterFailure(errorMessage: ex.code));
        } catch (e) {
          emit(RegisterFailure(
              errorMessage: "some thing went wrong please try again"));
        }
      }
    });
  }

//
  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print(transition);
  }

  //
  @override
  void onChange(Change<AuthState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
