class Log {
  static void debug(String message) =>
      _log(message, '🔹 DEBUG');

  static void fatal(String message) =>
      _log(message, '💀 FATAL');

  static void error(String message) =>
      _log(message, '❌ ERROR');

  static void json(String jsonMessage) =>
      _log(jsonMessage, '🍺 JSON');

  static void info(String message) =>
      _log(message, '✅ INFO');

  static void warning(String message) =>
      _log(message, '🚨 WARNING');

  static void _log(String message, String logType) {
    print('');
    print('  $logType  ');
    print('────────────────────────────');
    print('📝 $message');
    print('────────────────────────────');
    print('');
  }
}
