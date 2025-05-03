import 'dart:async';

import 'package:flutter/material.dart';
import 'package:codolingo/model/mvvm/view_event.dart';

/// Event for showing a modal bottom sheet
class ModalBottomSheetEvent extends ViewEvent {
  const ModalBottomSheetEvent(this.widget);
  final Widget widget;

  @override
  FutureOr<dynamic> execute(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => widget,
    );
  }
}
