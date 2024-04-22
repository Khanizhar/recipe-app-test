import 'package:izhar_test/constants/endpoints.dart';
import 'package:izhar_test/models/recipe.dart';
import 'package:fpdart/fpdart.dart';
import 'package:izhar_test/services/network/api_service.dart';

abstract class RecipeRepository {
  Future<Either<String, List<Recipe>>> getRandomRecipes();
}

class RecipeRepositoryImp implements RecipeRepository {
  final ApiService _apiService;

  RecipeRepositoryImp({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Either<String, List<Recipe>>> getRandomRecipes() async {
    try {
      final response = await _apiService.getRequest(Endpoints.randomRecipes());
      return right(
        (response['recipes'] as List)
            .map((articleMap) => Recipe.fromMap(articleMap))
            .toList(),
      );
    } catch (e) {
      return left(e.toString());
    }
  }
}
