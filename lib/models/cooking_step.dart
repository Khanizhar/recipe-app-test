import 'package:hive_flutter/hive_flutter.dart';
import 'package:izhar_test/models/ingredient.dart';
part 'cooking_step.g.dart';
@HiveType(typeId: 1)
class CookingStep {
  @HiveField(0)
  final String description;
  @HiveField(1)
  final List<Ingredient> ingredients;
  CookingStep({
    required this.description,
    required this.ingredients,
  });

  factory CookingStep.fromMap(Map<String, dynamic> map) {
    return CookingStep(
      description: map['step'] as String,
      ingredients: List<Ingredient>.from(
        (map['ingredients'] as List).map<Ingredient>(
          (x) => Ingredient.fromMap(x),
        ),
      ),
    );
  }
}