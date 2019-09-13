import 'dart:async';
import 'package:http/http.dart' show Client, Response;
import 'dart:convert';
import '../model/item_model.dart';

class MealsApiProvider {
  Client client = Client();

  final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<ItemModel> fetchMeals(String type) async {
    Response response;
    response = await client.get("$_baseUrl/filter.php?c=$type");
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list meals');
    }
  }

  Future<ItemModel> fetchDetail(String id) async {
    Response response;
    response = await client.get("$_baseUrl/lookup.php?i=$id");
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load detail meals');
    }
  }

  Future<ItemModel> searchMeals(String name) async {
    final response = await client.get("$_baseUrl/search.php?s=$name");
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load $name meals');
    }
  }
}
