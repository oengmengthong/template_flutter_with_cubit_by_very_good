import 'package:flutter/widgets.dart';

import 'keyboards.dart';

/// Clears current focus when navigation happens.
class ClearFocusNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    unFocusPrimaryFocus();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    unFocusPrimaryFocus();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    unFocusPrimaryFocus();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    unFocusPrimaryFocus();
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    unFocusPrimaryFocus();
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    unFocusPrimaryFocus();
  }
}
