abstract class LoginState {}

class LoginInitial_State extends LoginState {}

class LoginLoading_State extends LoginState {}

class LoginFailure_State extends LoginState {
  String errorMSG;

  LoginFailure_State({required this.errorMSG});
}

class LoginSuccess_State extends LoginState {}