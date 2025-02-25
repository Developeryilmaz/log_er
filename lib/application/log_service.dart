import '../domain/log_level.dart';
import '../domain/log_repository.dart';
import '../infrastructure/console_logger.dart';

/// 📝 **Log** - Advanced Logging for Dart & Flutter 📢
///
/// This class provides an **easy-to-use API** for structured logging with **emoji-enhanced messages** 🏷️.
///
/// ### 🎯 **Understanding the `fileName` Parameter**
/// - This parameter is **mandatory** and should represent the **file**
///   where the log is triggered for better debugging.
/// - **Best Practices for `fileName`:**
///   - 📌 `fileName: "home_page.dart"` → Logs from the main UI
///   - 🔑 `fileName: "auth_service.dart"` → Authentication logs
///   - 🌐 `fileName: "network_service.dart"` → Network-related logs
class Log {
  final LogRepository _logger;

  /// 🔧 **Creates an instance of Log**
  ///
  /// - If no logger is provided, it defaults to `ConsoleLogger` 🖥️.
  /// - Users can **pass a custom logger** (e.g., FileLogger, API Logger).
  Log({LogRepository? logger}) : _logger = logger ?? ConsoleLogger();

  /// 🍺 **Logs a DEBUG-level message** (Used for debugging)
  ///
  /// **When to use:**
  /// - For **development** and **troubleshooting**.
  /// - Tracks function calls, API responses, and data states.
  ///
  /// **Example Usage:**
  /// ```dart
  /// Log.debug("Initializing user session.", fileName: "session_manager.dart");
  /// Log.debug("Fetching API data...", fileName: "network_service.dart");
  /// Log.debug("Cache cleared successfully.", fileName: "cache_manager.dart");
  /// Log.debug("Rebuilding UI component...", fileName: "ui_component.dart");
  /// Log.debug("Entering debug mode.", fileName: "debug_tools.dart");
  /// ```
  static void debug(String message, {required String fileName}) =>
      log("🍺 $message", fileName: fileName, level: LogLevel.debug);

  /// 🔵 **Logs an INFO-level message** (General application events)
  ///
  /// **When to use:**
  /// - For **informational messages** that track app state.
  /// - Helps understand **normal app flow**.
  ///
  /// **Example Usage:**
  /// ```dart
  /// Log.info("Application started successfully.", fileName: "main.dart");
  /// Log.info("User registration completed.", fileName: "auth_service.dart");
  /// Log.info("Payment processed successfully.", fileName: "payment_service.dart");
  /// Log.info("New message received.", fileName: "chat_service.dart");
  /// Log.info("App theme changed to dark mode.", fileName: "settings_manager.dart");
  /// ```
  static void info(String message, {required String fileName}) =>
      log("🔵 $message", fileName: fileName, level: LogLevel.info);

  /// 🚨 **Logs a WARNING-level message** (Potential problems)
  ///
  /// **When to use:**
  /// - To track **unexpected behaviors** that may affect performance.
  /// - Helps diagnose **minor issues** before they become critical.
  ///
  /// **Example Usage:**
  /// ```dart
  /// Log.warning("Slow network response detected.", fileName: "network_service.dart");
  /// Log.warning("Memory usage is above 80%.", fileName: "performance_monitor.dart");
  /// Log.warning("Deprecated API is being used.", fileName: "api_handler.dart");
  /// Log.warning("User attempted invalid login multiple times.", fileName: "auth_service.dart");
  /// Log.warning("Large dataset loaded into memory.", fileName: "data_processor.dart");
  /// ```
  static void warning(String message, {required String fileName}) =>
      log("🚨 $message", fileName: fileName, level: LogLevel.warning);

  /// 🔥 **Logs an ERROR-level message** (Something went wrong)
  ///
  /// **When to use:**
  /// - For **unexpected errors, failures, or system issues**.
  /// - Helps in **debugging and fixing issues**.
  ///
  /// **Example Usage:**
  /// ```dart
  /// Log.error("Database connection failed!", fileName: "database_service.dart");
  /// Log.error("Unhandled exception occurred.", fileName: "exception_handler.dart");
  /// Log.error("Null value encountered in critical function.", fileName: "core_logic.dart");
  /// Log.error("Failed to retrieve user profile data.", fileName: "user_repository.dart");
  /// Log.error("Critical bug detected during runtime.", fileName: "bug_tracker.dart");
  /// ```
  static void error(String message, {required String fileName}) =>
      log("🔥 $message", fileName: fileName, level: LogLevel.error);

  /// 💜 **Logs a SPECIAL-level message** (For custom logs)
  ///
  /// **When to use:**
  /// - For **custom debug logs** that don’t fit into other levels.
  /// - Used for **testing features or tracking internal behaviors**.
  ///
  /// **Example Usage:**
  /// ```dart
  /// Log.special("Experiment mode enabled.", fileName: "test_config.dart");
  /// Log.special("Custom event triggered.", fileName: "event_tracker.dart");
  /// Log.special("Feature flag turned on.", fileName: "feature_toggle.dart");
  /// Log.special("Admin mode activated.", fileName: "user_permissions.dart");
  /// Log.special("Analytics event logged.", fileName: "analytics_service.dart");
  /// ```
  static void special(String message, {required String fileName}) =>
      log("💜 $message", fileName: fileName, level: LogLevel.special);

  /// ✅ **Logs a DATA-level message** (Logs structured data)
  ///
  /// **When to use:**
  /// - For **logging structured data, JSON responses, or analytics**.
  /// - Helps track **API responses and database entries**.
  ///
  /// **Example Usage:**
  /// ```dart
  /// Log.data({"user": "John Doe", "email": "john@example.com"}, fileName: "api_service.dart");
  /// Log.data(["user1", "user2", "user3"], fileName: "chat_room.dart");
  /// Log.data({"lat": 37.7749, "long": -122.4194}, fileName: "gps_tracker.dart");
  /// Log.data({"status": "success", "items": 20}, fileName: "inventory_manager.dart");
  /// Log.data({"error": "Invalid credentials"}, fileName: "auth_service.dart");
  /// ```
  static void data(dynamic data, {required String fileName}) =>
      log("✅ ${data.toString()}", fileName: fileName, level: LogLevel.data);

  /// 🔍 **Internal Log Handler**
  static void log(String message,
      {required String fileName, LogLevel level = LogLevel.info}) {
    Log()._logger.log(message, fileName, level);
  }
}
