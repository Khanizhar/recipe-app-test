import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:izhar_test/models/recipe.dart';
import 'package:izhar_test/ui/widgets/shimmer_item.dart';

class RecipeDetailsView extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailsView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CachedNetworkImage(
            imageUrl: recipe.imageUrl,
            fit: BoxFit.fitWidth,
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
            progressIndicatorBuilder: (context, url, progress) =>
                const ShimmerContainer(height: 250),
          ),
          if (recipe.steps.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Cooking Instructions',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            )
          else
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 8),
              child: Text(
                'No Cooking Instructions available for this recipe',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
            ),
          ListView.builder(
              itemCount: recipe.steps.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final step = recipe.steps[index];
                return Card(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Step-${index + 1}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          step.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Ingredients',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: step.ingredients.length,
                            itemBuilder: (context, index) {
                              final ingredient = step.ingredients[index];
                              return ListTile(
                                leading: SizedBox(
                                  width: 50,
                                  child: Image.network(
                                    ingredient.image,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                title: Text(ingredient.name),
                              );
                            }),
                      ],
                    ),
                  ),
                );
              }),
        ],
      )),
    );
  }
}
