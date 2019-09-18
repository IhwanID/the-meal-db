import 'package:flutter/material.dart';
import 'package:themealdb/model/item_model.dart';
import 'package:themealdb/resources/favorite_local_provider.dart';
import 'package:themealdb/ui/favorite/build_list_favorite.dart';

class DessertFavoriteScreen extends StatefulWidget {
  @override
  _DessertFavoriteScreenState createState() => _DessertFavoriteScreenState();
}

class _DessertFavoriteScreenState extends State<DessertFavoriteScreen> {
Future<List<Meals>> dessertFavorite;
  @override
  void initState() {
    dessertFavorite = FavoriteLocalProvider.db.getFavoriteMealsByType("dessert");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        initialData: <Meals>[],
        future: dessertFavorite,
        builder:
            (BuildContext context, AsyncSnapshot<List<Meals>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Meals> favoriteFoods = snapshot.data;
            if (favoriteFoods.isEmpty) {
              return Center(
                child: Text(
                  "No Favorite Dessert Available",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return buildListFavorite(favoriteFoods, "dessert");
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}