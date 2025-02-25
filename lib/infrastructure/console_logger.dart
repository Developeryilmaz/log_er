
import '../core/ansi_colors.dart';
import '../core/log_formatter.dart';
import '../domain/log_level.dart';
import '../domain/log_repository.dart';

class ConsoleLogger implements LogRepository {
  @override
  void log(String message, String fileName, LogLevel level) {
    String formattedMessage = LogFormatter.format(message, level, fileName);
    print(AnsiColors.applyColor(formattedMessage, level));
  }
}