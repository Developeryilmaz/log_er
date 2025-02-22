// lib/log_er/log_er.dart

library log_er;

import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

class Log {
  Log._();

  // ANSI escape codes for colors
  static const String _reset = '\x1B[0m'; // Reset color
  static const String _red = '\x1B[31m'; // Red (Error)
  static const String _green = '\x1B[32m'; // Green (Debug)
  static const String _yellow = '\x1B[33m'; // Yellow (Warning)
  static const String _blue = '\x1B[34m'; // Blue (Info)
  static const String _magenta = '\x1B[35m'; // Purple (Special)
  static const String _cyan = '\x1B[36m'; // Cyan (Data)

  // General log method
  static void log(String message,
      {String color = _reset, StackTrace? stackTrace}) {
    final formattedMessage = '$color[LOG] $message$_reset';

    debugPrint(formattedMessage); // Print colored output

    // Log to developer console without color codes
    developer.log(
      message.replaceAll(RegExp(r'\x1B\[[0-9;]*m'), ''),
      name: 'LOG',
      stackTrace: stackTrace,
    );
  }

  // Color-coded log methods
  static void red(String message, {StackTrace? stackTrace}) =>
      log(message, color: _red, stackTrace: stackTrace);
  static void green(String message, {StackTrace? stackTrace}) =>
      log(message, color: _green, stackTrace: stackTrace);
  static void yellow(String message, {StackTrace? stackTrace}) =>
      log(message, color: _yellow, stackTrace: stackTrace);
  static void blue(String message, {StackTrace? stackTrace}) =>
      log(message, color: _blue, stackTrace: stackTrace);
  static void magenta(String message, {StackTrace? stackTrace}) =>
      log(message, color: _magenta, stackTrace: stackTrace);
  static void cyan(String message, {StackTrace? stackTrace}) =>
      log(message, color: _cyan, stackTrace: stackTrace);

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
  static void _log(String message, {StackTrace? stackTrace}) {
    debugPrint(message); // Print to terminal

    // Log in VS Code Debug Console
    developer.log(
      message.replaceAll(
          RegExp(r'\x1B\[[0-9;]*m'), ''), // Remove colors before logging
      name: 'LOG',
      stackTrace: stackTrace,
    );
  }

  // 🔳 Boxed Log Formatter
  static String _formatBox(String message, String color) {
    const int padding = 2; // Left padding only
    List<String> lines = _wrapText(message); // Wrap text based on special rules

    int maxLength = lines
        .map(getVisibleLength)
        .reduce((a, b) => a > b ? a : b); // Find longest line
    int contentWidth = maxLength + (padding * 2); // Inner width calculation

    // Create top border
    String border = '╔${'═' * (contentWidth)}';

    // Create the middle lines
    String middleLines = lines
        .map((line) =>
            '  $line${' ' * (contentWidth - getVisibleLength(line))} ')
        .join('\n');

    // Create the bottom border
    String bottomBorder = '╚${'═' * (contentWidth)}';

    // Return the final boxed log format
    return '\n$color$border\n$middleLines\n$bottomBorder$_reset';
  }

  // Helper function to wrap text based on conditions
  static List<String> _wrapText(String text) {
    final specialChars = {'.', '{', '}', '[', ']', ','}; // Özel karakterler
    bool insideBraces = false; // {} içinde olup olmadığımızı takip eder
    List<String> lines = [];
    String currentLine = '';

    // URL kontrolü için regex
    final RegExp urlPattern = RegExp(r'http[s]?:\/\/[^\s]+');

    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      currentLine += char;

      // Eğer parantez içinde isek, parçalama kurallarını farklı uygula
      if (char == '{') {
        insideBraces = true;
      } else if (char == '}') {
        insideBraces = false;
        lines.add(currentLine.trim());
        currentLine = '';
        continue;
      }

      // Eğer mevcut satır bir URL içeriyorsa, URL bitene kadar satırı bölme
      if (urlPattern.hasMatch(currentLine)) {
        continue;
      }

      // Eğer nokta (.) kullanılmış ve ondan sonra boşluk (space) YOKSA ve URL değilse, alt satıra in
      if (char == '.' &&
          (i + 1 < text.length && text[i + 1] != ' ') &&
          !urlPattern.hasMatch(currentLine)) {
        lines.add(currentLine.trim());
        currentLine = '';
        continue;
      }

      // Eğer iç içe {} içinde değilsek ve özel karakterlerden biri geldiyse, yeni satır başlat
      if (!insideBraces && specialChars.contains(char)) {
        lines.add(currentLine.trim());
        currentLine = '';
      }
    }

    if (currentLine.isNotEmpty) {
      lines.add(currentLine.trim());
    }

    return lines;
  }

  // Helper function to calculate visible length (ignores color codes)
  static int getVisibleLength(String text) {
    return text.replaceAll(RegExp(r'\x1B\[[0-9;]*m'), '').length;
  }
}
