import 'package:flutter/material.dart';
import 'package:themealdb/ui/dessert_screen.dart';
import 'package:themealdb/ui/seafood_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('The Meals DB'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.cake),
              title: Text('Dessert'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              title: Text('Seafood'),
            )
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
            }
          },
        ),
        body: _index == 0 ? DessertScreen() : SeafoodScreen());
  }
}
