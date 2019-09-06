import 'dart:async';
import 'meals_api_provider.dart';
import '../model/meals.dart';

class Repository {
  final mealsApiProvider = MealsApiProvider();

  Future<MealsResult> fetchAllMeals(String type) => mealsApiProvider.fetchMeals(type);

  Future<MealsResult> fetchDetailMeals(String detail) => mealsApiProvider.fetchDetail(detail);
}
