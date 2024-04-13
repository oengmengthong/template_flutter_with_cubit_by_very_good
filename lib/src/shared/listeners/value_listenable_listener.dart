import 'package:flutter/widgets.dart';

class ValueListenableListener extends StatefulWidget {
  const ValueListenableListener({
    super.key,
    required this.valueListenable,
    required this.onListen,
    required this.child,
  });

  final Listenable valueListenable;
  final void Function() onListen;
  final Widget child;

  @override
  State<ValueListenableListener> createState() {
    return _ValueListenableListenerState();
  }
}

class _ValueListenableListenerState extends State<ValueListenableListener> {
  @override
  void initState() {
    super.initState();
    widget.valueListenable.addListener(widget.onListen);
  }

  @override
  void dispose() {
    widget.valueListenable.removeListener(widget.onListen);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ValueListenableListener oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.valueListenable != widget.valueListenable) {
      oldWidget.valueListenable.removeListener(widget.onListen);
      widget.valueListenable.addListener(widget.onListen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
