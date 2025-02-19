library log_er;

export 'log_er.dart';

import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:characters/characters.dart';

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
  static const String _bold = '\x1B[1m';

  // ✅ General Log Method with Star Border
  static void log(String emoji, String tag, String message, {String color = _reset, StackTrace? stackTrace}) {
    String formattedMessage = _formatBox("$emoji $_bold[$tag]$_reset $message", color);
    debugPrint(formattedMessage);

    developer.log(
      message.replaceAll(RegExp(r'\x1B\[[0-9;]*m'), ''),
      name: tag.toUpperCase(),
      stackTrace: stackTrace,
    );
  }

  // ✅ Specific Log Types with Color and Border
  static void debug(String message, {StackTrace? stackTrace}) =>
      log('✅', 'DEBUG', message, color: _green, stackTrace: stackTrace);

  static void info(String message, {StackTrace? stackTrace}) =>
      log('🔵', 'INFO', message, color: _blue, stackTrace: stackTrace);

  static void warn(String message, {StackTrace? stackTrace}) =>
      log('🚨', 'WARNING', message, color: _yellow, stackTrace: stackTrace);

  static void error(String message, {StackTrace? stackTrace}) =>
      log('🔥', 'ERROR', message, color: _red, stackTrace: stackTrace);

  static void fatal(String message, {StackTrace? stackTrace}) =>
      log('💀', 'FATAL', message, color: _red, stackTrace: stackTrace);

  static void special(String message, {StackTrace? stackTrace}) =>
      log('💜', 'SPECIAL', message, color: _magenta, stackTrace: stackTrace);

  static void data(String message, {StackTrace? stackTrace}) =>
      log('🍺', 'DATA', message, color: _cyan, stackTrace: stackTrace);

  // ✅ JSON Log Formatting with Box
  static void json(String message, {String color = '\x1B[36m'}) {
    String formatted = formatTextWithNewline(message);
    print(_formatBox("🚀 [JSON] $formatted", color));
  }

  // ✅ Formats JSON with indentation
  static String formatJsonString(String jsonString) {
    try {
      var jsonObject = jsonDecode(jsonString);
      return JsonEncoder.withIndent("  ").convert(jsonObject);
    } catch (e) {
      return '🔥 Invalid JSON format: $e';
    }
  }

  // ✅ Formats text by inserting a newline after `, { } [ ]`
  // ✅ Does NOT insert a newline after `.` inside `{ }`
  static String formatTextWithNewline(String text) {
    int curlyBraceDepth = 0;

    return text.replaceAllMapped(
      RegExp(r'([,{}\[\]])|(\.)'),
      (match) {
        String char = match.group(0)!;

        if (char == '{') {
          curlyBraceDepth++;
        } else if (char == '}') {
          curlyBraceDepth = (curlyBraceDepth > 0) ? curlyBraceDepth - 1 : 0;
        }

        if (curlyBraceDepth > 0 && char == '.') {
          return char;
        }

        return '$char\n';
      },
    );
  }

  // ✅ Creates a star-bordered log box
  static String _formatBox(String message, String color) {
    int length = _getVisibleLength(message) + 4;
    String border = '-' * length;
    return '\n$color$border\n* $message *\n$border$_reset';
  }

  // ✅ Optimized string length calculation
  static int _getVisibleLength(String text) {
    return text.characters.length;
  }
}
