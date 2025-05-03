import 'package:flutter/material.dart';
import 'package:codolingo/model/mvvm/view_event.dart';
import 'package:codolingo/model/mvvm/view_events/update_view_event.dart';

/// Base class for all event observers.
abstract class EventObserver {
  void notify(ViewEvent event);
}

abstract class WidgetEventObserver<T extends StatefulWidget> extends State<T> implements EventObserver {
  WidgetEventObserver();

  @override
  void notify(ViewEvent event) {
    if (event is UpdateViewEvent) {
      setState(() {});
      return;
    }
    event.execute(context);
  }
}
