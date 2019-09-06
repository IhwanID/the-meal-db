import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../model/meals.dart';

class MealsApiProvider {
  Client client = Client();

  static final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  Future<MealsResult> fetchMeals(String type) async {
    final response = await client.get(_baseUrl +"filter.php?c=$type");
    if (response.statusCode == 200) {
      return MealsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<MealsResult> fetchDetail(String id) async {
    final response = await client.get(_baseUrl + 'lookup.php?i=$id');
    if (response.statusCode == 200) {
      return MealsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load meals');
    }
  }
}