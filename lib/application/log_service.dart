import '../domain/log_level.dart';
import '../domain/log_repository.dart';
import '../infrastructure/console_logger.dart';

/// **Log** provides a structured and user-friendly interface
/// for logging messages in different severity levels.
///
/// This service abstracts the actual logging implementation, allowing users
/// to customize and switch logging backends (e.g., console, file, API) easily.
///
/// ### **Understanding the `fileName` Parameter**
/// The `fileName` parameter is **mandatory** and should represent the **file** 
/// where the log is triggered. This allows easy debugging by pinpointing 
/// the exact location of the log event.
///
/// **Best Practices for `fileName`:**
/// - Use `fileName: "home_page.dart"` for logging in the main entry point.
/// - Use `fileName: "auth_service.dart"` for authentication logs.
/// - Use `fileName: "network_service.dart"` for network-related logs.
class Log {
  final LogRepository _logger;

  /// Creates a new instance of **Log**.
  ///
  /// - If no logger is provided, it defaults to `ConsoleLogger`.
  /// - Users can pass a custom logger that implements `LogRepository`,
  ///   such as a file logger or a remote API logger.
  Log({LogRepository? logger}) : _logger = logger ?? ConsoleLogger();

  /// Logs a message with the specified log **level** and **fileName**.
  ///
  /// **Example Usage:**
  /// ```dart
  /// Log().log("User successfully logged in.", fileName: "auth_service.dart", level: LogLevel.info);
  /// ```
  static void log(String message, {required String fileName, LogLevel level = LogLevel.info}) {
    Log()._logger.log(message, fileName, level);
  }

  /// Logs a **debug-level** message.
  ///
  /// Used for **development and debugging purposes**.
  /// These logs should not be enabled in production.
  ///
  /// **Example Usage:**
  /// ```dart
  /// Log.debug("Initializing user session.", fileName: "session_manager.dart");
  /// ```
  /// 
  ///
  /// **Example Usage:**
  /// ```dart
  /// Log.debug("Initializing user session.", fileName: "home_page.dart");
  /// ```
  /// 
  /// **Example Usage:**
  /// ```dart
  /// Log.debug("Initializing user session.", fileName: "profile_page.dart");
  /// ```
  /// 
  static void debug(String message, {required String fileName}) =>
      log(message, fileName: fileName, level: LogLevel.debug);

  /// Logs an **info-level** message.
  ///
  /// Used for **general informational logs** that help track application flow.
  ///
  /// **Example Usage:**
  /// ```dart
  /// Log.info("Application started successfully.", fileName: "home_page.dart");
  /// ```
  static void info(String message, {required String fileName}) =>
      log(message, fileName: fileName, level: LogLevel.info);

  /// Logs a **warning-level** message.
  ///
  /// Used for **potential issues** that are not critical but may cause problems.
  ///
  /// **Example Usage:**
  /// ```dart
  /// Log.warning("Slow network response detected.", fileName: "network_service.dart");
  /// ```
  static void warning(String message, {required String fileName}) =>
      log(message, fileName: fileName, level: LogLevel.warning);

  /// Logs an **error-level** message.
  ///
  /// Used when something **unexpected or problematic** occurs.
  ///
  /// **Example Usage:**
  /// ```dart
  /// Log.error("Failed to connect to database.", fileName: "database_service.dart");
  /// ```
  static void error(String message, {required String fileName}) =>
      log(message, fileName: fileName, level: LogLevel.error);


  /// Logs a **fatal-level** message.
  /// 
  /// Used when an **unrecoverable error** occurs, causing the application to crash.
  /// 
  /// **Example Usage:**
  /// ```dart
  /// Log.fatal("Application crashed due to a critical error.", fileName: "home_page.dart");
  /// ```
  static void fatal(String message, {required String fileName}) =>
      log(message, fileName: fileName, level: LogLevel.fatal);

}