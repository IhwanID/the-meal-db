import 'package:flutter/material.dart';
import 'package:themealdb/view/detail_screen.dart';
import '../model/meals.dart';
import '../bloc/meals_bloc.dart';
import '../animation/hero.dart';

class DessertScreen extends StatefulWidget {
  @override
  _DessertScreenState createState() => _DessertScreenState();
}

class _DessertScreenState extends State<DessertScreen> {
  final bloc = MealsBloc();

   @override
  void initState() {
    super.initState();
    bloc.fetchAllMeals('Dessert');
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getDessertFood(),
    );
  }

  getDessertFood() {
    return Container(
      child: Center(
        child: StreamBuilder(
          stream: bloc.allMeals,
          builder: (context, AsyncSnapshot<MealsResult> snapshot) {
            if (snapshot.hasData) {
              return _showSeaFoodList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
            ));
          },
        ),
      ),
    );
  }

  Widget _showSeaFoodList(AsyncSnapshot<MealsResult> snapshot) =>
      GridView.builder(
        itemCount: snapshot == null ? 0 : snapshot.data.meals.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
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
                              strMealThumb: snapshot.data.meals[index].strMealThumb
                          ),
                        ));
                  },
                  photo: snapshot.data.meals[index].strMealThumb,
                ),
              ),
            ),
          );
        },
      );
}