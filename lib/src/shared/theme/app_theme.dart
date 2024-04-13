import 'package:flutter/material.dart';

import 'app_theme_data.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    super.key,
    required this.themeData,
    required super.child,
  });

  final AppThemeData themeData;

  static AppThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>()?.themeData;
  }

  static AppThemeData of(BuildContext context) {
    final AppThemeData? result = maybeOf(context);
    assert(result != null, 'No AppThemeData in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return oldWidget.themeData != themeData;
  }
}
