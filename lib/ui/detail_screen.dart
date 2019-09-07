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
          title: Text('Detail Makanan'),
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
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)));
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
    return Container(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: widget.strMeal,
              child: Image.network(widget.strMealThumb),
            ),
            Center(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                widget.strMeal,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            )),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Deskripsi :",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      desc,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
