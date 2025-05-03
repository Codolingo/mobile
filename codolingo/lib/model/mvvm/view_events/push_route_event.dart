import 'package:flutter/material.dart';
import 'package:codolingo/model/mvvm/view_event.dart';

/// Event to push a new route to the ui
class PushRouteEvent extends ViewEvent {
  const PushRouteEvent(this.route, {this.arguments, this.onResult, this.replace = false});

  /// The route to push
  final String route;

  /// The arguments to pass to the route
  final dynamic arguments;

  /// Whether to replace the current route or not
  final bool replace;

  /// The callback to call when the route is popped
  final void Function(dynamic)? onResult;

  @override
  void execute(context) {
    if (replace) {
      Navigator.of(context).pushReplacementNamed(route, arguments: arguments).then((value) {
        onResult?.call(value);
      });
    } else {
      Navigator.of(context).pushNamed(route, arguments: arguments).then((value) {
        onResult?.call(value);
      });
    }
  }
}
