import 'package:flutter/material.dart';
import '../model/meals.dart';
import '../bloc/meals_bloc.dart';
import '../animation/hero.dart';

class SeafoodScreen extends StatefulWidget {
  @override
  _SeafoodScreenState createState() => _SeafoodScreenState();
}

class _SeafoodScreenState extends State<SeafoodScreen> {
  final bloc = MealsBloc();

  @override
  void initState() {
    super.initState();
    bloc.fetchAllMeals('Seafood');
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getSeafoofList(),
    );
  }

  getSeafoofList() {
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
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       PageRouteBuilder(
                  //         transitionDuration: Duration(milliseconds: 777),
                  //         pageBuilder: (BuildContext context,
                  //                 Animation<double> animation,
                  //                 Animation<double> secondaryAnimation) =>
                  //             DetailScreen(
                  //           name: data[index].name,
                  //           image: data[index].image,
                  //           description: data[index].description,
                  //         ),
                  //       ));
                  // },
                  photo: snapshot.data.meals[index].strMealThumb,
                ),
              ),
            ),
          );
        },
      );

}