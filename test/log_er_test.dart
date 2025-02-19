import 'package:log_er/log_er.dart';

void main() {
  Log.debug("✅ Debug log example: This is useful for development testing.");
  Log.info("🔵 Info log example: General system information.");
  Log.warn("🚨 Warning log example: Something might need attention.");
  Log.error("🔥 Error log example: An error has occurred!");
  Log.special("💜 Special log example: Custom category logs.");
  Log.data("📊 Data log example: This log is used for analytics and reports.");

  Log.log("✨", "CUSTOM", "This is a custom log message!", color: '\x1B[35m');
  Log.log("🚀", "SYSTEM", "System started successfully.", color: '\x1B[32m');
  Log.log("🛑", "SECURITY", "Unauthorized access detected!", color: '\x1B[31m');

  String jsonString = '''
  {
    "user": {
      "name": "Alice",
      "age": 25,
      "contact": {
        "email": "alice@example.com",
        "phone": "+123456789"
      },
      "bio": "Software Engineer. Loves AI."
    }
  }
  ''';

  Log.json(jsonString);

  try {
    throw Exception("Something went wrong!");
  } catch (e, stackTrace) {
    Log.error("🔥 Critical Error: $e", stackTrace: stackTrace);
  }

  String longMessage = "🚀 This is a very long log message that contains a lot of text. "
      "It is used to test how the logging system handles large messages "
      "and ensures that the text wraps properly instead of overflowing the screen.";

  Log.info(longMessage);

  // List<Map<String, dynamic>> sampleData = List.generate(
  //   1000,
  //   (index) => {"id": index + 1, "name": "User $index", "email": "user$index@example.com", "role": "Member", "createdAt": "2024-02-21"},
  // );

  // String jsonString = jsonEncode(sampleData);
  // Log.json(jsonString);
}

// 🚀 Final Thoughts
// ✅ Visually appealing logs with emojis and colors.
// ✅ Formatted JSON logging with indentation.
// ✅ Handles errors and stack traces automatically.
// ✅ Supports long text wrapping for better readability.
// ✅ Efficiently processes large data logs.


// debug, info, warn, error, fatal, special, data, json