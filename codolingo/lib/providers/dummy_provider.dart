import 'package:codolingo/providers/provider.dart';
import 'package:codolingo/services/api/api_service.dart';
import 'package:codolingo/services/api/dummy/dummy_api_service.dart';

class CodolingoDummyProvider extends CodolingoProvider {
  CodolingoDummyProvider();

  @override
  initServices() {
    super.initServices();
    getIt.registerSingleton<ApiService>(DummyApiService());
  }
}
