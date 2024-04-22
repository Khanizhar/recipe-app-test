import 'package:hive_flutter/hive_flutter.dart';
import 'package:izhar_test/models/cooking_step.dart';
import 'package:izhar_test/models/ingredient.dart';
import 'package:izhar_test/models/recipe.dart';

class LocalStorageService {
  LocalStorageService._();
  late final Box _favoritesBox = Hive.box<Recipe>('favorites');
  static final LocalStorageService instance = LocalStorageService._();

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<Recipe>(RecipeAdapter());
    Hive.registerAdapter<CookingStep>(CookingStepAdapter());
    Hive.registerAdapter<Ingredient>(IngredientAdapter());
    await Hive.openBox<Recipe>('favorites');
  }

  List<Recipe> getFavoriteRecipes(){
    return _favoritesBox.values.toList().cast<Recipe>();
  }

  void addFavorite(Recipe recipe) {
    _favoritesBox.put(recipe.id, recipe);
  }

  

  void removeFavorite(Recipe recipe) {
    _favoritesBox.delete(recipe.id);
  }
}
