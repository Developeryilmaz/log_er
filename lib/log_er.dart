import 'dart:io';
import 'package:stack_trace/stack_trace.dart';

class Log {
  /// Logs a debug message (🔹 Light Blue)
  ///
  /// Usage Examples:
  /// ```dart
  /// Log.debug("Initializing app...");
  /// Log.debug("Fetching user data...");
  /// Log.debug("Requesting API...");
  /// ```
  static void debug(String message) =>
      _log(message, '🔹 DEBUG', '\x1B[36m', '\x1B[36m');

  /// Logs a fatal error (💀 Red Background)
  ///
  /// Usage Examples:
  /// ```dart
  /// Log.fatal("Critical system failure!");
  /// Log.fatal("Kernel panic detected!");
  /// Log.fatal("Database corruption detected!");
  /// ```
  static void fatal(String message) =>
      _log(message, '💀 FATAL', '\x1B[41m', '\x1B[31m');

  /// Logs an error message (❌ Red)
  ///
  /// Usage Examples:
  /// ```dart
  /// Log.error("API call failed with status 500!");
  /// Log.error("Database connection timeout!");
  /// Log.error("File not found exception!");
  /// ```
  static void error(String message) =>
      _log(message, '❌ ERROR', '\x1B[31m', '\x1B[31m');

  /// Logs a JSON formatted message (🍺 Green)
  ///
  /// Usage Examples:
  /// ```dart
  /// Log.json('{ "status": "success", "user": { "id": 1, "name": "John" } }');
  /// Log.json('{ "error": "Invalid credentials" }');
  /// ```
  static void json(String jsonMessage) =>
      _log(jsonMessage, '🍺 JSON', '\x1B[32m', '\x1B[32m');

  /// Logs an informational message (✅ Blue)
  ///
  /// Usage Examples:
  /// ```dart
  /// Log.info("User logged in successfully.");
  /// Log.info("App update available.");
  /// Log.info("Server is running smoothly.");
  /// ```
  static void info(String message) =>
      _log(message, '✅ INFO', '\x1B[34m', '\x1B[34m');

  /// Logs a warning message (🚨 Yellow)
  ///
  /// Usage Examples:
  /// ```dart
  /// Log.warning("Low disk space detected!");
  /// Log.warning("Network connectivity issues detected.");
  /// Log.warning("Deprecated API method used.");
  /// ```
  static void warning(String message) =>
      _log(message, '🚨 WARNING', '\x1B[33m', '\x1B[33m');

  /// Logs a message in red (🔴)
  ///
  /// Usage Examples:
  /// ```dart
  /// Log.red("This is a critical warning!");
  /// Log.red("High memory usage detected!");
  /// ```
  static void red(String message) =>
      _log(message, '🔴 RED', '\x1B[31m', '\x1B[31m');

  /// Logs a message in green (🟢)
  ///
  /// Usage Examples:
  /// ```dart
  /// Log.green("Successfully completed the task.");
  /// Log.green("All tests passed.");
  /// ```
  static void green(String message) =>
      _log(message, '🟢 GREEN', '\x1B[32m', '\x1B[32m');

  /// Logs a message in yellow (🟡)
  ///
  /// Usage Examples:
  /// ```dart
  /// Log.yellow("Battery is below 10%!");
  /// Log.yellow("Slow network detected.");
  /// ```
  static void yellow(String message) =>
      _log(message, '🟡 YELLOW', '\x1B[33m', '\x1B[33m');

  /// Logs a message in blue (🔵)
  ///
  /// Usage Examples:
  /// ```dart
  /// Log.blue("User session started.");
  /// Log.blue("Feature flag enabled.");
  /// ```
  static void blue(String message) =>
      _log(message, '🔵 BLUE', '\x1B[34m', '\x1B[34m');

  /// Logs a message in cyan (🟦)
  ///
  /// Usage Examples:
  /// ```dart
  /// Log.cyan("Fetching API data...");
  /// Log.cyan("Syncing cloud data...");
  /// ```
  static void cyan(String message) =>
      _log(message, '🟦 CYAN', '\x1B[36m', '\x1B[36m');

  /// Logs a message in magenta (🟣)
  ///
  /// Usage Examples:
  /// ```dart
  /// Log.magenta("Loading animation started.");
  /// Log.magenta("UI theme changed.");
  /// ```
  static void magenta(String message) =>
      _log(message, '🟣 MAGENTA', '\x1B[35m', '\x1B[35m');

  /// Handles log formatting and prints it to the console.
  static void _log(
      String message, String logType, String titleColor, String messageColor) {
    var fileInfo = _getCallingFileInfo();
    String folderPath = fileInfo['folder'] as String;
    String fileName = fileInfo['file'] as String;
    String resetColor = '\x1B[0m'; // Reset ANSI color

    int fileWidth = folderPath.length;

    String fileLine = '$messageColor─$resetColor' * fileWidth +
        '$messageColor─$resetColor' * 8;

    int terminalWidth = _getSafeTerminalWidth();
    int messageWidth = _getMaxLineWidth(message);

    int lineWidth = message.contains("\n") || messageWidth > terminalWidth
        ? terminalWidth
        : messageWidth;

    String line = '$messageColor═$resetColor' * lineWidth;

    print('');
    print('  $messageColor$logType$resetColor  '.padRight(lineWidth));
    print('$messageColor╔$line$resetColor');
    print('$messageColor║$resetColor');
    print(
        '$titleColor║ $messageColor📝 $message$resetColor'.padRight(lineWidth));
    print('$messageColor║$resetColor');
    print('$messageColor║$fileLine$resetColor');
    print('$messageColor║$resetColor' '\x1B[32m 📄 $fileName$resetColor');
    print('$messageColor║$fileLine$resetColor');
    print('$messageColor║$resetColor' '\x1B[35m 📂 $folderPath$resetColor');
    print('$messageColor╚$line$resetColor');
    print('');
  }

  /// Retrieves the terminal width safely.
  static int _getSafeTerminalWidth() {
    try {
      return stderr.terminalColumns;
    } catch (_) {
      return 80; // Default terminal width if unavailable
    }
  }

  /// Determines the maximum line width in a given message.
  static int _getMaxLineWidth(String message) {
    return message
            .split("\n")
            .map((line) => line.length)
            .reduce((a, b) => a > b ? a : b) +
        4;
  }

  /// Retrieves the file name and folder path of the calling function.
  static Map<String, String> _getCallingFileInfo() {
    try {
      var trace = Trace.current(2);
      var frame = trace.frames[0];
      String filePath = frame.uri.toString();

      if (filePath.startsWith('file://')) {
        filePath = filePath.replaceFirst('file://', '');
      }

      var file = File(filePath);
      var parentPath = file.parent.path;
      var fileName = file.uri.pathSegments.last;

      if (parentPath.contains('/lib/')) {
        parentPath = parentPath.split('/lib/').last;
      } else {
        parentPath = parentPath.split('/').last;
      }

      return {
        'folder': parentPath.isNotEmpty ? parentPath : '',
        'file': fileName
      };
    } catch (e) {
      return {'folder': '', 'file': 'Unknown File'};
    }
  }
}
