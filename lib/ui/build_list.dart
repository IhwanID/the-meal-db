import 'package:flutter/material.dart';
import 'package:themealdb/ui/detail_screen.dart';
import '../model/item_model.dart';
import '../animation/hero.dart';

Widget buildList(AsyncSnapshot<ItemModel> snapshot) => GridView.builder(
      itemCount: snapshot == null ? 0 : snapshot.data.meals.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Card(
            elevation: 5.0,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.all(10),
            child: GridTile(
              child: PhotoHero(
                tag: snapshot.data.meals[index].strMeal,
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 777),
                        pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) =>
                            DetailScreen(
                                idMeal: snapshot.data.meals[index].idMeal,
                                strMeal: snapshot.data.meals[index].strMeal,
                                strMealThumb:
                                    snapshot.data.meals[index].strMealThumb),
                      ));
                },
                photo: snapshot.data.meals[index].strMealThumb,
              ),
            ),
          ),
        );
      },
    );
