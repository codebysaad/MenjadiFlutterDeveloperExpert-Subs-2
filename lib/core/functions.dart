import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';
import 'package:meals_catalogue/models/foodModels.dart';

Future<Map<String, dynamic>> readFood () async {
  String jsonString = await loadAsset();
  Map<String, dynamic> result = jsonDecode(jsonString);

  return result;
}

Future<String> loadAsset() async {
  return await rootBundle.loadString('lib/assets/recipes.json');
}

Future<List<FoodModels>> getFood () async {
  List<FoodModels> result = [];

  var res = await readFood();

  res["foods"].forEach((f){
    FoodModels models = FoodModels.fromJson(f);
    result.add(models);
  });

  return result;
}