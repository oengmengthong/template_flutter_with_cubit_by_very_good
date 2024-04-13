import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme_data.dart';

snackBarWidget({
  required String message,
  SnackBarAction? action,
  Color? backgroundColor,
  Widget? prefixIcon,
}) {
  BotToast.showCustomText(
    duration: const Duration(seconds: 2),
    onlyOne: true,
    animationDuration: const Duration(milliseconds: 500),
    animationReverseDuration: const Duration(milliseconds: 500),
    enableKeyboardSafeArea: true,
    useSafeArea: true,
    align: Alignment.bottomCenter,
    toastBuilder: (_) => Container(
      margin: EdgeInsets.all(AppThemeData.light().spacing.marginMedium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppThemeData.light().spacing.borderRadiusMedium,
        ),
        color: backgroundColor ?? AppThemeData.light().greyCircleColor,
      ),
      padding: EdgeInsets.all(AppThemeData.light().spacing.marginMedium),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (prefixIcon != null) ...{
            prefixIcon,
            const SizedBox(width: 8.0),
          },
          DefaultTextStyle(
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'KB PRASAC',
              package: 'core_ui',
            ),
            child: Text(message),
          )
        ],
      ),
    ),
  );
}
