import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:izhar_test/models/recipe.dart';
import 'package:izhar_test/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class FavoriteRecipeCard extends StatelessWidget {
  final Recipe recipe;
  const FavoriteRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.read<HomeViewModel>().addFavorite(recipe);
        },
        leading: SizedBox(
          width: 100,
          child: CachedNetworkImage(
            imageUrl: recipe.imageUrl,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
            progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(value: progress.progress)),
          ),
        ),
        title: Text(recipe.title),
        trailing: GestureDetector(
          child: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onTap: () {
            context.read<HomeViewModel>().removeFavorite(recipe);
          },
        ),
      ),
    );
  }
}
