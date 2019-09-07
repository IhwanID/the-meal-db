import 'package:flutter/material.dart';
import 'ui/home.dart';

void main() => runApp(MyApplication());

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TheMealDB',
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}