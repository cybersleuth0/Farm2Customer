abstract class LoginEvent {}

class Login_User_BTNPressed_Event extends LoginEvent {
  String mail;
  String pass;

  Login_User_BTNPressed_Event({required this.mail, required this.pass});
}