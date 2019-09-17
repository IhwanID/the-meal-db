import 'package:flutter/material.dart';
import 'package:themealdb/animation/hero.dart';
import 'package:themealdb/model/item_model.dart';
import 'package:themealdb/ui/detail_screen.dart';


Widget buildListFavorite(List<Meals> data, String type) => GridView.builder(
      itemCount: data.length,
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
                tag: data[index].strMeal,
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 777),
                        pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) =>
                            DetailScreen(
                                idMeal: data[index].idMeal,
                                strMeal: data[index].strMeal,
                                strMealThumb:
                                    data[index].strMealThumb,
                                    type: type,),
                      ));
                },
                photo: data[index].strMealThumb,
              ),
            ),
          ),
        );
      },
    );
