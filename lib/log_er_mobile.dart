import 'dart:io';
import 'package:stack_trace/stack_trace.dart';

class Log {
  static void debug(String message) =>
      _log(message, '🔹 DEBUG', '\x1B[36m', '\x1B[36m');

  static void fatal(String message) =>
      _log(message, '💀 FATAL', '\x1B[41m', '\x1B[31m');

  static void error(String message) =>
      _log(message, '❌ ERROR', '\x1B[31m', '\x1B[31m');

  static void json(String jsonMessage) =>
      _log(jsonMessage, '🍺 JSON', '\x1B[32m', '\x1B[32m');

  static void info(String message) =>
      _log(message, '✅ INFO', '\x1B[34m', '\x1B[34m');

  static void warning(String message) =>
      _log(message, '🚨 WARNING', '\x1B[33m', '\x1B[33m');

  static void _log(String message, String logType, String titleColor, String messageColor) {
    int terminalWidth = _getSafeTerminalWidth();
    int messageWidth = _getMaxLineWidth(message);
    int lineWidth = message.contains("\n") || messageWidth > terminalWidth
        ? terminalWidth
        : messageWidth;

    print('');
    print('  $titleColor$logType  ');
    print('─' * lineWidth);
    print('📝 $message');
    print('─' * lineWidth);
    print('');
  }

  static int _getSafeTerminalWidth() {
    try {
      return stdout.hasTerminal ? stdout.terminalColumns : 80;
    } catch (_) {
      return 80;
    }
  }

  static int _getMaxLineWidth(String message) {
    return message.split("\n").map((line) => line.length).reduce((a, b) => a > b ? a : b) + 4;
  }
}
