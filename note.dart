library log_er;

import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

/// 🚀 Advanced, eye-catching, and colorful logging tool.
class Log {
  Log._();

  static bool enableLogging = true;
  static bool useAnsiColors =
      stdout.supportsAnsiEscapes && !_isVSCodeDebugConsole();
  static Set<String> disabledCategories = {};
  static bool logToFileEnabled = false;
  static String logFilePath = 'log.txt';

  /// 📌 ANSI Color Codes (Cross-Platform)
  static const String _reset = '\x1B[0m';
  static const String _red = '\x1B[31m';
  static const String _green = '\x1B[32m';
  static const String _yellow = '\x1B[33m';
  static const String _blue = '\x1B[34m';
  static const String _magenta = '\x1B[35m';
  static const String _cyan = '\x1B[36m';

  /// ✅ Detects if running in VS Code Debug Console
  static bool _isVSCodeDebugConsole() {
    return Platform.environment.containsKey('VSCODE_PID'); // VS Code check
  }

  /// 🎨 Applies ANSI color if enabled
  static String _applyColor(String text, String color) {
    return useAnsiColors ? '$color$text$_reset' : text;
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

  /// 📜 Wraps text dynamically based on terminal width
  static List<String> _wrapText(String text) {
    final int terminalWidth = stdout.hasTerminal ? stdout.terminalColumns : 100;
    List<String> lines = [];
    RegExp regExp = RegExp('(.{1,$terminalWidth})(?:s|\$)');
    for (var match in regExp.allMatches(text)) {
      lines.add(match.group(0)!.trim());
    }
    return lines;
  }

  /// 🎯 General log method
  static void log(
    String message, {
    String color = _reset,
    String category = 'LOG',
    StackTrace? stackTrace,
    bool withTimestamp = false,
  }) {
    if (!enableLogging || disabledCategories.contains(category)) return;

    final filePath = _getCallerFilePath();
    final wrappedMessage = _wrapText(message);
    final maxLength = wrappedMessage.fold<int>(
        category.length, (max, line) => line.length > max ? line.length : max);
    final separator = '─' * (maxLength + 10);

    final formattedMessage = _applyColor(
      '\n🚀 [$category] $separator\n💡 |\n💡 | ${wrappedMessage.join('\n💡 | ')}\n💡 | \n💡 | 📂 Source: $filePath\n💡 | $separator',
      color,
    );

    print(formattedMessage);

    if (logToFileEnabled) {
      _writeToFile(message, category);
    }

    developer.log(
      message.replaceAll(
          RegExp(r'\x1B\[[0-9;]*m'), ''), // Remove ANSI color codes
      name: category,
      stackTrace: stackTrace,
    );
  }

  /// 🚨 Error Log
  static void error(String message, {StackTrace? stackTrace}) =>
      log('🔥 $message',
          color: _red, category: 'ERROR', stackTrace: stackTrace);

  /// 🛠️ Debug Log
  static void debug(String message, {StackTrace? stackTrace}) =>
      log('✅ $message',
          color: _green, category: 'DEBUG', stackTrace: stackTrace);

  /// ⚠️ Warning Log
  static void warning(String message, {StackTrace? stackTrace}) =>
      log('🚨 $message',
          color: _yellow, category: 'WARNING', stackTrace: stackTrace);

  /// ℹ️ Info Log
  static void info(String message,
          {StackTrace? stackTrace, bool withTimestamp = false}) =>
      log('🔵 $message',
          color: _blue,
          category: 'INFO',
          stackTrace: stackTrace,
          withTimestamp: withTimestamp);

  /// 💜 Special Log
  static void special(String message, {StackTrace? stackTrace}) =>
      log('💜 $message',
          color: _magenta, category: 'SPECIAL', stackTrace: stackTrace);

  /// 📊 Data Log
  static void data(String message, {StackTrace? stackTrace}) =>
      log('📊 $message',
          color: _cyan, category: 'DATA', stackTrace: stackTrace);

  /// 💀 Fatal Error Log
  static void fatal(String message, {StackTrace? stackTrace}) =>
      log('💀 [FATAL] 💀 $message',
          color: _red, category: 'FATAL', stackTrace: stackTrace);

  /// 🌍 Logs a JSON object in a readable format
  static void json(Map<String, dynamic> data,
      {StackTrace? stackTrace, String category = 'JSON'}) {
    String jsonString = const JsonEncoder.withIndent('  ').convert(data);
    List<String> formattedJson =
        jsonString.split('\n').map((line) => '💾 | $line').toList();
    final maxLength = formattedJson.fold<int>(
        category.length, (max, line) => line.length > max ? line.length : max);
    final separator = '─' * (maxLength + 10);
    final filePath = _getCallerFilePath();

    final formattedMessage = _applyColor(
      '🚀 [$category] $separator\n${formattedJson.join('\n')}\n💾 | \n💾 | 📂 Source: $filePath\n💾 | $separator',
      _cyan,
    );

    print(formattedMessage);
    if (logToFileEnabled) {
      _writeToFile(jsonString, category);
    }
  }

  /// 📝 Writes log messages to a file
  static void _writeToFile(String message, String category) {
    try {
      final file = File(logFilePath);
      final timestamp = DateTime.now().toIso8601String();
      file.writeAsStringSync('[$timestamp] [$category] $message\n',
          mode: FileMode.append);
    } catch (e) {
      print('⚠️ Error writing log to file: $e');
    }
  }
}
