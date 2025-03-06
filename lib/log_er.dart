

// `dart:io` sadece Mobil & Konsol için kullanılacak
import 'dart:io' if (dart.library.io) 'dart:io' as io;

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
    String resetColor = '\x1B[0m';
    int terminalWidth = _getSafeTerminalWidth();
    int messageWidth = _getMaxLineWidth(message);

    int lineWidth = message.contains("\n") || messageWidth > terminalWidth
        ? terminalWidth
        : messageWidth;

    String line = '═' * lineWidth;

    print('');
    print('  $titleColor$logType$resetColor  '.padRight(lineWidth));
    print('║$line');
    print('║');
    print('║ $messageColor📝 $message$resetColor'.padRight(lineWidth));
    print('║');
    print('║$line');
    print('');
  }

  /// **Web ve Mobil için Terminal Genişliğini Güvenli Şekilde Al**
  static int _getSafeTerminalWidth() {
    if (_isWeb) {
      return 80; // Web için varsayılan genişlik
    }
    try {
      return io.stdout.hasTerminal ? io.stdout.terminalColumns : 80;
    } catch (_) {
      return 80;
    }
  }

  /// **Web ortamında mı çalışıyoruz?**
  static bool get _isWeb {
    try {
      return identical(0, 0.0);
    } catch (_) {
      return false;
    }
  }

  static int _getMaxLineWidth(String message) {
    return message
        .split("\n")
        .map((line) => line.length)
        .reduce((a, b) => a > b ? a : b) +
        4;
  }
}
