import 'package:log_er/log_er.dart';

void main() {
  Log.error("🔥 Critical Error");
  Log.debug("🍺 Debugging Mode Enabled");
  Log.warning("🚨 Warning: Low Battery");
  Log.info("🔵 App Running Smoothly");
  Log.special("💜 Special Log Event");
  Log.data("✅ User Data Loaded Successfully");

  // Example of formatting JSON string 

  String jsonString = '''
  {
    "name": "John Doe",
    "age": 30,
    "email": "johndoe@example.com",
    "bio": "Loves programming. Passionate about AI."
  }
  ''';

  String formattedJson = Log.formatJsonString(jsonString);
  Log.data(formattedJson);
}
