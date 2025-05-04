import 'package:codolingo/providers/provider.dart';
import 'package:codolingo/services/api/api_service.dart';
import 'package:codolingo/services/api/live/live_api_service.dart';

/// Provider for the repositories and services.
class CodolingoLiveProvider extends CodolingoProvider {
  String baseUrl;

  CodolingoLiveProvider(this.baseUrl);

  @override
  initServices() {
    super.initServices();
    getIt.registerSingleton<ApiService>(LiveApiService(baseUrl));
  }
}
