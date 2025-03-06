import 'dart:io';
import 'package:stack_trace/stack_trace.dart';


class Log {
  /// Logs a debug message (🔹 Light Blue)
  /// Usage:
  /// Log.debug("Initializing app...");
  /// Log.debug("Fetching user data...");
  /// Log.debug("Requesting API...");
  static void debug(String message) =>
      _log(message, '🔹 DEBUG', '\x1B[36m', '\x1B[36m');

  /// Logs a fatal error (💀 Red Background)
  /// Usage:
  /// Log.fatal("Critical system failure!");
  /// Log.fatal("Kernel panic detected!");
  /// Log.fatal("Database corruption detected!");
  static void fatal(String message) =>
      _log(message, '💀 FATAL', '\x1B[41m', '\x1B[31m');

  /// Logs an error message (❌ Red)
  /// Usage:
  /// Log.error("API call failed with status 500!");
  /// Log.error("Database connection timeout!");
  /// Log.error("File not found exception!");
  static void error(String message) =>
      _log(message, '❌ ERROR', '\x1B[31m', '\x1B[31m');

  /// Logs a JSON formatted message (🍺 Green)
  /// Usage:
  /// Log.json('{ "status": "success", "user": { "id": 1, "name": "John" } }');
  /// Log.json('{ "error": "Invalid credentials" }');
  static void json(String jsonMessage) =>
      _log(jsonMessage, '🍺 JSON', '\x1B[32m', '\x1B[32m');

  /// Logs an informational message (✅ Blue)
  /// Usage:
  /// Log.info("User logged in successfully.");
  /// Log.info("App update available.");
  /// Log.info("Server is running smoothly.");
  static void info(String message) =>
      _log(message, '✅ INFO', '\x1B[34m', '\x1B[34m');

  /// Logs a warning message (🚨 Yellow)
  /// Usage:
  /// Log.warning("Low disk space detected!");
  /// Log.warning("Network connectivity issues detected.");
  /// Log.warning("Deprecated API method used.");
  static void warning(String message) =>
      _log(message, '🚨 WARNING', '\x1B[33m', '\x1B[33m');

  /// Logs a message in red (🔴)
  /// Usage:
  /// Log.red("This is a critical warning!");
  /// Log.red("High memory usage detected!");

  static void red(String message) =>
      _log(message, '🔴 RED', '\x1B[31m', '\x1B[31m');

  /// Logs a message in green (🟢)
  /// Usage:
  /// Log.green("Successfully completed the task.");
  /// Log.green("All tests passed.");
  static void green(String message) =>
      _log(message, '🟢 GREEN', '\x1B[32m', '\x1B[32m');

  /// Logs a message in yellow (🟡)
  /// Usage:
  /// Log.yellow("Battery is below 10%!");
  /// Log.yellow("Slow network detected.");
  static void yellow(String message) =>
      _log(message, '🟡 YELLOW', '\x1B[33m', '\x1B[33m');

  /// Logs a message in blue (🔵)
  /// Usage:
  /// Log.blue("User session started.");
  /// Log.blue("Feature flag enabled.");
  static void blue(String message) =>
      _log(message, '🔵 BLUE', '\x1B[34m', '\x1B[34m');

  /// Logs a message in cyan (🟦)
  /// Usage:
  /// Log.cyan("Fetching API data...");
  /// Log.cyan("Syncing cloud data...");
  static void cyan(String message) =>
      _log(message, '🟦 CYAN', '\x1B[36m', '\x1B[36m');
  static void magenta(String message) =>

      /// Logs a message in magenta (🟣)
      /// Usage:
      /// Log.magenta("Loading animation started.");
      /// Log.magenta("UI theme changed.");
      _log(message, '🟣 MAGENTA', '\x1B[35m', '\x1B[35m');

  /// Handles log formatting and prints it to the console.
  static void _log(
      String message, String logType, String titleColor, String messageColor) {
    var fileInfo = _getCallingFileInfo();
    String folderPath = fileInfo['folder'] as String;
    String fileName = fileInfo['file'] as String;
    String resetColor = '\x1B[0m'; // Reset ANSI color

    int terminalWidth = _getSafeTerminalWidth();
    int messageWidth = _getMaxLineWidth(message);

    int lineWidth = message.contains("\n") || messageWidth > terminalWidth
        ? terminalWidth
        : messageWidth;

    String line = '═' * lineWidth;
    String line2 = '─' * lineWidth;
    String folderLentgh = ('─' * (folderPath.length)) + '─' * 4;

    print('');
    print('  $titleColor$logType$resetColor  '.padRight(lineWidth));
    print('║$line');
    print('║');
    print('║ $messageColor📝 $message$resetColor'.padRight(lineWidth));
    print('║');
    print('║$line2');
    print('║ 📄  \x1B[35m$fileName\x1B[0m'.padRight(lineWidth));
    print('║$folderLentgh');
    if (folderPath.isNotEmpty) {
      print('║ 📂 \x1B[33m $folderPath \x1B[0m'.padRight(lineWidth));
    }
    print(line);
    print('');
  }

  /// Determines whether the platform is a web browser.
  static bool get _isWeb {
    try {
      return identical(0, 0.0);
    } catch (_) {
      return false;
    }
  }

  /// Retrieves the terminal width safely.
  static int _getSafeTerminalWidth() {
    if (_isWeb) {
      return 80;
    }

    try {
      return stderr.terminalColumns; // Konsol ortamlarında genişliği al
    } catch (_) {
      return 80; // Terminal genişliği alınamazsa varsayılanı kullan
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

  /// Retrieves the file name and folder path of the calling function
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
      return {'folder': '', 'file': 'Bilinmeyen Dosya'};
    }
  }
}
