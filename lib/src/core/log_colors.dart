/// Defines ANSI color codes for log messages.
class LogColors {
  static const String reset = '\x1B[0m';
  static const String red = '\x1B[31m';
  static const String green = '\x1B[32m';
  static const String yellow = '\x1B[33m';
  static const String blue = '\x1B[34m';
  static const String magenta = '\x1B[35m';
  static const String cyan = '\x1B[36m';

  /// Applies an ANSI color to a given text.
  static String applyColor(String text, String color,
      {bool useAnsiColors = true}) {
    return (useAnsiColors && _isTerminal()) ? '$color$text$reset' : text;
  }

  /// Detects if ANSI colors should be used (i.e., running in a TTY terminal)
  static bool _isTerminal() {
    return !const bool.fromEnvironment('FLUTTER_TEST');
  }
}
