import 'package:codolingo/model/mvvm/view_event.dart';

/// Event to notify that the view should be updated.
///
/// By default, it should call a [setState] on the linked widget.
class UpdateViewEvent extends ViewEvent {
  const UpdateViewEvent();

  @override
  void execute(context) {
    // SHOULD BE IMPLEMENTED BY THE WIDGET ITSELF
    // setState can not be done here as it is protected
  }
}
