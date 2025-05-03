import 'dart:async';

import 'package:flutter/material.dart';

/// Base class for all view events.
abstract class ViewEvent {
  const ViewEvent();

  FutureOr<dynamic> execute(BuildContext context);
}
