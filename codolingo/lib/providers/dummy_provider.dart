import 'package:codolingo/providers/provider.dart';
import 'package:codolingo/repositories/api/api_repository.dart';
import 'package:codolingo/repositories/api/dummy/dummy_api_repository.dart';

class CodolingoDummyProvider extends CodolingoProvider {
  CodolingoDummyProvider();

  @override
  initRepositories() {
    super.initRepositories();
    getIt.registerSingleton<ApiRepository>(DummyApiRepository());
  }
}
