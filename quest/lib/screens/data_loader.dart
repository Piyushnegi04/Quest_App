// data_loader.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'models.dart';

Future<List<Category>> loadCategories() async {
  String jsonString = await rootBundle.loadString('assets/quests.json');
  final jsonResponse = json.decode(jsonString);
  var categoriesJson = jsonResponse['categories'] as List;
  return categoriesJson.map((category) => Category.fromJson(category)).toList();
}
