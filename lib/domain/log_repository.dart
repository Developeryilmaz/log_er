import 'log_level.dart';

abstract class LogRepository {
  void log(String message, String fileName, LogLevel level);
}