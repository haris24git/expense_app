import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../models/expenses_model.dart';
import '../models/user_model.dart';

class DBHelper {
  ///singleton class
  /// 1 creating a private constructor
  DBHelper._();

  /// 2 globally distribute
  static DBHelper getInstance() => DBHelper._();

  ///getDB
  Database? mDB;

  //USERS Table
  static final String DB_USER_TABLE = "USERS";
  static final String TBL_USER_UID = "UID";
  static final String TBL_USER_UNAME = "USERNAME";
  static final String TBL_USER_PASSWRD = "PASSWORD";
  static final String TBL_USER_UEMAIL = "USR_EMAIL";
  static final String TBL_USER_MOB = "USR_MOBILE";
  static final String TBL_USER_CREATED_AT = "CREATED_AT";

  //EXPENSE Table
  static final String DB_EXPENSES_TABLE = "EXPENSE";
  static final String TBL_EXPENSE_EID = "EID";
  static final String TBL_EXPENSE_UID = "UID";
  static final String TBL_EXPENSE_TITLE = "TITLE";
  static final String TBL_EXPENSE_DESC = "DESC";
  static final String TBL_EXPENSE_AMOUNT = "AMOUNT";
  static final String TBL_EXPENSE_BALANCE = "BALANCE";
  static final String TBL_EXPENSE_TYPE = "TYPE";
  static final String TBL_EXPENSE_CAT_ID = "CAT_ID";
  static final String TBL_EXPENSE_CREATED_AT = "CREATED_AT";

  //Category Table
  static final String DB_CATEGORY_TABLE = "CATEGORY";
  static final String TBL_CATEGORY_CAT_ID = "CAT_ID";
  static final String TBL_CATEGORY_TITLE = "CAT_TITLE";
  static final String TBL_CATEGORY_IMAGE = "CAT_IMAGE";

  Future<Database> getDB() async {
    mDB ??= await openDB();
    return mDB!;
  }

  Future<Database> openDB() async {
    var appDir = await getApplicationDocumentsDirectory();
    var dbPath = join(appDir.path, "expenses.db");

    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      /// create all your tables here
      /// Create User Table
      db.execute(
          "create table $DB_USER_TABLE ( $TBL_USER_UID integer primary key autoincrement, $TBL_USER_UNAME text not null, $TBL_USER_PASSWRD text not null, $TBL_USER_UEMAIL text not null, $TBL_USER_MOB text not null, $TBL_USER_CREATED_AT text not null)");

      /// Create Expenses Table
      db.execute(
          "create table $DB_EXPENSES_TABLE ( $TBL_EXPENSE_EID integer primary key autoincrement,$TBL_EXPENSE_UID integer not null, $TBL_EXPENSE_TITLE text not null, $TBL_EXPENSE_DESC text not null, $TBL_EXPENSE_AMOUNT real not null, $TBL_EXPENSE_BALANCE real not null, $TBL_EXPENSE_TYPE text not null, $TBL_EXPENSE_CAT_ID integer not null, $TBL_EXPENSE_CREATED_AT text not null)");

      /// Create Category Table
      ///db.execute("create table $DB_CATEGORY_TABLE ( $TBL_CATEGORY_CAT_ID integer primary key autoincrement, $TBL_CATEGORY_TITLE text not null, $TBL_CATEGORY_IMAGE text not null)");
    });
  }

  ///queries
  ///register User
  Future<bool> registerUser({required UserModel user}) async {
    var db = await getDB();
    //if(!await isUserAlreadyRegistered(email: user.uEmail,)){
    int rowsEffected = await db.insert(DB_USER_TABLE, user.toMap());
    return rowsEffected > 0;
    //} else {
    return false;
    //}
  }

  ///check if user already exists
  Future<bool> isUserAlreadyRegistered({required String email}) async {
    var db = await getDB();

    List<Map<String, dynamic>> mData = await db.query(DB_USER_TABLE,
        where: "$TBL_USER_UEMAIL = ?", whereArgs: [email]);

    return mData.isNotEmpty;
    /*if(mData.isNotEmpty){
      return true;
    } else {
      return false;
    }*/
  }

  // Future<bool> registerUser({required UserModel user}) async {
  //   var db = await getDB();
  //
  //   // If your exist already check
  //   if (await isUserAlreadyRegistered(email: user.uEmail)) {
  //     return false; // User not exit then user will register
  //   }
  //
  //   int rowsEffected = await db.insert(DB_USER_TABLE, user.toMap());
  //   return rowsEffected > 0;
  // }


  /// authenticate user
  Future<bool> authenticateUser({required String email, required String pass}) async {
    var db = await getDB();

    List<Map<String, dynamic>> mData = await db.query(DB_USER_TABLE,
        where: "$TBL_USER_UEMAIL = ? AND $TBL_USER_PASSWRD = ?",
        whereArgs: [email, pass]);

    /// to manage session store uid in Shared prefs
    if(mData.isNotEmpty){
      print("${mData[0][TBL_USER_UID]}");
      var prefs = await SharedPreferences.getInstance();
      prefs.setInt("UID", mData[0][TBL_USER_UID]);
    }

    return mData.isNotEmpty;
  }

  Future<bool> addExpense({required ExpensesModel expense}) async {

    var db = await getDB();

    int rowsEffected = await db.insert(DB_EXPENSES_TABLE, expense.toMap());

    return rowsEffected>0;
  }

  Future<List<ExpensesModel>> fetchExpense() async{
    var db = await getDB();

    List<Map<String, dynamic>> mData = await db.query(DB_EXPENSES_TABLE, orderBy: "$TBL_EXPENSE_CREATED_AT DESC");

    List<ExpensesModel> mExpenses = [];

    for(Map<String, dynamic> eachExp in mData){
      mExpenses.add(ExpensesModel.fromMap(eachExp));
    }

    return mExpenses;
  }

}