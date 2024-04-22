import 'package:izhar_test/config/env.dart';

class Endpoints {
  static const _baseUrl = 'https://api.spoonacular.com';

  static String randomRecipes() =>
      '$_baseUrl/recipes/random?limitLicense=true&number=10&apiKey=${Env.apiKey}';
}
