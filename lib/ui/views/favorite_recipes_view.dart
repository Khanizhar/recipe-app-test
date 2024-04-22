import 'package:flutter/material.dart';
import 'package:izhar_test/ui/widgets/favorite_recipe_card.dart';
import 'package:izhar_test/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class FavoriteRecipesView extends StatelessWidget {
  const FavoriteRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteRecipes = context.watch<HomeViewModel>().favorites;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Recipes'),
      ),
      body: favoriteRecipes.isEmpty
          ? const Center(
              child: Text('No favorite recipes added',
                  style: TextStyle(color: Colors.grey)))
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipes[index];
                return FavoriteRecipeCard(recipe: recipe);
              }),
    );
  }
}
