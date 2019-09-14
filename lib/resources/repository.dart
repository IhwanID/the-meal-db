import 'dart:async';
import 'meals_api_provider.dart';
import '../model/item_model.dart';

class Repository {
  final mealsApiProvider = MealsApiProvider();

  Future<ItemModel> fetchAllMeals(String type) =>
      mealsApiProvider.fetchMeals(type);

  Future<ItemModel> fetchDetailMeals(String detail) =>
      mealsApiProvider.fetchDetail(detail);

  Future<ItemModel> searchMeals(String name) =>
      mealsApiProvider.searchMeals(name);
}
