/// Abstract base class for all login states.
abstract class LoginState {}

/// Initial state of the login process.
class LoginInitial_State extends LoginState {}

/// State indicating that the login process is currently loading.
class LoginLoading_State extends LoginState {}

/// State indicating that the login process failed.
class LoginFailure_State extends LoginState {
  /// Error message describing the reason for the login failure.
  String errorMSG;

  /// Constructor for [LoginFailure_State] with a required error message.
  LoginFailure_State({required this.errorMSG});
}

/// State indicating that the login process was successful.
class LoginSuccess_State extends LoginState {}