import 'package:farm2customer/data/local/db_helper.dart';
import 'package:farm2customer/data/model/usermodel.dart';

class Userrepository {
  // DBHelper instance for database operations
  DBHelper dbConnector;
  // Constructor to initialize the DBHelper instance
  Userrepository({required this.dbConnector});

  // Method to register a new user
  Future<bool> registerNewUser({required UserModel newuser}) async {
    // Calls the dbConnector's registerUser method to add the user to the database
    // Returns true if registration is successful, false otherwise
    bool isWorked = await dbConnector.registerUser(newUser: newuser);
    return isWorked;
  }

  // Method to log in a user
  Future<bool> loginuser(
      {required String newMail, required String newPass}) async {
    // Calls the dbConnector's loginUser method to authenticate the user
    // Takes the user's email and password as input
    // Returns true if login is successful, false otherwise
    bool isWorked =
        await dbConnector.loginUser(mail: newMail, password: newPass);
    return isWorked;
  }

  // Method to check if a user already exists in the database
  Future<bool> isUserAlreadyinDB({required String newMail}) async {
    // Calls the dbConnector's isUserAlreadyExist method to check for the user's existence
    // Takes the user's email as input
    // Returns true if the user exists, false otherwise
    bool isWorked = await dbConnector.isUserAlreadyExist(mail: newMail);
    return isWorked;
  }
}
