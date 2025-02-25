import '../domain/log_level.dart';

class LogFormatter {
  static String format(String message, LogLevel level, String fileName) {
    final String header =
        '✨═══════════════════[ 🚀 ${level.name.toUpperCase()} 🚀 ]';
    final int messageLength = message.length;
    final int separatorLength = (messageLength - 40).clamp(10, messageLength);
    final String separator = '═' * separatorLength;

    return '''
$header$separator✨
💡 | $message
────────────────────────────────────
💡 | 📂 $fileName
${separator * 3}
''';
  }
}
