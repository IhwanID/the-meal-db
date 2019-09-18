import 'package:flutter/material.dart';
import 'package:themealdb/model/item_model.dart';
import 'package:themealdb/resources/favorite_local_provider.dart';
import 'package:themealdb/ui/favorite/build_list_favorite.dart';

class SeafoodFavoriteScreen extends StatefulWidget {
  @override
  _SeafoodFavoriteScreenState createState() => _SeafoodFavoriteScreenState();
}

class _SeafoodFavoriteScreenState extends State<SeafoodFavoriteScreen> {
  Future<List<Meals>> _seafoodFavorite;

  @override
  void initState() {
    _seafoodFavorite = FavoriteLocalProvider.db.getFavoriteMealsByType("seafood");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Container(
      child: FutureBuilder(
        initialData: <Meals>[],
        future: _seafoodFavorite,
        builder:
            (BuildContext context, AsyncSnapshot<List<Meals>> snapshot) {
          if (snapshot.hasError) {
           return Text(snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Meals> favoriteFoods = snapshot.data;
            if (favoriteFoods.isEmpty) {
              return Center(
                child: Text(
                  "No Favorite Seafood Available",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return buildListFavorite(favoriteFoods, "seafood");
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