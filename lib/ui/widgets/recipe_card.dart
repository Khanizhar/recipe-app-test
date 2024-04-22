import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izhar_test/models/recipe.dart';
import 'package:izhar_test/routes/route_list.dart';
import 'package:izhar_test/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(recipe.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: InkWell(
        onTap: () {
          context.push(RouteList.recipeDetails, extra: recipe);
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  context.read<HomeViewModel>().addFavorite(recipe);
                },
                icon: Icon(
                  viewModel.favorites.contains(recipe)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  recipe.title,
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.grey.shade300,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              alignment: Alignment.center,
            ),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        SizedBox(width: 7),
                        Text(
                          '${recipe.cookTime} minutes',
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              alignment: Alignment.bottomRight,
            ),
          ],
        ),
      ),
    );
  }
}
