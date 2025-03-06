// import 'package:stack_trace/stack_trace.dart';
// import 'dart:io' if (dart.library.io) 'dart:io' as io;

import 'dart:io' if (dart.library.html) 'dart:html' as html;
import 'dart:io' if (dart.library.io) 'dart:io' as io;
import 'package:stack_trace/stack_trace.dart' if (dart.library.html) '';

/// **Web tarayıcısında çalışıyor muyuz?**
bool get _isWeb {
  try {
    return identical(0, 0.0);
  } catch (_) {
    return false; // Eğer hata verirse Web'de değiliz
  }
}

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

  static void red(String message) =>
      _log(message, '🔴 RED', '\x1B[31m', '\x1B[31m');
  static void green(String message) =>
      _log(message, '🟢 GREEN', '\x1B[32m', '\x1B[32m');
  static void yellow(String message) =>
      _log(message, '🟡 YELLOW', '\x1B[33m', '\x1B[33m');
  static void blue(String message) =>
      _log(message, '🔵 BLUE', '\x1B[34m', '\x1B[34m');
  static void cyan(String message) =>
      _log(message, '🟦 CYAN', '\x1B[36m', '\x1B[36m');
  static void magenta(String message) =>
      _log(message, '🟣 MAGENTA', '\x1B[35m', '\x1B[35m');

  static void _log(
      String message, String logType, String titleColor, String messageColor) {
    var fileInfo = _getCallingFileInfo();
    String folderPath = fileInfo['folder'] ?? '';
    String fileName = fileInfo['file'] ?? '';
    String resetColor = '\x1B[0m';

    int terminalWidth = _getSafeTerminalWidth();
    int messageWidth = _getMaxLineWidth(message);

    int lineWidth = message.contains("\n") || messageWidth > terminalWidth
        ? terminalWidth
        : messageWidth;

    String line = '═' * lineWidth;
    String line2 = '─' * lineWidth;
    String folderLength = ('─' * (folderPath.length)) + '─' * 4;

    print('');
    print('  $titleColor$logType$resetColor  '.padRight(lineWidth));
    print('║$line');
    print('║');
    print('║ $messageColor📝 $message$resetColor'.padRight(lineWidth));
    print('║');
    print('║$line2');
    print('║ 📄  \x1B[35m$fileName\x1B[0m'.padRight(lineWidth));
    print('║$folderLength');
    if (folderPath.isNotEmpty) {
      print('║ 📂 \x1B[33m $folderPath \x1B[0m'.padRight(lineWidth));
    }
    print(line);
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

  static int _getMaxLineWidth(String message) {
    return message
            .split("\n")
            .map((line) => line.length)
            .reduce((a, b) => a > b ? a : b) +
        4;
  }

  static Map<String, String> _getCallingFileInfo() {
    try {
      var trace = Trace.current(2);
      var frame = trace.frames[0];
      String filePath = frame.uri.toString();

      if (filePath.startsWith('file://')) {
        filePath = filePath.replaceFirst('file://', '');
      }

      // Eğer Web'deysek, sadece dosya adını döndür (Dosya işlemi yapma!)
      if (_isWeb) {
        return {
          'folder': '',
          'file': filePath.split('/').last // Web için sadece dosya adını al
        };
      }

      // Mobil & Konsol için `File` kullanımı güvenli
      try {
        var file = io.File(filePath);
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
        return {'folder': '', 'file': 'Unknown File'};
      }
    } catch (e) {
      return {'folder': '', 'file': 'Unknown File'};
    }
  }
}
