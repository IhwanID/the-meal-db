import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:themealdb/model/item_model.dart';

class FavoriteLocalProvider {
  FavoriteLocalProvider._();
  static final FavoriteLocalProvider db = FavoriteLocalProvider._();

  static Database _database;
  static final _databaseName = "meals.db";
  static final _databaseVersion = 1;
  static final table = 'favorite';

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            id INTEGER PRIMARY KEY,
            idMeal TEXT,
            strMeal TEXT,
            strCategory TEXT,
            strArea TEXT,
            strYoutube TEXT,
            strInstructions TEXT,
            strMealThumb TEXT,
            strIngredient1 TEXT,
            strIngredient2 TEXT,
            strIngredient3 TEXT,
            strIngredient4 TEXT,
            strIngredient5 TEXT,
            strIngredient6 TEXT,
            strIngredient7 TEXT,
            strIngredient8 TEXT,
            strIngredient9 TEXT,
            strIngredient10 TEXT,
            strIngredient11 TEXT,
            strIngredient12 TEXT,
            strIngredient13 TEXT,
            strIngredient14 TEXT,
            strIngredient15 TEXT,
            strIngredient16 TEXT,
            strIngredient17 TEXT,
            strIngredient18 TEXT,
            strIngredient19 TEXT,
            strIngredient20 TEXT,
            strMeasure1 TEXT,
            strMeasure2 TEXT,
            strMeasure3 TEXT,
            strMeasure4 TEXT,
            strMeasure5 TEXT,
            strMeasure6 TEXT,
            strMeasure7 TEXT,
            strMeasure8 TEXT,
            strMeasure9 TEXT,
            strMeasure10 TEXT,
            strMeasure11 TEXT,
            strMeasure12 TEXT,
            strMeasure13 TEXT,
            strMeasure14 TEXT,
            strMeasure15 TEXT,
            strMeasure16 TEXT,
            strMeasure17 TEXT,
            strMeasure18 TEXT, 
            strMeasure19 TEXT, 
            strMeasure20 TEXT, 
            type TEXT  
          )
          ''');
  }

  Future<List<Meals>> getFavoriteMealsByType(String type) async {
    final db = await database;
    var result = await db.query(table, where: "type = ?", whereArgs: [type]);
    List<Meals> meals = result.isEmpty ? [] : result.map((item) => Meals.fromJson(item)).toList();
    return meals;
  }

  getFavoriteMealsById(String idMeal) async {
    final db = await database;
    var result =
        await db.query(table, where: "idMeal = ?", whereArgs: [idMeal]);
    return result.isEmpty ? null : Meals.fromJson(result.first);
  }

  addFavoriteMeals(Meals meals) async {
    final db = await database;
    var result = await db.insert(table, meals.toJson());
    return result;
  }

  deleteFavoriteMealsById(String id) async {
    final db = await database;
    var result = await db.delete(table, where: "idMeal = ?", whereArgs: [id]);
    return result;
  }
}
