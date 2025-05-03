import 'package:codolingo/model/mvvm/widget_event_observer.dart';
import 'package:codolingo/model/mvvm/view_event.dart';
import 'package:codolingo/model/mvvm/view_events/update_view_event.dart';

abstract class EventViewModel {
  final List<EventObserver> _observerList = List.empty(growable: true);

  void subscribe(EventObserver o) {
    if (_observerList.contains(o)) return;
    _observerList.add(o);
  }

  bool unsubscribe(EventObserver o) {
    if (_observerList.contains(o)) {
      _observerList.remove(o);
      return true;
    } else {
      return false;
    }
  }

  void notify([ViewEvent event = const UpdateViewEvent()]) {
    for (var element in _observerList) {
      element.notify(event);
    }
  }
}
