import 'package:flutter/material.dart';
import 'package:themealdb/bloc/detail_bloc.dart';
import 'package:themealdb/model/item_model.dart';

class DetailScreen extends StatefulWidget {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  const DetailScreen(
      {Key key, @required this.idMeal, this.strMeal, this.strMealThumb})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final bloc = DetailBloc();
  ItemModel itemModel;

  @override
  void initState() {
    super.initState();
    bloc.fetchDetailMeals(widget.idMeal);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Detail Makanan' + widget.idMeal),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: getDetailMeal(),
    );
  }

  getDetailMeal() {
    return StreamBuilder(
        stream: bloc.detailMeals,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            itemModel = snapshot.data;
            return _showListDetail(
                snapshot.data.meals[0].strCategory,
                snapshot.data.meals[0].strArea,
                snapshot.data.meals[0].strIngredient1,
                snapshot.data.meals[0].strIngredient2,
                snapshot.data.meals[0].strIngredient3,
                snapshot.data.meals[0].strIngredient4,
                snapshot.data.meals[0].strIngredient5,
                snapshot.data.meals[0].strInstructions);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
        });
  }

  Widget _showListDetail(
      String category,
      String area,
      String ingredient1,
      String ingredient2,
      String ingredient3,
      String ingredient4,
      String ingredient5,
      String desc) {
    return Text(desc);
  }
}
