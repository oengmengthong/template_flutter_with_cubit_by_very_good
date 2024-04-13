import 'dart:async';

import 'package:flutter/material.dart';

import '../extensions/duration_exts.dart';

typedef CountDownWidgetBuilder = Widget Function(
  BuildContext context,
  String text,
);

class CountDownController {
  CountDownController({required this.duration});

  final Duration duration;
  Timer? _timer;
  final _controller = StreamController<Duration>.broadcast();

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_controller.isClosed) return;
      _controller.add(duration - Duration(seconds: timer.tick));
    });
  }

  void stop() {
    _timer?.cancel();
  }

  void dispose() {
    stop();
    _controller.close();
  }

  Stream<Duration> get stream {
    return _controller.stream;
  }
}

class CountDownText extends StatefulWidget {
  const CountDownText({
    super.key,
    required this.controller,
    this.textAlign,
    this.textStyle,
    this.formatter,
    this.builder,
  });

  final CountDownController controller;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final String Function(Duration duration)? formatter;
  final CountDownWidgetBuilder? builder;

  @override
  State<CountDownText> createState() => _CountDownTextState();
}

class _CountDownTextState extends State<CountDownText> {
  StreamSubscription<Duration>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = widget.controller.stream.listen((diff) {
      if (diff.inSeconds > 0) return;
      widget.controller.stop();
    });
    widget.controller.start();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: widget.controller.duration,
      stream: widget.controller.stream,
      builder: ((context, snapshot) {
        final duration = snapshot.requireData;
        final formattedText =
            widget.formatter?.call(duration) ?? duration.prettySeconds();

        if (widget.builder != null) {
          return widget.builder!.call(context, formattedText);
        }

        return Text(
          formattedText,
          textAlign: widget.textAlign,
          style: widget.textStyle,
        );
      }),
    );
  }
}
