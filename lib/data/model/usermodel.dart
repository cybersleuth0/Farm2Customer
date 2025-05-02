import 'package:farm2customer/data/local/db_helper.dart';

class UserModel {
  int? user_id;

  /// Column name for user's name.
  String user_name;

  /// Column name for user's email.
  String user_email;

  /// Column name for user's password.
  String user_password;

  /// Column name for user's phone number.
  String user_phone;

  UserModel({
    this.user_id,
    required this.user_name,
    required this.user_email,
    required this.user_password, // Corrected: Removed invisible character
    required this.user_phone, // Corrected: Removed invisible character
  });

  /*
  Purpose: The toMap() function is primarily used when you want to insert a new UserModel object's data into the database.
  */
  Map<String, dynamic> toMap() {
    return {
      DBHelper.userIdColumn: user_id,
      DBHelper.userNameColumn: user_name,
      DBHelper.userEmailColumn: user_email,
      DBHelper.userPasswordColumn: user_password,
      DBHelper.userPhoneColumn: user_phone,
    };
  }

  /*
    Purpose: To convert from a Map to UserModel
  */
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        user_id: map[DBHelper.userIdColumn],
        user_name: map[DBHelper.userNameColumn],
        user_email: map[DBHelper.userEmailColumn],
        user_password: map[DBHelper.userPasswordColumn],
        user_phone: map[DBHelper.userPhoneColumn]);
  }
}
