import 'package:codolingo/model/class/theme.dart';
import 'package:codolingo/model/mvvm/view_events/push_route_event.dart';
import 'package:codolingo/model/mvvm/view_events/update_view_event.dart';
import 'package:codolingo/model/mvvm/view_model.dart';
import 'package:codolingo/pages/map/map_view.dart';
import 'package:codolingo/repositories/api/api_repository.dart';
import 'package:get_it/get_it.dart';

class WelcomeViewModel extends EventViewModel {
  final GetIt getIt = GetIt.instance;
  late ApiRepository _apiRepository;
  bool showThemes = false;
  List<CodolingoTheme> themes = [];
  bool isLoading = true;

  WelcomeViewModel({ApiRepository? apiRepository}) {
    _apiRepository = apiRepository ?? getIt.get<ApiRepository>();
    getThemesList();
  }

  void redirectChapterSelection() async {
    notify(const PushRouteEvent(MapPage.route, replace: true));
  }

  Future<void> getThemesList() async {
    themes = await _apiRepository.getThemes();
    isLoading = false;
    notify(const UpdateViewEvent());
  }

  void onWelcomeScreenClicked() {
    showThemes = true;
    notify(const UpdateViewEvent());
  }
}
