import 'package:flutter/material.dart';
 
enum Flavor {
  DEV,
  PRO,
}
 
class Config {
  static Flavor appFlavor;
 
  static String get appString {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'The MealDB - Development ';
        break;
      case Flavor.PRO:
        return 'The Meal DB';
        break;
      default:
        return 'The Meal DB';
        break;
    }
  }

}