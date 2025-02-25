import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

/// 🚀 Advanced, eye-catching, and visually stunning logging tool.
enum LogLevel { debug, info, warning, error, fatal, special, data, json }

class Log {
  Log._();

  static bool enableLogging = true;
  static bool useAnsiColors = _detectAnsiSupport();
  static Map<String, bool> categoryFilter = {};

  /// 📌 ANSI Color Codes (Cross-Platform)
  static const String reset = '\u001B[0m';
  static const String red = '\u001B[31m';
  static const String green = '\u001B[32m';
  static const String yellow = '\u001B[33m';
  static const String blue = '\u001B[34m';
  static const String magenta = '\u001B[35m';
  static const String cyan = '\u001B[36m';
  static const String gray = '\u001B[90m';

  static const Map<LogLevel, String> logColors = {
    LogLevel.debug: green,
    LogLevel.info: blue,
    LogLevel.warning: yellow,
    LogLevel.error: red,
    LogLevel.fatal: red,
    LogLevel.special: magenta,
    LogLevel.data: cyan,
    LogLevel.json: cyan,
  };

  /// Detects if ANSI colors are supported
  static bool _detectAnsiSupport() {
    if (Platform.environment.containsKey('NO_COLOR')) return false;
    if (Platform.isWindows) {
      try {
        return stdout.supportsAnsiEscapes;
      } catch (e) {
        return false;
      }
    }
    return true;
  }

  /// 🎯 General log method
  static void log(
    String message, {
    required String fileName,
    LogLevel level = LogLevel.info,
  }) {
    if (!enableLogging ||
        (categoryFilter.containsKey(level.name) &&
            !categoryFilter[level.name]!)) {
      return;
    }

    /// **Terminal genişliği ve mesaj uzunluğu belirleme**
    int terminalWidth = stdout.hasTerminal ? stdout.terminalColumns : 100;
    int messageLength = message.length;
    
    /// **Sabit uzunluktaki başlık separatorü**
    String fixedHeader = '✨═══════════════════[ 🚀 ${level.name.toUpperCase()} 🚀 ]';

    /// **Başlıktan sonra gelen separator uzunluğu, mesaj uzunluğundan 40 karakter kısa olacak**
    int dynamicSeparatorLength = (messageLength - 40).clamp(10, terminalWidth - fixedHeader.length);
    String dynamicSeparator = '═' * dynamicSeparatorLength;

    /// **Son başlık tam şekli**
    final formattedHeader = '$fixedHeader$dynamicSeparator✨';

    /// **Mesajı düzgün şekilde satırlara ayır**
    final wrappedMessage = _wrapText(message, terminalWidth)
        .map((line) => '💡 | $line')
        .join('\n');

    /// **Dosya isminin üstüne ince çizgi ekleme**
    String thinSeparator = '─' * dynamicSeparatorLength;

    final formattedMessage = _applyColor('''
$formattedHeader
$wrappedMessage
$thinSeparator
💡 | 📂 $fileName
$dynamicSeparator
''', level);

    print(formattedMessage);

    developer.log(
      message.replaceAll(RegExp(r'\x1B\[[0-9;]*m'), ''),
      name: level.name,
    );
  }

  /// **Mesaj uzunluğu sınırsız ve terminal genişliği ile uyumlu**
  static List<String> _wrapText(String text, int width) {
    List<String> lines = [];
    RegExp regExp = RegExp('(.{1,${width - 10}})(?:\\s|\$)');
    for (var match in regExp.allMatches(text)) {
      lines.add(match.group(0)!.trim());
    }
    return lines;
  }

  /// Applies ANSI color if supported
  static String _applyColor(String message, LogLevel level) {
    if (!useAnsiColors) return message;
    final color = logColors[level] ?? reset;
    return '$color$message$reset';
  }

  /// 🚨 Error Log
  static void error(String message, {required String fileName}) =>
      log('🔥 $message', fileName: fileName, level: LogLevel.error);

  /// 🛠️ Debug Log
  static void debug(String message, {required String fileName}) =>
      log('✅ $message', fileName: fileName, level: LogLevel.debug);

  /// ⚠️ Warning Log
  static void warning(String message, {required String fileName}) =>
      log('🚨 $message', fileName: fileName, level: LogLevel.warning);

  /// ℹ️ Info Log
  static void info(String message, {required String fileName}) =>
      log('🔵 $message', fileName: fileName, level: LogLevel.info);

  /// 💜 Special Log
  static void special(String message, {required String fileName}) =>
      log('💜 $message', fileName: fileName, level: LogLevel.special);

  /// 📊 Data Log
  static void data(String message, {required String fileName}) =>
      log('📊 $message', fileName: fileName, level: LogLevel.data);

  /// 💀 Fatal Error Log
  static void fatal(String message, {required String fileName}) =>
      log('💀 [FATAL] 💀 $message', fileName: fileName, level: LogLevel.fatal);

  /// 🌍 Logs a JSON object in a readable format
  static void json(Map<String, dynamic> data, {required String fileName}) {
    String jsonString = const JsonEncoder.withIndent('  ').convert(data);
    log(jsonString, fileName: fileName, level: LogLevel.json);
  }
}