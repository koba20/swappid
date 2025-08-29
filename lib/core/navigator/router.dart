import 'package:flutter/material.dart';

class KRoute<T> extends PageRouteBuilder<T> {
  KRoute({
    required Widget child,
    super.settings,
    Duration? duration,
  }) : super(
          transitionsBuilder: transitionBuilder,
          transitionDuration: duration ?? const Duration(milliseconds: 200),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );
}

// Shorthand for creating KRoute
class KR<T> extends MaterialPageRoute<T> {
  KR({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );
}

Widget transitionBuilder(context, animation, secondaryAnimation, child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}