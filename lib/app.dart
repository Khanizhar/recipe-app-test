import 'package:flutter/material.dart';
import 'package:izhar_test/repositories/recipe_repository.dart';
import 'package:izhar_test/routes/router.dart';
import 'package:izhar_test/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

import 'di/injection.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(
        recipeRepository: getIt<RecipeRepository>(),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.config,
      ),
    );
  }
}
