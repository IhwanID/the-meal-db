import 'package:flutter/material.dart';
import '../model/item_model.dart';
import '../bloc/meals_bloc.dart';
import 'build_list.dart';

class DessertScreen extends StatefulWidget {
  @override
  _DessertScreenState createState() => _DessertScreenState();
}

class _DessertScreenState extends State<DessertScreen> {
  final bloc = MealsBloc();

  @override
  void initState() {
    super.initState();
    bloc.fetchDessert();
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
    return StreamBuilder(
      stream: bloc.allMeals,
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (snapshot.hasData) {
          return buildList(snapshot, "dessert");
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)));
      },
    );
  }
}
