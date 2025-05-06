/// Abstract base class for all Login events.
/// Events are the actions that trigger state changes in the Bloc.
abstract class LoginEvent {}

/// Event triggered when the login button is pressed.
class Login_User_BTNPressed_Event extends LoginEvent {
  /// The email entered by the user.
  String mail;
  /// The password entered by the user.
  String pass;

  /// Constructs a [Login_User_BTNPressed_Event] with the provided email and password.
  Login_User_BTNPressed_Event({required this.mail, required this.pass});
}