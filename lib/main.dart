import 'package:flutter/material.dart';
import 'package:meals_catalogue/routes/foodList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals Catalogue',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: FoodList(),
    );
  }
}
