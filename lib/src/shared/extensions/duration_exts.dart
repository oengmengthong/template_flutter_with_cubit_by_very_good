extension PrettyDuration on Duration {
  String prettyMinutes() {
    return '${_addLeadingZero(inMinutes)}:${_addLeadingZero(inSeconds)}';
  }

  String prettySeconds() {
    return '${_addLeadingZero(inSeconds)}s';
  }

  String _addLeadingZero(int value) {
    if (value < 10) return '0$value';
    return value.toString();
  }
}

extension HumanReadableDuration on Duration {
  String toHumanReadable(String pattern) {
    if (pattern == 'HH:mm:ss') {
      return toString().split('.').first.padLeft(8, '0');
    } else if (pattern == 'mm:ss') {
      final minutes = (inSeconds ~/ 60).toString().padLeft(2, '0');
      final seconds = (inSeconds % 60).toString().padLeft(2, '0');
      return '$minutes:$seconds';
    } else {
      throw UnsupportedError('$pattern is not supported');
    }
  }
}
