import 'package:flutter/material.dart';
import 'package:themealdb/ui/dessert_screen.dart';
import 'package:themealdb/ui/favorite/favorite_screen.dart';
import 'package:themealdb/ui/seafood_screen.dart';
import 'package:themealdb/ui/search_screen.dart';
import 'package:themealdb/flavor/config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  _setPage() {
    if (_index == 0) {
      return DessertScreen();
    } else if (_index == 1) {
      return SeafoodScreen();
    } else {
      return FavoriteScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Config.appString),
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
          },
        )
        ],
      ),
      body: _setPage(),
      bottomNavigationBar: BottomNavigationBar(
        key: Key('bottom'),
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            title: Text('Dessert'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text('Seafood'),
          ),BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorite'),
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              setState(() {
                _index = 0;
              });
              break;
            case 1:
              setState(() {
                _index = 1;
              });
              break;
            case 2:
              setState(() {
                _index = 2;
              });
              break;
          }
        },
      ),
    );
  }
}
