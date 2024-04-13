import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'value_listenable_builder_2.dart';

/// A widget that rebuilds when either of three [ValueListenable]s change.
///
/// This widget is similar to [ValueListenableBuilder], but it takes three
/// [ValueListenable]s instead of one. The [builder] function is called whenever
/// either of the [ValueListenable]s change, with the current values of all three
/// [ValueListenable]s.
///
/// The [child] parameter is optional, and is passed to the [builder] function.
///
/// Example:
///
/// ```dart
/// ValueListenableBuilder3(
///   first: firstValueListenable,
///   second: secondValueListenable,
///   third: thirdValueListenable,
///   builder: (context, firstValue, secondValue, thirdValue, child) {
///     return Text('$firstValue $secondValue $thirdValue');
///   },
/// )
/// ```
class ValueListenableBuilder3<A, B, C> extends StatelessWidget {
  const ValueListenableBuilder3({
    super.key,
    required this.first,
    required this.second,
    required this.third,
    required this.builder,
    this.child,
  });

  final ValueListenable<A> first;
  final ValueListenable<B> second;
  final ValueListenable<C> third;
  final Widget? child;
  final Widget Function(
    BuildContext context,
    A a,
    B b,
    C c,
    Widget? child,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder2<A, B>(
      first: first,
      second: second,
      builder: (_, a, b, __) {
        return ValueListenableBuilder<C>(
          valueListenable: third,
          builder: (context, c, __) {
            return builder(context, a, b, c, child);
          },
        );
      },
    );
  }
}
