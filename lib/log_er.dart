import 'dart:io';
import 'package:stack_trace/stack_trace.dart';

class Log {
  /// Debug log (Açık mavi)
  static void debug(String message) =>
      _log(message, '🔹 DEBUG', '\x1B[36m', '\x1B[36m');

  /// Fatal log (Kırmızı arka plan)
  static void fatal(String message) =>
      _log(message, '💀 FATAL', '\x1B[41m', '\x1B[31m');

  /// Error log (Kırmızı)
  static void error(String message) =>
      _log(message, '❌ ERROR', '\x1B[31m', '\x1B[31m');

  /// JSON log (Yeşil)
  static void json(String jsonMessage) =>
      _log(jsonMessage, '🍺 JSON', '\x1B[32m', '\x1B[32m');

  /// Info log (Mavi)
  static void info(String message) =>
      _log(message, '✅ INFO', '\x1B[34m', '\x1B[34m');

  /// Warning log (Sarı)
  static void warning(String message) =>
      _log(message, '🚨 WARNING', '\x1B[33m', '\x1B[33m');

  // 🌈 **Yeni Renk Metodları**
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

  /// Log formatı (renkli mesajlar)
  static void _log(
      String message, String logType, String titleColor, String messageColor) {
    var fileInfo = _getCallingFileInfo();
    String folderPath = fileInfo['folder'] as String;
    String fileName = fileInfo['file'] as String;
    String resetColor = '\x1B[0m'; // Reset ANSI color

    int terminalWidth = _getSafeTerminalWidth();
    int messageWidth = _getMaxLineWidth(message);

    int lineWidth = message.contains("\n") || messageWidth > terminalWidth
        ? terminalWidth
        : messageWidth;

    String line = '═' * lineWidth;
    String line2 = '─' * lineWidth;
    String folderLentgh = ('─' * (folderPath.length)) + '─' * 4;

    print('');
    print('  $titleColor$logType$resetColor  '.padRight(lineWidth));
    print('║$line');
    print('║');
    print('║ $messageColor📝 $message$resetColor'
        .padRight(lineWidth)); // **RENKLİ MESAJ**
    print('║');
    print('║$line2');
    print('║ 📄  \x1B[35m$fileName\x1B[0m'.padRight(lineWidth));
    print('║$folderLentgh');
    if (folderPath.isNotEmpty) {
      print('║ 📂 \x1B[33m $folderPath \x1B[0m'.padRight(lineWidth));
    }
    print(line);
    print('');
  }

  /// **Terminal genişliğini güvenli bir şekilde alır**
  static int _getSafeTerminalWidth() {
    try {
      return stderr.terminalColumns;
    } catch (_) {
      String? userDefinedWidth = Platform.environment['LOG_WIDTH'];
      if (userDefinedWidth != null) {
        int? width = int.tryParse(userDefinedWidth);
        if (width != null && width > 0) {
          return width;
        }
      }
    }
    return 80;
  }

  /// Mesajın en uzun satırının genişliğini alır
  static int _getMaxLineWidth(String message) {
    return message
            .split("\n")
            .map((line) => line.length)
            .reduce((a, b) => a > b ? a : b) +
        4;
  }

  /// Çağrının geldiği dosya adı ve klasör yolunu alır
  static Map<String, String> _getCallingFileInfo() {
    try {
      var trace = Trace.current(2);
      var frame = trace.frames[0];
      String filePath = frame.uri.toString();

      if (filePath.startsWith('file://')) {
        filePath = filePath.replaceFirst('file://', '');
      }

      var file = File(filePath);
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
      return {'folder': '', 'file': 'Bilinmeyen Dosya'};
    }
  }
}
