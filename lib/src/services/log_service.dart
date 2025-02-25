import 'dart:developer' as developer;
import '../core/log_colors.dart';
import '../core/log_file_manager.dart';
import '../core/log_util.dart';

enum LogLevel { debug, info, warning, error, fatal }

class Log {
  static bool enableLogging = true;
  static bool writeToLogFile = false;
  static bool useAnsiColors = true;

  /// Logs a message with a specific log level.
  static void log(
    String message, {
    required LogLevel level,
    StackTrace? stackTrace,
    bool withTimestamp = false,
    int maxWidth = 80,
  }) {
    if (!enableLogging) return;

    final filePath = LogUtil.getCallerFilePath();
    final timestamp =
        withTimestamp ? '[${DateTime.now().toIso8601String()}] ' : '';
    final separator = '─' * (message.length + 10);

    final color = _getColor(level);
    final formattedMessage = LogColors.applyColor(
      '''
✨═══[ 🚀 ${level.name.toUpperCase()} 🚀 ]═══✨
💡 | $timestamp
💡 | $message
💡 | $separator
💡 | 📂 File: $filePath
💡 | $separator
''',
      color,
      useAnsiColors: useAnsiColors,
    );

    print(formattedMessage);

    if (writeToLogFile) {
      LogFileManager.writeLogToFile(formattedMessage);
    }

    developer.log(message, name: level.name, stackTrace: stackTrace);
  }

  /// Returns the ANSI color based on log level.
  static String _getColor(LogLevel level) {
    switch (level) {
      case LogLevel.error:
      case LogLevel.fatal:
        return LogColors.red;
      case LogLevel.debug:
        return LogColors.green;
      case LogLevel.warning:
        return LogColors.yellow;
      case LogLevel.info:
        return LogColors.blue;
    }
  }

  static void debug(String message, {StackTrace? stackTrace}) => log(message,
      level: LogLevel.debug, stackTrace: stackTrace ?? StackTrace.current);

  static void info(String message, {StackTrace? stackTrace}) => log(message,
      level: LogLevel.info, stackTrace: stackTrace ?? StackTrace.current);

  static void warning(String message, {StackTrace? stackTrace}) => log(message,
      level: LogLevel.warning, stackTrace: stackTrace ?? StackTrace.current);

  static void error(String message, {StackTrace? stackTrace}) => log(message,
      level: LogLevel.error, stackTrace: stackTrace ?? StackTrace.current);

  static void fatal(String message, {StackTrace? stackTrace}) => log(message,
      level: LogLevel.fatal, stackTrace: stackTrace ?? StackTrace.current);
}
