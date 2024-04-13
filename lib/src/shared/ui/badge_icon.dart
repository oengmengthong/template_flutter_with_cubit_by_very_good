import 'package:flutter/material.dart';

import '../extensions/context_exts.dart';

class BadgeIcon extends StatelessWidget {
  const BadgeIcon({
    super.key,
    this.borderColor = Colors.white,
    this.backgroundColor,
    required this.icon,
  });

  final Color borderColor;
  final Color? backgroundColor;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? context.appTheme.primaryColor,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(2.0),
      child: icon,
    );
  }
}
