import 'package:codolingo/model/class/chapter.dart';
import 'package:codolingo/model/mvvm/view_model.dart';
import 'package:codolingo/pages/home/home_view.dart';
import 'package:codolingo/pages/lesson/lesson_view.dart';
import 'package:codolingo/pages/map/map_view.dart';
import 'package:codolingo/pages/welcome/welcome_view.dart';
import 'package:codolingo/repositories/api/api_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:codolingo/model/mvvm/view_events/push_route_event.dart';

class LoginViewModel extends EventViewModel {
  final GetIt getIt = GetIt.instance;

  late ApiRepository _apiRepository;

  // Value not accessible by the view
  // ignore: unused_field
  final String _privateValue;

  List<CodolingoChapter> chapters = [];

  // Value accessible by the view
  String publicValue;

  LoginViewModel(this._privateValue, this.publicValue, {ApiRepository? apiRepository}) {
    _apiRepository = apiRepository ?? getIt.get<ApiRepository>();
  }

  void redirect() async {
    notify(const PushRouteEvent(WelcomePage.route));
  }

  Future<void> login(String username, String password) async {
    try {
      final response = await _apiRepository.login(username, password);
      if (response) {
        redirect();
      } else {
        print("Identifiants incorrects");
      }
    } catch (e) {
      print("Erreur lors de la connexion : $e");
    }
  }
}
