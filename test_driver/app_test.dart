import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(){
  group('MealsDB App', () {
    FlutterDriver driver;
 
    // Connect to the Flutter driver before running any tests
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
 
    // Close the connection to the driver after the tests have completed
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
 
    test('Show List Dessert', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      await driver.waitFor(find.byValueKey('bottom'));
      await driver.tap(find.text('Dessert'));
      await Future.delayed(Duration(seconds: 3));
      await driver.waitFor(find.byValueKey('grid'));
      await Future.delayed(Duration(seconds: 1));
      await driver.scroll(find.byValueKey('grid'), 0, -600, Duration(milliseconds: 500));
      await driver.scroll(find.byValueKey('grid'), 0, 600, Duration(milliseconds: 500));
      await driver.scroll(find.byValueKey('grid'), 0, -600, Duration(milliseconds: 500));
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(find.byValueKey('meals_52961'));
      await Future.delayed(Duration(seconds: 3));
      await driver.tap(find.byValueKey('back'));
      await Future.delayed(Duration(seconds: 1));
    });

    test('Show List Seafood', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      await driver.waitFor(find.byValueKey('bottom'));
      await driver.tap(find.text('Seafood'));
      await Future.delayed(Duration(seconds: 3));
      await driver.waitFor(find.byValueKey('grid'));
      await Future.delayed(Duration(seconds: 1));
      await driver.scroll(find.byValueKey('grid'), 0, -600, Duration(milliseconds: 500));
      await driver.scroll(find.byValueKey('grid'), 0, 600, Duration(milliseconds: 500));
      await driver.scroll(find.byValueKey('grid'), 0, -600, Duration(milliseconds: 500));
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(find.byValueKey('meals_52887'));
      await Future.delayed(Duration(seconds: 3));
      await driver.tap(find.byValueKey('back'));
      await Future.delayed(Duration(seconds: 1));
    });
 
   
  });
}