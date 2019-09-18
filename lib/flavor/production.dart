import 'package:flutter/material.dart';
 
import 'config.dart';
import '../main.dart';
 
void main() {
  Config.appFlavor = Flavor.PRO;
  return runApp(MyApplication());
}