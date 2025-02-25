import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

/// 🚀 Advanced, eye-catching, and colorful logging tool.
enum LogLevel { debug, info, warning, error, fatal, special, data, json }

class Log {
  Log._();

  static bool enableLogging = true;
  static bool useAnsiColors =
      stdout.supportsAnsiEscapes && !_isVSCodeDebugConsole();
  static Map<String, bool> categoryFilter = {};
  static bool logToFileEnabled = false;
  static String logFilePath = 'log.txt';
  static int maxLogFileSize = 5 * 1024 * 1024; // 5 MB

  /// 📌 ANSI Color Codes (Cross-Platform)
  static const Map<LogLevel, String> _logColors = {
    LogLevel.debug: '\x1B[32m',
    LogLevel.info: '\x1B[34m',
    LogLevel.warning: '\x1B[33m',
    LogLevel.error: '\x1B[31m',
    LogLevel.fatal: '\x1B[31m',
    LogLevel.special: '\x1B[35m',
    LogLevel.data: '\x1B[36m',
    LogLevel.json: '\x1B[36m',
  };
  static const String _reset = '\x1B[0m';

  /// ✅ Detects if running in VS Code Debug Console
  static bool _isVSCodeDebugConsole() {
    return Platform.environment.containsKey('VSCODE_PID');
  }

  /// 🎨 Applies ANSI color if enabled
  static String _applyColor(String text, LogLevel level) {
    return useAnsiColors ? '${_logColors[level]}$text$_reset' : text;
  }

  /// 📌 Determines the caller file path
  static String _getCallerFilePath() {
    if (!enableLogging) return '';
    final frames = StackTrace.current.toString().split('\n');
    for (var frame in frames) {
      if (!frame.contains('log_er.dart') && !frame.contains('dart:')) {
        final match = RegExp(r'\((.*?):\d+:\d+\)').firstMatch(frame);
        return match != null ? match.group(1)! : '📂 Unknown Source';
      }
    }
    return '📂 Unknown Source';
  }

  /// 🎯 General log method
  static void log(String message, {LogLevel level = LogLevel.info}) {
    if (!enableLogging || categoryFilter[level.name] == false) return;

    final filePath = _getCallerFilePath();
    final separator = '═' * (message.length + 10);
    final formattedMessage = _applyColor(
      '\n✨$separator[ 🚀 ${level.name.toUpperCase()} 🚀 ]$separator✨\n💡 | $message\n💡 | 📂 Source: $filePath',
      level,
    );

    print(formattedMessage);

    if (logToFileEnabled) {
      _writeToFile(message, level);
    }

    developer.log(
      message.replaceAll(RegExp(r'\x1B\[[0-9;]*m'), ''),
      name: level.name,
    );
  }

  /// 🚨 Error Log
  static void error(String message) => log('🔥 $message', level: LogLevel.error);

  /// 🛠️ Debug Log
  static void debug(String message) => log('✅ $message', level: LogLevel.debug);

  /// ⚠️ Warning Log
  static void warning(String message) => log('🚨 $message', level: LogLevel.warning);

  /// ℹ️ Info Log
  static void info(String message) => log('🔵 $message', level: LogLevel.info);

  /// 💜 Special Log
  static void special(String message) => log('💜 $message', level: LogLevel.special);

  /// 📊 Data Log
  static void data(String message) => log('📊 $message', level: LogLevel.data);

  /// 💀 Fatal Error Log
  static void fatal(String message) => log('💀 [FATAL] 💀 $message', level: LogLevel.fatal);

  /// 🌍 Logs a JSON object in a readable format
  static void json(Map<String, dynamic> data) {
    String jsonString = const JsonEncoder.withIndent('  ').convert(data);
    log(jsonString, level: LogLevel.json);
  }

  /// 📝 Writes log messages to a file with size management
  static void _writeToFile(String message, LogLevel level) {
    try {
      final file = File(logFilePath);
      if (file.existsSync() && file.lengthSync() > maxLogFileSize) {
        file.renameSync('$logFilePath.bak');
        file.writeAsStringSync('');
      }

      final timestamp = DateTime.now().toIso8601String();
      file.writeAsStringSync('[$timestamp] [${level.name.toUpperCase()}] $message\n',
          mode: FileMode.append);
    } catch (e) {
      print('⚠️ Error writing log to file: $e');
    }
  }
}
