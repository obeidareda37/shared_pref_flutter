import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_pref/forms/models/category.dart';
import 'package:shared_pref/forms/models/product.dart';
import 'package:shared_pref/forms/models/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final String dabaseName = 'ecommerceDb.db';
  static final String productTableName = 'Product';
  static final String productIdColumnName = 'id';
  static final String productNameColumnName = 'name';
  static final String productCatId = 'categoryId';
  static final String categoryTableName = 'Categories';
  static final String categoryNameIdColumn = 'id';
  static final String categoryTableNameNameColumnName = 'name';
  Database database;

  initDatabase() async {}

  Future<Database> getDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/$dabaseName';
    Database database = await openDatabase(path,onConfigure: (db){
      db.execute('PRAGMA foreign_keys=ON');
    }, onCreate: (db, v) {
      db.execute(
          '''CREATE TABLE $productTableName ($productIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
           $productNameColumnName TEXT, $productCatId INTEGER,
           FOREIGN KEY ($productCatId) REFERENCES $categoryTableName ($categoryNameIdColumn) ON DELETE CASCADE)''');

      db.execute(
          '''CREATE TABLE $categoryTableName ($categoryNameIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
           $categoryTableNameNameColumnName TEXT)''');
    });
    return database;
  }

  insetProduct(Product product) async {
    int rowNum = await database.insert(productTableName, product.toMap());
    print(rowNum);
  }
  insetCategory(Category category) async {
    int rowNum = await database.insert(categoryTableName, category.toMap());
    print(rowNum);
  }

  Future<List<Product>> getAllProduct() async {
    List<Map<String, Object>> results = await database.query(productTableName);
    List<Product> products = results.map((e) {
      return Product.fromMap(e);
    }).toList();
    return products;
  }

  // Future<TaskModel> getSpecificTask(int id) async {
  //   List<Map<String, dynamic>> results =
  //       await database.query(tableName, where: 'id=?', whereArgs: [id]);
  //   TaskModel taskModel = TaskModel.fromMap(results.first);
  //   return taskModel;
  // }

  // updateTask(TaskModel taskModel)async{
  //   database.update(tableName, taskModel.toMap(), where: 'id=?', whereArgs: [taskModel.id]);
  // }

  deleteTask(int id)async{
    database.delete(productTableName,where: 'id=?',whereArgs: [id]);
  }
}
