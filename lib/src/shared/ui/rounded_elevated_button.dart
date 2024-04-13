import 'package:flutter/material.dart';

import '../extensions/context_exts.dart';

class RoundedElevatedButton extends StatelessWidget {
  const RoundedElevatedButton._({
    required this.label,
    this.icon,
    required this.onPressed,
  });

  final Widget label;
  final Widget? icon;
  final VoidCallback? onPressed;

  factory RoundedElevatedButton({
    required Widget label,
    VoidCallback? onPressed,
  }) {
    return RoundedElevatedButton._(
      label: label,
      onPressed: onPressed,
    );
  }

  factory RoundedElevatedButton.icon({
    required Widget label,
    required Widget icon,
    VoidCallback? onPressed,
  }) {
    return RoundedElevatedButton._(
      label: label,
      icon: icon,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = context.theme.elevatedButtonTheme.style?.copyWith(
      elevation: const MaterialStatePropertyAll(0),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        const StadiumBorder(),
      ),
    );

    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon!,
        label: label,
        style: style?.copyWith(
          padding: MaterialStatePropertyAll(
            const EdgeInsets.all(8.0).copyWith(right: 14.0),
          ),
        ),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: style?.copyWith(
        padding: const MaterialStatePropertyAll(EdgeInsets.all(8.0)),
      ),
      child: label,
    );
  }
}
