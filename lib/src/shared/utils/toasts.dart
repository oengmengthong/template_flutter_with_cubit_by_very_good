import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

enum ToastVariant { success, error, info }

enum ToastTimeout { none, short, long }

class ToastStyle {
  const ToastStyle({
    required this.backgroundColor,
    required this.iconData,
  });

  final Color backgroundColor;
  final IconData iconData;
}

final _toastStyle = {
  ToastVariant.success: const ToastStyle(
    backgroundColor: Color(0xFF4C5157),
    iconData: Icons.check_circle,
  )
};
final _toastDuration = {
  ToastTimeout.none: const Duration(),
  ToastTimeout.short: const Duration(seconds: 3),
  ToastTimeout.long: const Duration(seconds: 5)
};

CancelFunc toast(
  String message, {
  ToastVariant variant = ToastVariant.success,
  ToastTimeout timeout = ToastTimeout.short,
}) {
  final style = _toastStyle[variant];

  return BotToast.showCustomText(
    duration: _toastDuration[timeout],
    align: Alignment.bottomCenter,
    onlyOne: true,
    toastBuilder: (cancelFn) {
      return Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: style?.backgroundColor,
          boxShadow: const [
            BoxShadow(color: Color.fromRGBO(76, 81, 87, 0.5), blurRadius: 10)
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Icon(
                style?.iconData,
                color: Colors.white,
              ),
              const SizedBox(width: 12.0),
              Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontFamily: 'Jersey',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

CancelFunc showWidget(Widget widget) {
  return BotToast.showWidget(toastBuilder: (_) => widget);
}

CancelFunc showLoading() => BotToast.showLoading();
