import 'dart:async';

import 'package:flutter/widgets.dart';

class FetchMoreListener extends StatefulWidget {
  const FetchMoreListener({
    super.key,
    required this.controller,
    required this.onFetchMore,
    this.endOffset = 300,
    this.debounce = 150,
    required this.child,
  });

  final ScrollController controller;
  final VoidCallback onFetchMore;
  final double endOffset;
  final int debounce;
  final Widget child;

  @override
  State<FetchMoreListener> createState() => _FetchMoreListenerState();
}

class _FetchMoreListenerState extends State<FetchMoreListener> {
  Timer? _debounce;
  void Function()? _listener;

  @override
  void initState() {
    super.initState();
    listener() {
      final position = widget.controller.position;
      if (position.extentAfter < widget.endOffset) {
        if (_debounce?.isActive ?? false) _debounce?.cancel();

        _debounce = Timer(Duration(milliseconds: widget.debounce), () {
          widget.onFetchMore();
        });
      }
    }

    _listener = listener;
    widget.controller.addListener(listener);
  }

  @override
  void dispose() {
    if (_listener != null) {
      widget.controller.removeListener(_listener!);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
