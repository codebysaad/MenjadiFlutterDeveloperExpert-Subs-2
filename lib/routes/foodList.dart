import 'package:flutter/material.dart';
import 'package:meals_catalogue/layout/GirdLayout.dart';
import 'package:meals_catalogue/core/functions.dart';
import 'package:meals_catalogue/models/foodModels.dart';

class FoodList extends StatefulWidget {
  final String title;

  const FoodList({Key key, this.title = "Meals Catalogue"}) : super(key: key);
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  List<FoodModels> _foodList = [];
  String _foodType = "breakfast";
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getFood().then((v) {
      setState(() {
        _foodList = v;
      });
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: GridList(_foodList, _foodType),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              title: Text("Breakfast")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            title: Text("Dessert"),
          )
        ],
        onTap: (i) {
          setState(() {
            if (i == 0) {
              _selectedTab = 0;
              _foodType = "breakfast";
            } else {
              _selectedTab = 1;
              _foodType = "dessert";
            }
          });
        },
        currentIndex: _selectedTab,
      ),
    );
  }
}