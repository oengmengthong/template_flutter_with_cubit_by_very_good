import 'dart:io';
import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/shared/utils/strings.dart';

import '../injection.dart';

class NoLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return [];
  }
}

@module
abstract class AppModule {
  @development
  @preResolve
  @Named('appVersion')
  Future<String> get developmentAppVersion async {
    return 'DEV ${await Strings.appVersion()}';
  }

  @staging
  @preResolve
  @Named('appVersion')
  Future<String> get stagingAppVersion async {
    return 'STAGING ${await Strings.appVersion()}';
  }

  @production
  @preResolve
  @Named('appVersion')
  Future<String> get prodAppVersion => Strings.appVersion(buildNumber: false);

  @development
  @staging
  LogPrinter get devLogPrinter => PrettyPrinter();

  @production
  LogPrinter get prodLogPrinter {
    return NoLogPrinter();
  }

  @Named('defaultLocale')
  Locale get defaultLocale => const Locale('ja');
}
