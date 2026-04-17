import '../../domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  const RecipeModel({
    required super.title,
    required super.description,
    required super.ingredients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      title: json['title'] as String,
      description: json['description'] as String,
      ingredients: List<String>.from(json['ingredients'] as List),
    );
  }
}
