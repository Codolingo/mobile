import 'dart:async';

import 'package:flutter/material.dart';
import 'package:codolingo/model/mvvm/view_event.dart';

/// Event to show a dialog
class ShowDialogEvent extends ViewEvent {
  const ShowDialogEvent(this.dialog, {this.onResult});
  final Widget dialog;
  final void Function(dynamic)? onResult;

  @override
  FutureOr execute(BuildContext context) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) => dialog,
    ).then((value) {
      onResult?.call(value);
    });
  }
}
