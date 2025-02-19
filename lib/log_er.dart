library log_er;

export 'log_er.dart';

// lib/log_er/log_er.dart
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:characters/characters.dart';
import 'dart:convert';

class Log {
  Log._();

  // ANSI escape codes for colors
  static const String _reset = '\x1B[0m';
  static const String _red = '\x1B[31m';
  static const String _green = '\x1B[32m';
  static const String _yellow = '\x1B[33m';
  static const String _blue = '\x1B[34m';
  static const String _magenta = '\x1B[35m';
  static const String _cyan = '\x1B[36m';

  // Detects if ANSI colors are supported
  static bool get _supportsAnsi => !kIsWeb && (defaultTargetPlatform != TargetPlatform.windows);

  static String _colorize(String text, String color) {
    return _supportsAnsi ? '$color$text$_reset' : text;
  }

  // General log method
  static void log(String message, {String color = _reset, StackTrace? stackTrace, bool useDebugPrint = true}) {
    final formattedMessage = _colorize('[LOG] $message', color);
    _log(formattedMessage, stackTrace: stackTrace, useDebugPrint: useDebugPrint);
  }

  // Color-coded log methods
  static void red(String message, {StackTrace? stackTrace}) => log(message, color: _red, stackTrace: stackTrace);
  static void green(String message, {StackTrace? stackTrace}) => log(message, color: _green, stackTrace: stackTrace);
  static void yellow(String message, {StackTrace? stackTrace}) => log(message, color: _yellow, stackTrace: stackTrace);
  static void blue(String message, {StackTrace? stackTrace}) => log(message, color: _blue, stackTrace: stackTrace);
  static void magenta(String message, {StackTrace? stackTrace}) => log(message, color: _magenta, stackTrace: stackTrace);
  static void cyan(String message, {StackTrace? stackTrace}) => log(message, color: _cyan, stackTrace: stackTrace);

  // 🔳 Boxed Log Formatter
  static String _formatBox(String message, String color) {
    const int padding = 2;
    const int maxWidth = 150;
    List<String> lines = _wrapText(message, maxWidth);

    int maxLength = lines.map(getVisibleLength).reduce((a, b) => a > b ? a : b);
    int contentWidth = maxLength + (padding * 2);

    StringBuffer buffer = StringBuffer();
    buffer.writeln('$color\n┌${'─' * contentWidth}┐');

    for (String line in lines) {
      buffer.writeln('│${' ' * padding}$line${' ' * (contentWidth - getVisibleLength(line) - padding)}│');
    }

    buffer.writeln('└${'─' * contentWidth}┘$_reset');
    return buffer.toString();
  }

  // 🔥 ERROR Logs
  static void error(String message, {StackTrace? stackTrace}) => _log(
        _formatBox('🔥 ERROR | $message', _red),
        stackTrace: stackTrace,
      );

  // ✅ DEBUG Logs
  static void debug(String message, {StackTrace? stackTrace}) => _log(
        _formatBox('🍺 DEBUG | $message', _green),
        stackTrace: stackTrace,
      );

  // ⚠️ WARNING Logs
  static void warning(String message, {StackTrace? stackTrace}) => _log(
        _formatBox('🚨 WARNING | $message', _yellow),
        stackTrace: stackTrace,
      );

  // ℹ️ INFO Logs
  static void info(String message, {StackTrace? stackTrace}) => _log(
        _formatBox('🔵 INFO | $message', _blue),
        stackTrace: stackTrace,
      );

  // 💜 SPECIAL Logs
  static void special(String message, {StackTrace? stackTrace}) => _log(
        _formatBox('💜 SPECIAL | $message', _magenta),
        stackTrace: stackTrace,
      );

  // ✅ DATA Logs
  static void data(String message, {StackTrace? stackTrace}) => _log(
        _formatBox('✅ DATA | $message', _cyan),
        stackTrace: stackTrace,
      );

  // 🌟 General Log Handler
  static void _log(String message, {StackTrace? stackTrace, bool useDebugPrint = true}) {
    if (useDebugPrint) {
      Future.microtask(() => debugPrint(message)); // Asenkron loglama
    } else {
      developer.log(
        message.replaceAll(RegExp(r'\x1B\[[0-9;]*m'), ''), // Remove colors before logging
        name: 'LOG',
        stackTrace: stackTrace,
      );
    }
  }

  // 🛠 Optimized Method: Calculate Character Length (Handles Emojis)
  static int getVisibleLength(String text) {
    return text.characters.length;
  }

  // 📝 Helper Method: Wrap Text at 150 Characters
  static List<String> _wrapText(String text, int maxWidth) {
    List<String> words = text.split(' ');
    List<String> lines = [];
    String currentLine = '';

    for (String word in words) {
      if (getVisibleLength(currentLine + word) <= maxWidth) {
        currentLine += (currentLine.isEmpty ? '' : ' ') + word;
      } else {
        lines.add(currentLine);
        currentLine = word;
      }
    }
    if (currentLine.isNotEmpty) lines.add(currentLine);

    return lines;
  }

  // 📝 JSON Log Format for Structured Logging
  static void jsonLog(String event, String message, {StackTrace? stackTrace}) {
    Map<String, dynamic> logEntry = {
      'timestamp': DateTime.now().toIso8601String(),
      'event': event,
      'message': message,
      'stackTrace': stackTrace?.toString(),
    };
    developer.log(jsonEncode(logEntry), name: 'LOG');
  }
}
