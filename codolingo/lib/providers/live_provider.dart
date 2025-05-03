import 'package:codolingo/providers/provider.dart';
import 'package:codolingo/repositories/api/api_repository.dart';
import 'package:codolingo/repositories/api/live/live_api_repository.dart';

/// Provider for the repositories and services.
class CodolingoLiveProvider extends CodolingoProvider {
  String baseUrl;

  CodolingoLiveProvider(this.baseUrl);

  @override
  initRepositories() {
    super.initRepositories();
    getIt.registerSingleton<ApiRepository>(LiveApiRepository(baseUrl));
  }
}
