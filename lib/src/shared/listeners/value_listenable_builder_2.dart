import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// A widget that rebuilds when either of two [ValueListenable]s change.
///
/// This widget is similar to [ValueListenableBuilder], but it takes two
/// [ValueListenable]s instead of one. The [builder] function is called whenever
/// either of the [ValueListenable]s change, with the current values of both
/// [ValueListenable]s.
///
/// The [child] parameter is optional, and is passed to the [builder] function.
///
/// Example:
///
/// ```dart
/// ValueListenableBuilder2(
///   first: firstValueListenable,
///   second: secondValueListenable,
///   builder: (context, firstValue, secondValue, child) {
///     return Text('$firstValue $secondValue');
///   },
/// )
/// ```
class ValueListenableBuilder2<A, B> extends StatelessWidget {
  const ValueListenableBuilder2({
    required this.first,
    required this.second,
    super.key,
    required this.builder,
    this.child,
  });

  final ValueListenable<A> first;
  final ValueListenable<B> second;
  final Widget? child;
  final Widget Function(BuildContext context, A a, B b, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: first,
      builder: (_, a, __) {
        return ValueListenableBuilder<B>(
          valueListenable: second,
          builder: (context, b, __) {
            return builder(context, a, b, child);
          },
        );
      },
    );
  }
}
