import 'dart:async';

import 'package:flutter/widgets.dart';

class StreamListener<T> extends StatefulWidget {
  const StreamListener({
    super.key,
    required this.stream,
    required this.listener,
    required this.child,
  });

  final Stream<T> stream;
  final void Function(T value) listener;
  final Widget child;

  @override
  State<StreamListener<T>> createState() => _StreamListenerState<T>();
}

class _StreamListenerState<T> extends State<StreamListener<T>> {
  late final StreamSubscription<T> _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = widget.stream.listen(widget.listener);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
