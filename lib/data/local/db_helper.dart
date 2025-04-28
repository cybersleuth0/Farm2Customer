import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/// [DBHelper] class for managing the local SQLite database.
class DBHelper {
  /// Database name.
  static const _databaseName = "farm2customer.db";

  /// Database version.
  static const _databaseVersion = 1;

  /// Table name for user data.
  static const String userTableName = 'user';

  /// Column name for user's name.
  static const String userNameColumn = 'user_name';

  /// Column name for user's email.
  static const String userEmailColumn = 'user_email';

  /// Column name for user's password.
  static const String userPasswordColumn = 'user_password';

  /// Column name for user's phone number.
  static const String userPhoneColumn = 'user_phone';

  /// Table name for product data.
  static const String tableName = 'product';

  /// Column name for product's ID.
  static const String idColumn = 'id';

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
        db.execute("CREATE TABLE IF NOT EXISTS $userTableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, "
            "$userNameColumn TEXT, $userEmailColumn TEXT, $userPasswordColumn TEXT, $userPhoneColumn TEXT)");
        // Create the 'product' table.
        db.execute("CREATE TABLE IF NOT EXISTS $tableName ("
            "$idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $productNameColumn TEXT, "
            "$productDescriptionColumn TEXT, $productPriceColumn REAL, "
            "$productCategoryColumn TEXT, $productImageColumn TEXT)");
      },
    );
  }

}
