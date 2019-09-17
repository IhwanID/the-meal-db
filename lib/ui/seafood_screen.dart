import 'package:flutter/material.dart';
import 'package:themealdb/ui/build_list.dart';
import '../model/item_model.dart';
import '../bloc/meals_bloc.dart';

class SeafoodScreen extends StatefulWidget {
  @override
  _SeafoodScreenState createState() => _SeafoodScreenState();
}

class _SeafoodScreenState extends State<SeafoodScreen> {
  final bloc = MealsBloc();

  @override
  void initState() {
    super.initState();
    bloc.fetchSeafood();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getSeafoodList(),
    );
  }

  getSeafoodList() {
    return Container(
      child: Center(
        child: StreamBuilder(
          stream: bloc.allMeals,
          builder: (context, AsyncSnapshot<ItemModel> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot, "seafood");
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)));
          },
        ),
      ),
    );
  }
}
