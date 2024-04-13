import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

class ListenableListener<T extends Listenable> extends StatefulWidget {
  const ListenableListener({
    super.key,
    required this.listener,
    required this.child,
  });

  final void Function(T value, VoidCallback cancel) listener;
  final Widget child;

  @override
  State<ListenableListener<T>> createState() => _ListenableListenerState<T>();
}

class _ListenableListenerState<T extends Listenable>
    extends State<ListenableListener<T>> {
  late VoidCallback _listener;
  late T _listenable;

  @override
  void initState() {
    _listenable = context.read<T>();

    listener() => widget.listener(_listenable, cancel);

    _listenable.addListener(listener);
    _listener = listener;

    super.initState();
  }

  @override
  void dispose() {
    cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void cancel() {
    _listenable.removeListener(_listener);
  }
}
