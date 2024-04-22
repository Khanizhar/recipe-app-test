import 'package:go_router/go_router.dart';
import 'package:izhar_test/models/recipe.dart';
import 'package:izhar_test/routes/route_list.dart';
import 'package:izhar_test/ui/views/favorite_recipes_view.dart';
import 'package:izhar_test/ui/views/home_view.dart';
import 'package:izhar_test/ui/views/recipe_details_view.dart';

abstract class AppRouter {
  static final config = GoRouter(
    routes: [
      GoRoute(
        path: RouteList.home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: RouteList.recipeDetails,
        builder: (context, state) =>
            RecipeDetailsView(recipe: state.extra as Recipe),
      ),
      GoRoute(
        path: RouteList.favorites,
        builder: (context, state) =>
            const FavoriteRecipesView(),
      ),
    ],
  );
}
