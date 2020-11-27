import '../constants.dart';

import '../models/transaction.dart';
import 'package:path/path.dart'
    as path; // will find the location or the path of database
import 'package:sqflite/sqflite.dart';

class DBHelper {
  //we will make one istance of this class
  //factory way
  // if there is an object it will use the same object
  // singleton design patterns

  //constructor return _instance
  factory DBHelper() => _instance;
  //named constructor return
  DBHelper.internal();

  // only one instance of our class
  static final DBHelper _instance = DBHelper.internal();

  //variable of database == come from import 'package:sqflite/sqflite.dart';
  static Database _database;
  static const String tableName = "transactionTable";

////working with methods /////
  //create database
  Future<Database> createDatabase() async {
    // check if variable _database => point to a real db
    if (_database != null) {
      // means there is an object
      return _database; // then return the existing database
    } else {
      //create database

      //1- defien path to get location of databse and it to it "bmi.db"
      String _path = path.join(await getDatabasesPath(), "transactions.db");

      //creating database
      // versions mean this is the first time i create database
      // version : if i need to upgrade this database i will make it 2
      // and so on
      _database = await openDatabase(
        _path,
        version: 1,
        //on create used for first time at version 1
        //if the database 'transctions.db' doesn't exist
        onCreate: (Database db, int v) {
          //creating all tables in database
          //execte usesd to write sql
          db.execute("""
            create table $tableName(
              id varchar(50) primary key ,
              title varchar(50),
              transactionType varchar(50),
              money DOUBLE,
              date TEXT )""");
        },
        //on upgrade used for if the databse 'transctions.db' exist
        // and the version you write above not the same the version exists
        //it higher than it
        //onUpgrade: ,

        //on downGrade used for if the databse 'transctions.db' exist
        // and the version not the same but lower than  the existing version
        //// onDowngrade: ,
        //before onupgrade or ondowngrade configre will run to make a relation
        //onConfigure :,
      );

      return _database;
    }
  }

  Future<int> insert(TransactionModel data) async {
    Database db = await createDatabase();
    print("before insert");
    return await db.insert(tableName, {
      'id': data.id,
      'title': data.title,
      'money': data.money,
      'transactionType': data.transactionType == TransactionType.Get
          ? getMoneyText
          : data.transactionType == TransactionType.Pay
              ? payMoneyText
              : otherMoneyText,
      'date': data.date.toIso8601String()
    });
  }

  Future<List<dynamic>> getAllTransactions() async {
    Database db = await createDatabase();

    //return await db.rawQuery("select * from tabelName").;
    // print(await db.query(tabelName));
    // print("=========+++++++++++++++++++++++++++++++++++++++++++++++++++++");
    return await db.query(tableName);
  }

  Future<int> delete(String id) async {
    Database db = await createDatabase();
    return (await db.delete(tableName, where: 'id =? ', whereArgs: [id]));
  }
}
