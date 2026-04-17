import 'package:flutter/material.dart';
import 'data/repositories/recipe_repository_impl.dart';
import 'domain/usecases/get_recipes.dart';
import 'presentation/pages/recipe_list_page.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Recipes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: RecipeListPage(
        getRecipes: GetRecipes(RecipeRepositoryImpl()),
      ),
    );
  }
}
