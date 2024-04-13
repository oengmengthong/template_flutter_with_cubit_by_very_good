import 'package:jiffy/jiffy.dart';

/// A utility class for working with dates.
class Dates {
  Dates._();

  /// Formats a [DateTime] object to a string in the format "dd MMM yyyy, h:mm a".
  /// For example, "01 Jan 2021, 12:00 AM".
  static String formatFullDateTime(DateTime dateTime) {
    return Jiffy.parseFromDateTime(dateTime)
        .toLocal()
        .format(pattern: 'dd MMM yyyy, h:mm a');
  }

  /// Returns a list of two [DateTime] objects representing the start and end of a period of time.
  /// The length of the period is determined by the [days] parameter.
  /// If [days] is positive, the period starts from the current date and ends [days] days later.
  /// If [days] is negative, the period starts [days] days ago and ends on the current date.
  /// If [days] is zero, the period starts and ends on the current date.
  static List<DateTime> getPeriod(int days) {
    final now = Jiffy.now();
    if (days > 0) {
      return [
        startDayOf(now.dateTime),
        endDayOf(now.add(days: days.abs()).dateTime),
      ];
    } else if (days < 0) {
      return [
        startDayOf(now.subtract(days: days.abs()).dateTime),
        endDayOf(now.dateTime),
      ];
    } else {
      return [
        startDayOf(now.dateTime),
        endDayOf(now.dateTime),
      ];
    }
  }

  /// Returns a string representation of the date part of the given [dateTime] object
  /// formatted as 'dd MMM yyyy'.
  /// For example, "01 Jan 2021"
  static String getDateOnly(DateTime dateTime) {
    return Jiffy.parseFromDateTime(dateTime)
        .toLocal()
        .format(pattern: 'dd MMM yyyy');
  }

  /// Returns a string representation of the time part of the given [dateTime] object
  /// formatted as 'h:mm a'.
  /// For example, "12:00 AM".
  static String getTimeOnly(DateTime dateTime) {
    return Jiffy.parseFromDateTime(dateTime)
        .toLocal()
        .format(pattern: 'h:mm a');
  }

  /// Returns the start of the day for the given [dateTime].
  /// The returned [DateTime] object has the same year, month and day as the input [dateTime],
  /// but with the time set to 00:00:00.000.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// DateTime startOfDay = startDayOf(now); // returns a DateTime object with time set to 00:00:00.000
  /// ```
  static DateTime startDayOf(DateTime dateTime) {
    return Jiffy.parseFromDateTime(dateTime)
        .startOf(Unit.day)
        .withoutMicroseconds()
        .dateTime;
  }

  /// Returns the end of the day for the given [dateTime].
  /// The returned [DateTime] object has the same year, month and day as the input [dateTime],
  /// but with the time set to 23:59:59.999.
  /// ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// DateTime endDayOf = endDayOf(now); // returns a DateTime object with time set to 23:59:59.999
  /// ```
  static DateTime endDayOf(DateTime dateTime) {
    return Jiffy.parseFromDateTime(dateTime)
        .endOf(Unit.day)
        .withoutMicroseconds()
        .dateTime;
  }

  /// Returns a new [DateTime] object with the date values from [des] and the time values from [src].
  ///
  /// The [src] parameter is used to get the time values (hour, minute, second, millisecond) to be copied to the new [DateTime] object.
  /// The [des] parameter is used to get the date values (year, month, day) to be copied to the new [DateTime] object.
  static DateTime copyDate(DateTime src, DateTime des) {
    return DateTime(
      des.year,
      des.month,
      des.day,
      src.hour,
      src.minute,
      src.second,
      src.millisecond,
    );
  }

  /// Returns a new [DateTime] object with the time values from [des] and the date values from [src].
  ///
  /// The [src] parameter is used to get the date values (year, month, day) to be copied to the new [DateTime] object.
  /// The [des] parameter is used to get the time values (hour, minute, second, millisecond) to be copied to the new [DateTime] object.
  static DateTime copyTime(DateTime src, DateTime des) {
    return DateTime(
      src.year,
      src.month,
      src.day,
      des.hour,
      des.minute,
      des.second,
      des.millisecond,
    );
  }

  /// Returns the day of the week as a string for the given [date].
  /// The [date] parameter is a [DateTime] object.
  /// The returned string is the abbreviated name of the day of the week (e.g. "Mon" for Monday).
  static String getDayOfWeek(DateTime date) {
    return Jiffy.parseFromDateTime(date).toLocal().E;
  }

  /// Returns a list of [DateTime] objects representing the first days of the
  /// last [days] days, [weeks] weeks, and [months] months starting from the
  /// given [startDate].
  ///
  /// The [startDate] parameter is required and represents the starting date.
  ///
  /// The [days] parameter is optional and represents the number of days to go
  /// back from the [startDate] to get the first day of each day.
  ///
  /// The [weeks] parameter is optional and represents the number of weeks to go
  /// back from the [startDate] to get the first day of each week.
  ///
  /// The [months] parameter is optional and represents the number of months to go
  /// back from the [startDate] to get the first day of each month.
  ///
  /// The function uses the [Jiffy] package to perform date calculations.
  static List<DateTime> getFirstDays(
    DateTime startDate, {
    int days = 0,
    int weeks = 0,
    int months = 0,
  }) {
    List<DateTime> firstDays = [];

    // Get date for the last number of days
    for (int i = 0; i < days; i++) {
      final day = startDate.subtract(Duration(days: i));
      firstDays.add(DateTime(day.year, day.month, day.day));
    }

    // Get first day of the week for the last number of weeks
    for (int i = 0; i < weeks; i++) {
      final firstDayOfWeek = startDate.subtract(
        Duration(days: startDate.weekday - 1 + i * 7),
      );
      firstDays.add(
        DateTime(firstDayOfWeek.year, firstDayOfWeek.month, firstDayOfWeek.day),
      );
    }

    // Get first day of the month for the last number of months
    for (int i = 0; i < months; i++) {
      final firstDayOfMonth = DateTime(startDate.year, startDate.month - i, 1);
      firstDays.add(firstDayOfMonth);
    }

    return firstDays;
  }

  /// Returns a list of two [DateTime] objects representing the start and end of last year.
  /// The start of last year is the first second of January 1st of the previous year.
  /// The end of last year is the last second of December 31st of the previous year.
  static List<DateTime> getLastYear() {
    final lastYear = Jiffy.now().subtract(years: 1);
    return [
      lastYear.startOf(Unit.year).withoutMicroseconds().dateTime,
      lastYear.endOf(Unit.year).withoutMicroseconds().dateTime,
    ];
  }

  static bool isToday(DateTime dateTime) {
    final now = DateTime.now();
    return dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;
  }
}

extension JiffyX on Jiffy {
  Jiffy withoutMicroseconds() {
    return Jiffy.parseFromDateTime(
      DateTime(
        year,
        month,
        date,
        hour,
        minute,
        second,
        millisecond,
      ),
    );
  }
}
