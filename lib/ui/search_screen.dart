import 'package:flutter/material.dart';
import 'package:themealdb/bloc/search_bloc.dart';
import 'package:themealdb/model/item_model.dart';
import 'package:themealdb/ui/build_list.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final bloc = SearchBloc();
  @override
  void initState() {
    super.initState();
    bloc.searchMealsByName("");
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              centerTitle: true,
              floating: true,
              pinned: true,
              title: TextField(
                autofocus: true,
                style: TextStyle(fontSize: 17, color: Colors.white),
                decoration: InputDecoration.collapsed(
                  hintText: "type food name . . .",
                  hintStyle: TextStyle(fontSize: 17, color: Colors.white),
                ),
                onChanged: bloc.searchMealsByName,
              ),
            )
          ];
        },
        body: getSearchFood(),
      ),
    );
  }

  getSearchFood() {
    return StreamBuilder(
      stream: bloc.searchMeal,
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (snapshot.hasData) {
          return buildList(snapshot, "");
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