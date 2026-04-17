import 'package:flutter/material.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/usecases/get_recipes.dart';
import '../widgets/recipe_card.dart';

class RecipeListPage extends StatelessWidget {
  final GetRecipes getRecipes;

  const RecipeListPage({super.key, required this.getRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Food Recipes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Recipe>>(
        future: getRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: ${snapshot.error}'),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No recipes found.'));
          } else {
            final recipes = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: recipes.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return RecipeCard(recipe: recipe);
              },
            );
          }
        },
      ),
    );
  }
}
