import 'package:flutter/material.dart';
import 'package:themealdb/view/dessert_screen.dart';
import 'package:themealdb/view/seafood_screen.dart';

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
          title: Text('Kuliner Indonesia'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.free_breakfast),
              title: Text('Breakfast'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              title: Text('Dessert'),
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