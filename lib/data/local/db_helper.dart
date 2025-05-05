import 'dart:io';

import 'package:farm2customer/App_Constant/constant.dart';
import 'package:farm2customer/data/model/usermodel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

/// [DBHelper] class for managing the local SQLite database.
class DBHelper {
  /// Database name.
  static const _databaseName = "farm2customer.db";

  /// Database version.
  static const _databaseVersion = 1;

  ///---------------------------- User Table ----------------------------------
  /// Table name for user data.
  static const String userTableName = 'user';

  /// Primary key column for user table. Auto-incrementing integer.
  static const String userIdColumn = 'user_id';

  /// user name column. Text field for storing the user's full name.
  static const String userNameColumn = 'user_name';

  /// user email column. Text field for storing the user's email address.
  static const String userEmailColumn = 'user_email';

  /// user password column. Text field for storing the user's password.
  static const String userPasswordColumn = 'user_password';

  /// user phone column. Text field for storing the user's phone number.
  static const String userPhoneColumn = 'user_phone';

  ///-------------------------------------------------------------------------

  ///---------------------------- Product Table ------------------------------
  /// Table name for product data.
  static const String productTableName = 'product';

  /// Primary key column for product table. Auto-incrementing integer.
  /// Column name for product's ID.
  static const String productIdColumn = 'id';

  /// Column name for product's name.
  static const String productNameColumn = 'product_name';

  /// Column name for product's description.
  static const String productDescriptionColumn = 'product_description';

  /// Column name for product's price.
  static const String productPriceColumn = 'product_price';

  /// Column name for product's category.
  static const String productCategoryColumn = 'product_category';

  /// Column name for product's image.
  static const String productImageColumn = 'product_image';

  ///-------------------------------------------------------------------------

  /// Private constructor to prevent direct instantiation.
  DBHelper._();

  /// Singleton instance getter.
  static DBHelper getInstance() => DBHelper._();

  /// Database instance.
  static Database? _database;

  /// Getter for the database instance, opens the database if not already opened.
  Future<Database> getDB() async {
    _database ??= await openDb();
    return _database!;
  }

  /// Opens the database, creating it if it doesn't exist.
  Future<Database> openDb() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String dbpath = join(appDocDir.path, _databaseName);
    return await openDatabase(
      dbpath,
      version: _databaseVersion,
      // Create the tables if they don't exist.
      onCreate: (db, version) {
        // Create the 'user' table.
        db.execute(
            "CREATE TABLE IF NOT EXISTS $userTableName ($userIdColumn INTEGER PRIMARY KEY AUTOINCREMENT, "
            "$userNameColumn TEXT, $userEmailColumn TEXT, $userPasswordColumn TEXT, $userPhoneColumn TEXT)");
        // Create the 'product' table.
        db.execute("CREATE TABLE IF NOT EXISTS $productTableName ("
            "$productIdColumn INTEGER PRIMARY KEY AUTOINCREMENT, $productNameColumn TEXT, "
            "$productDescriptionColumn TEXT, $productPriceColumn REAL, "
            "$productCategoryColumn TEXT, $productImageColumn TEXT)");
      },
    );
  }

  ///---------------------------- Register User ------------------------------
  /// [registerUser] method to add a new user to the database.
  Future<bool> registerUser({required UserModel newUser}) async {
    // Get the database instance.
    var db = await getDB();
    // Insert the new user into the 'user' table.
    int rowEffected = await db.insert(userTableName, newUser.toMap());
    // If rows effected is greater then 0 it's return true
    // if not it's return false

    return rowEffected > 0;
  }

  ///---------------------------- Check User Existence ------------------
  /// [isUserAlreadyExist] method to check if a user with the given email already exists in the database.
  ///
  /// This method queries the 'user' table for an email address and returns true if user already exists.
  ///
  /// Parameters:
  ///   - [mail]: The email address to check for existence.
  Future<bool> isUserAlreadyExist({required String mail}) async {
    // Get the database instance.
    var db = await getDB();
    // Query the 'user' table where the email matches the provided 'mail'.
    // Returns a List<Map<String,dynamic>>
    List<Map<String, dynamic>> ans = await db
        .query(userTableName, where: "$userEmailColumn=?", whereArgs: [mail]);
    return ans.isNotEmpty;
  }

  ///---------------------------- Login User ---------------------------------
  /// [loginUser] method to authenticate a user with their email and password.
  ///
  /// This method queries the 'user' table to find a user with the provided email and password.
  /// It returns true if a matching user is found, indicating a successful login.
  ///
  /// Parameters:
  ///   - [mail]: The email address of the user attempting to log in.
  ///   - [password]: The password of the user attempting to log in.
  ///
  /// Returns:
  ///   - A [Future<bool>] that resolves to true if a matching user is found (successful login), false otherwise.
  Future<bool> loginUser(
      {required String mail, required String password}) async {
    var db = await getDB(); //get database instance.
    List<Map<String, dynamic>> ans = await db.query(userTableName,
        where:
            "$userEmailColumn=? AND $userPasswordColumn=?", //Query the 'user' table where the email and password match the provided credentials.
        whereArgs: [mail, password]);
    if (ans.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt(
          AppConstant.isLogedIN, UserModel.fromMap(ans[0]).user_id ?? 0);
    }
    return ans.isNotEmpty;
  }
}
