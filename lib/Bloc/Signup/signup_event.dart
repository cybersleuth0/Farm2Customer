import 'package:farm2customer/data/model/usermodel.dart';

/// This is an abstract class for events in the registration process.
abstract class RegisterEvent {}

/// Represents an event for registering a new user.
// ignore: camel_case_types
class RegisterNewUserBTN_Event extends RegisterEvent {
  /// The new user model to be registered.
  /// 
  /// This contains the user details like name, email and password.
  UserModel newuser;
  /// Constructor for the RegisterNewUserBTN_Event
  RegisterNewUserBTN_Event({required this.newuser});
}


