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
        return 'The MealDB - Dev ';
        break;
      case Flavor.PRO:
        return 'The Meal DB - Prod';
        break;
      default:
        return 'The Meal DB';
        break;
    }
  }
 
  static Icon get appIcon {
    switch (appFlavor) {
      case Flavor.DEV:
        return Icon(Icons.developer_mode);
        break;
      case Flavor.PRO:
        return Icon(Icons.new_releases);
        break;
      default:
        return Icon(Icons.android);
        break;
    }
  }
}