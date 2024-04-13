import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class Filter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

final logger = Logger(
  filter: Filter(),
  printer: GetIt.I<LogPrinter>(),
);
