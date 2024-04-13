import 'package:jiffy/jiffy.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// A utility class for working with strings.
///
/// This class contains static methods for common string operations.
class Strings {
  const Strings._();

  /// Removes all whitespace characters from the given [value] string.
  ///
  /// Returns the modified string.
  static String trim(String value) {
    return value.replaceAll(RegExp(r'\s+'), '');
  }

  static String subString(String value, int length) {
    if (length <= 0) {
      return '';
    }
    return value.length < length ? value : value.substring(0, length);
  }

  static String textAndNumOnly(String value) {
    RegExp specialCharRegExp = RegExp(r'[^\w\s]');

    return value.replaceAll(specialCharRegExp, '');
  }

  /// Returns the initials of the given [name] string.
  ///
  /// If the name contains only one word, the first two letters of that word
  /// will be returned. Otherwise, the first letter of the first and last words
  /// will be returned.
  ///
  /// Returns the initials as a capitalized string.
  static String getInitials(String name) {
    final List<String> names = name.split(' ');

    if (names.length < 2) {
      return subString(names.first, 2).toUpperCase();
    }

    return '${subString(names.first, 1)}${subString(names.last, 1)}'
        .toUpperCase();
  }

  static Future<String> appVersion({
    bool? buildNumber = true,
  }) async {
    final info = await PackageInfo.fromPlatform();
    if (buildNumber == false) {
      return info.version;
    }
    return '${info.version} (${info.buildNumber})';
  }

  static shortDateTimeName(DateTime dateTime) {
    return Jiffy.parseFromDateTime(dateTime)
        .toLocal()
        .format(pattern: 'dMMyy h mm a');
  }
}

extension StringX on String? {
  String? noSpaces() => this == null ? null : Strings.trim(this!);
}
