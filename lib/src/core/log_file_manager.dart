import 'dart:io';

/// Manages log file operations.
class LogFileManager {
  static String logFilePath = 'default_log.txt';

  static void setLogFilePath(String path) {
    logFilePath = path;
  }

  /// Writes logs to a file (if enabled)
  static Future<void> writeLogToFile(String message) async {
    try {
      final file = File(logFilePath);
      await file.writeAsString('$message\n', mode: FileMode.append);
    } catch (e) {
      print("⚠️ Log file write error: $e");
    }
  }
}
