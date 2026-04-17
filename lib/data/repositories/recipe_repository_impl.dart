import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../models/recipe_model.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  @override
  Future<List<Recipe>> getRecipes() async {
    final String response = await rootBundle.loadString('assets/recipes.json');
    final data = json.decode(response);
    final List<dynamic> recipesJson = data['recipes'];
    return recipesJson.map((json) => RecipeModel.fromJson(json)).toList();
  }
}
