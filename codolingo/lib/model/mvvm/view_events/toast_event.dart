import 'package:codolingo/model/mvvm/view_event.dart';

/// Event to notify that a toast should be displayed.
///
/// THIS IS NOT IMPLEMENTED YET
class ToastEvent extends ViewEvent {
  const ToastEvent(this.message, this.type);
  final String message;
  final ToastType type;

  @override
  void execute(context) {
    // TO IMPLEMENT
  }
}

enum ToastType { success, error, warning }
