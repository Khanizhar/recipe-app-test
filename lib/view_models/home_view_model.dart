import 'package:flutter/material.dart';
import 'package:izhar_test/models/recipe.dart';
import 'package:izhar_test/repositories/recipe_repository.dart';
import 'package:izhar_test/services/local_storage_service.dart';
import 'package:izhar_test/utils/dialog_utils.dart';

class HomeViewModel extends ChangeNotifier {
  final RecipeRepository _recipeRepository;
  HomeViewModel({required RecipeRepository recipeRepository})
      : _recipeRepository = recipeRepository;

  bool _showLoader = true;

  bool get showLoader => _showLoader;

  List<Recipe> articles = [];

  List<Recipe> favorites = [];

  void getFavoriteRecipes() {
    favorites = LocalStorageService.instance.getFavoriteRecipes();
  }

  void addFavorite(Recipe recipe) {
    LocalStorageService.instance.addFavorite(recipe);
    getFavoriteRecipes();
    notifyListeners();
  }

  void removeFavorite(Recipe recipe) {
    LocalStorageService.instance.removeFavorite(recipe);
    getFavoriteRecipes();
    notifyListeners();
  }

  Future<void> getRandomRecipes({required BuildContext context}) async {
    final response = await _recipeRepository.getRandomRecipes();
    response.fold(
      (l) => showAppDialog(context: context, title: l),
      (r) {
        articles = r;
        _showLoader = false;
      },
    );
    notifyListeners();
  }
}
