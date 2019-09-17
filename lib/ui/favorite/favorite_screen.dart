import 'package:flutter/material.dart';
import 'package:themealdb/ui/favorite/dessert_favorite_screen.dart';
import 'package:themealdb/ui/favorite/seafood_favorite_screen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.blueAccent,
            indicatorColor: Colors.blueGrey,
            tabs: [
              Tab(text: "Dessert"),
              Tab(text: "Seafood"),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          DessertFavoriteScreen(),
          SeafoodFavoriteScreen()
        ]),
      ),
    );
  }
}
