import '../domain/log_level.dart';

class AnsiColors {
  static const String reset = '\u001B[0m';
  static const String red = '\u001B[31m';
  static const String green = '\u001B[32m';
  static const String yellow = '\u001B[33m';
  static const String blue = '\u001B[34m';
  static const String magenta = '\u001B[35m';
  static const String cyan = '\u001B[36m';
  static const String gray = '\u001B[90m';

  static const Map<LogLevel, String> logColors = {
    LogLevel.debug: green,
    LogLevel.info: blue,
    LogLevel.warning: yellow,
    LogLevel.error: red,
    LogLevel.fatal: red,
    LogLevel.special: magenta,
    LogLevel.data: cyan,
    LogLevel.json: cyan,
  };

  static String applyColor(String message, LogLevel level) {
    return '${logColors[level] ?? reset}$message$reset';
  }
}
