import 'dart:convert';

import '../domain/log_level.dart';
import '../core/ansi_colors.dart';
import '../core/log_formatter.dart';

/// 🔥 **Log** - A powerful logging utility for Flutter & Dart.
///
/// **Features:**
/// - 🎨 Color-coded logs
/// - 🏷️ Structured log levels
/// - 🛠️ Debugging-friendly format
/// - 🔍 Includes `fileName` for better traceability
///
/// Example usage:
/// ```dart
/// Log.info("Application started!", fileName: "main.dart");
/// ```
class Log {
  /// 📌 **Logs a DEBUG-level message.**
  ///
  /// Use for **development logs, debugging, and tracing** internal operations.
  ///
  /// **Real-World Examples:**
  /// ```dart
  /// Log.debug("Fetching user profile...", fileName: "user_service.dart");
  /// Log.debug("Cache cleared successfully.", fileName: "cache_manager.dart");
  /// Log.debug("Rebuilding UI component...", fileName: "ui_component.dart");
  /// Log.debug("Socket connection initialized.", fileName: "network_socket.dart");
  /// Log.debug("Entering debug mode.", fileName: "debug_tools.dart");
  /// ```
  static void debug(String message, {required String fileName}) =>
      _log(message, fileName: fileName, level: LogLevel.debug);

  /// 📌 **Logs an INFO-level message.**
  ///
  /// Use for **general informational messages** about application flow.
  ///
  /// **Real-World Examples:**
  /// ```dart
  /// Log.info("User successfully logged in.", fileName: "auth_service.dart");
  /// Log.info("Payment processed.", fileName: "payment_gateway.dart");
  /// Log.info("Email verification completed.", fileName: "email_service.dart");
  /// Log.info("New product added to inventory.", fileName: "inventory_manager.dart");
  /// Log.info("Dark mode activated.", fileName: "settings_controller.dart");
  /// ```
  static void info(String message, {required String fileName}) =>
      _log(message, fileName: fileName, level: LogLevel.info);

  /// ⚠️ **Logs a WARNING-level message.**
  ///
  /// Use for **non-critical issues** that may require attention.
  ///
  /// **Real-World Examples:**
  /// ```dart
  /// Log.warning("Slow network response detected.", fileName: "network_monitor.dart");
  /// Log.warning("Low memory warning.", fileName: "performance_manager.dart");
  /// Log.warning("User attempted invalid login.", fileName: "auth_service.dart");
  /// Log.warning("Deprecated API in use.", fileName: "legacy_system.dart");
  /// Log.warning("High CPU usage detected.", fileName: "performance_tracker.dart");
  /// ```
  static void warning(String message, {required String fileName}) =>
      _log(message, fileName: fileName, level: LogLevel.warning);

  /// ❌ **Logs an ERROR-level message.**
  ///
  /// Use for **unexpected failures, exceptions, or crashes**.
  ///
  /// **Real-World Examples:**
  /// ```dart
  /// Log.error("Database connection failed!", fileName: "database_service.dart");
  /// Log.error("Null pointer exception occurred.", fileName: "core_logic.dart");
  /// Log.error("Unauthorized access attempt!", fileName: "security_manager.dart");
  /// Log.error("API request failed with 500 status.", fileName: "api_service.dart");
  /// Log.error("File read operation failed.", fileName: "file_manager.dart");
  /// ```
  static void error(String message, {required String fileName}) =>
      _log(message, fileName: fileName, level: LogLevel.error);

  /// 📊 **Logs a DATA-level message.**
  ///
  /// Use for **logging structured data, JSON responses, or analytics**.
  ///
  /// **Real-World Examples:**
  /// ```dart
  /// Log.data({"id": 1, "name": "John Doe"}, fileName: "user_service.dart");
  /// Log.data({"status": "success", "items": 20}, fileName: "inventory_manager.dart");
  /// Log.data(["user1", "user2", "user3"], fileName: "chat_room.dart");
  /// Log.data({"lat": 37.7749, "long": -122.4194}, fileName: "gps_tracker.dart");
  /// Log.data({"error": "Invalid credentials"}, fileName: "auth_service.dart");
  /// ```
  static void data(dynamic data, {required String fileName}) =>
      _log(data.toString(), fileName: fileName, level: LogLevel.data);

  /// 💀 **Logs a FATAL-level message.**
  ///
  /// Use for **critical system failures** that require immediate attention.
  ///
  /// **Real-World Examples:**
  /// ```dart
  /// Log.fatal("System memory exhausted!", fileName: "memory_manager.dart");
  /// Log.fatal("Unexpected shutdown detected.", fileName: "system_monitor.dart");
  /// Log.fatal("Security breach detected!", fileName: "security_service.dart");
  /// Log.fatal("Core application service crashed.", fileName: "app_core.dart");
  /// Log.fatal("Fatal exception in runtime!", fileName: "runtime_engine.dart");
  /// ```
  static void fatal(String message, {required String fileName}) =>
      _log(message, fileName: fileName, level: LogLevel.fatal);

  /// 🌍 **Logs a JSON-formatted object.**
  ///
  /// Use for **structured logging with readable JSON output**.
  ///
  /// **Real-World Examples:**
  /// ```dart
  /// Log.json({"user": "Alice", "age": 30}, fileName: "user_profile.dart");
  /// Log.json({"error": "Invalid token", "code": 401}, fileName: "auth_handler.dart");
  /// Log.json({"temperature": 22.5, "unit": "C"}, fileName: "weather_service.dart");
  /// Log.json({"request": "/api/v1/orders", "method": "GET"}, fileName: "api_logger.dart");
  /// Log.json({"mode": "dark", "version": "1.0.2"}, fileName: "settings_controller.dart");
  /// ```
  static void json(Map<String, dynamic> data, {required String fileName}) {
    String jsonString = const JsonEncoder.withIndent('  ').convert(data);
    _log(jsonString, fileName: fileName, level: LogLevel.json);
  }

  /// 🔧 **Internal log method for handling all log types.**
  static void _log(String message,
      {required String fileName, LogLevel level = LogLevel.info}) {
    String formattedMessage = LogFormatter.format(message, level, fileName);
    print(AnsiColors.applyColor(formattedMessage, level));
  }
}
