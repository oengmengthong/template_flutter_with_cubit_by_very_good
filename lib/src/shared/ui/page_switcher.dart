import 'package:flutter/widgets.dart';
import 'package:animations/animations.dart';

enum PageDirection { forward, backward }

enum PageAxis { horizontal, vertical }

final _pageAxis = {
  PageAxis.horizontal: SharedAxisTransitionType.horizontal,
  PageAxis.vertical: SharedAxisTransitionType.vertical,
};

class PageSwitcher extends StatelessWidget {
  const PageSwitcher({
    super.key,
    this.axis = PageAxis.horizontal,
    this.direction = PageDirection.forward,
    this.duration = const Duration(milliseconds: 500),
    required this.child,
  });

  final PageAxis axis;
  final PageDirection direction;
  final Duration duration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      reverse: direction == PageDirection.backward,
      duration: duration,
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: _pageAxis[axis]!,
          child: child,
        );
      },
      child: child,
    );
  }
}
