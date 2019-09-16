import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:themealdb/model/item_model.dart';

class FavoriteLocalProvider{

static Database _database;

FavoriteLocalProvider._();
  static final FavoriteLocalProvider db = FavoriteLocalProvider._();
Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDatabase();
    return _database;
  }

  initDatabase() async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'meals.db');
    return await openDatabase(path, version: 1, 
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE favorite ("
              "id INTEGER PRIMARY KEY,"
              "idMeal TEXT,"
              "strMeal TEXT,"
              "strCategory TEXT,"
              "strArea TEXT,"
              "strInstructions TEXT,"
              "strMealThumb TEXT,"
              "strIngredient1 TEXT,"
              "strIngredient2 TEXT,"
              "strIngredient3 TEXT,"
              "strIngredient4 TEXT,"
              "strIngredient5 TEXT,"
              "type TEXT"
              ")");
        });
  }

  Future<List<ItemModel>> getFavoriteMealsByType(String type) async {
    final db = await database;
    var res = await db.query("favorite", where: "type = ?", whereArgs: [type]);
    List<ItemModel> meals = res.isEmpty
        ? []
        : res.map((item) => ItemModel.fromJson(item)).toList();
    return meals;
  }

  getFavoriteMealsById(String idMeal) async {
    final db = await database;
    var res =
    await db.query("favorite", where: "idMeal = ?", whereArgs: [idMeal]);
    return res.isEmpty ? null : Meals.fromJson(res.first);
  }

  addFavoriteMeals(Meals meals) async {
    final db = await database;
    var res = await db.insert("favorite", meals.toJson());
    return res;
  }

  deleteFavoriteMealsById(String id) async {
    final db = await database;
    var res = await db.delete("favorite", where: "idMeal = ?", whereArgs: [id]);
    return res;
  }
  
}