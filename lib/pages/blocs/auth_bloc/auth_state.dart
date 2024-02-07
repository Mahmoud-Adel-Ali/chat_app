abstract class AuthState {}

//initial
class AuthInitial extends AuthState {}

//Login
class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  String errorMessage;
  LoginFailure({required this.errorMessage});
}

//Register

class RegisterSuccess extends AuthState {}

class RegisterFailure extends AuthState {
  String errorMessage;
  RegisterFailure({required this.errorMessage});
}

class RegisterLoading extends AuthState {}
