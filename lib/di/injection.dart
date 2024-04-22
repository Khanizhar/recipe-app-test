import 'package:get_it/get_it.dart';
import 'package:izhar_test/repositories/recipe_repository.dart';
import 'package:izhar_test/services/network/api_service.dart';

final getIt = GetIt.instance;

void injectDependencies() {
  final _apiService = ApiService();
  getIt.registerSingleton<ApiService>(_apiService);
  getIt.registerSingleton<RecipeRepository>(
    RecipeRepositoryImp(apiService: _apiService),
  );
}
