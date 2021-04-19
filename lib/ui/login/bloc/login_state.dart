abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  final List<String> errorMessages;

  ErrorLoginState(this.errorMessages);
}

class SuccessfulLoginState extends LoginState {}