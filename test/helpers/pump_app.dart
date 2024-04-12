import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/l10n/l10n.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: widget,
      ),
    );
  }
}
