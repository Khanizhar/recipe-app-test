import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izhar_test/routes/route_list.dart';
import 'package:izhar_test/ui/widgets/recipe_card.dart';
import 'package:izhar_test/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeViewModel>().getFavoriteRecipes();
    context.read<HomeViewModel>().getRandomRecipes(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App'),
        actions: [
          TextButton.icon(
              onPressed: () {
                context.push(RouteList.favorites);
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              label: Text(
                'Recipes',
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
      body: viewModel.showLoader
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: viewModel.articles.length,
              itemBuilder: (context, index) {
                final recipe = viewModel.articles[index];
                return RecipeCard(recipe: recipe);
              },
            ),
    );
  }
}
