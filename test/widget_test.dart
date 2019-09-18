// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:themealdb/model/item_model.dart';
import 'package:themealdb/resources/meals_api_provider.dart';

class MockClient extends Mock implements http.Client {}


void main() {
MealsApiProvider provider = MealsApiProvider();
final client = MockClient();
  group('testApi', () {
    test('returns Result ItemModel of Seafood List if the http call completes successfully', () async {
  
      when(client.get('https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood'))
          .thenAnswer((_) async => http.Response(Meals().toString(), 200));

      expect(await provider.fetchMeals("Seafood"), isInstanceOf<ItemModel>());
    });

    test('returns Result ItemModel of Dessert List if the http call completes successfully', () async {

      when(client.get('https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert'))
          .thenAnswer((_) async => http.Response(Meals().toString(), 200));

      expect(await provider.fetchMeals("Dessert"), isInstanceOf<ItemModel>());
    });

    test('returns Result ItemModel of Detail Dessert if the http call completes successfully', () async {
  
      when(client.get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=52893'))
          .thenAnswer((_) async => http.Response(Meals().toString(), 200));

      expect(await provider.fetchDetail("52893"), isInstanceOf<ItemModel>());
    });

    test('returns Result ItemModel of Search Pie if the http call completes successfully', () async {
 
      when(client.get('https://www.themealdb.com/api/json/v1/1/search.php?s=Pie'))
          .thenAnswer((_) async => http.Response(Meals().toString(), 200));

      expect(await provider.searchMeals("Pie"), isInstanceOf<ItemModel>());
    });

    
  });

}
