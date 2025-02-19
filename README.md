# 📜 Log_er - Powerful & Colorful Logging for Flutter 🚀

![Log_er Version](https://img.shields.io/badge/Version-2.0.1-blue) 
![License](https://img.shields.io/badge/License-MIT-green)

## 🌟 Overview
`Log_er` is a **powerful**, **visually appealing**, and **easy-to-use** logging package for Flutter and Dart applications.  
It provides **structured log output**, **emoji-based categories**, and **JSON formatting** with color-coded messages.

### 🎯 **Key Features**
✅ **Color-coded logs** for easy debugging  
✅ **Supports multiple log levels** (`debug`, `info`, `warn`, `error`, `fatal`, `special`, `data`, `json`)  
✅ **Emoji-enhanced logs** for better visibility  
✅ **JSON pretty-printing with auto-formatting**  
✅ **StackTrace support for debugging errors**  
✅ **Text wrapping at 80 characters for readability**  
✅ **Custom log messages with any emoji and color**  
✅ **Log messages enclosed in `*` for clarity**  

---

## 📦 **Installation**
To install `Log_er`, add the package to your `pubspec.yaml` file:
```yaml
dependencies:
  log_er: ^2.0.1


flutter pub get


import 'package:log_er/log_er.dart';

void main() {
  Log.debug("🐞 Debug message: Used for development testing.");
  Log.info("ℹ️ Info message: General system information.");
  Log.warn("⚠️ Warning: Something might need attention.");
  Log.error("🔥 Error: A critical issue occurred!");
  Log.fatal("💀 Fatal error! System crash.");
  Log.special("💜 Special log event.");
  Log.data("📊 Data successfully processed.");
}


**********************************
* 🐞 [DEBUG] Debug message: Used for development testing. *
**********************************

**********************************
* 🔵 [INFO] ℹ️ Info message: General system information. *
**********************************

**********************************
* ⚠️ [WARNING] 🚨 Warning: Something might need attention. *
**********************************

**********************************
* 🔥 [ERROR] 🔥 Error: A critical issue occurred! *
**********************************

**********************************
* 💀 [FATAL] 💀 Fatal error! System crash. *
**********************************

**********************************
* 💜 [SPECIAL] 💜 Special log event. *
**********************************

**********************************
* 📊 [DATA] 📊 Data successfully processed. *
**********************************


void main() {
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
}


**********************************
* 📜 [JSON] 
{
"user":
 {
"name": "Alice",
 "age": 25,
 "contact":
  {
"email": "alice@example.com",
 "phone": "+123456789"
  },
 "bio": "Software Engineer. Loves AI."
 }
} *
**********************************


void main() {
  try {
    throw Exception("Something went wrong!");
  } catch (e, stackTrace) {
    Log.error("🔥 Critical Error: $e", stackTrace: stackTrace);
  }
}


**********************************
* 🔥 [ERROR] Critical Error: Exception: Something went wrong! *
**********************************
#0      main (file://...)
#1      _runMain (dart:...)
...

📌 Why is this useful?

Captures and logs stack traces automatically
Helps track where the error occurred for easier debugging
✅ 4️⃣ Custom Logs with Emojis and Colors
dart
Kopyala
Düzenle
void main() {
  Log.log("✨", "CUSTOM", "This is a custom log!", color: '\x1B[35m');
  Log.log("🚀", "SYSTEM", "System started successfully.", color: '\x1B[32m');
}
🔹 Expected Output
markdown
Kopyala
Düzenle
**********************************
* ✨ [CUSTOM] This is a custom log! *
**********************************

**********************************
* 🚀 [SYSTEM] System started successfully. *
**********************************
📌 Why is this useful?

Define your own log categories
Customize with unique emojis and colors
✅ 5️⃣ Long Message Wrapping for Readability
dart
Kopyala
Düzenle
void main() {
  String longMessage = "🚀 This is a very long log message that contains a lot of text. "
      "It is used to test how the logging system handles large messages "
      "and ensures that the text wraps properly instead of overflowing the screen.";

  Log.info(longMessage);
}
🔹 Expected Output (wrapped at 80 characters)
markdown
Kopyala
Düzenle
**********************************
* 🔵 [INFO] 🚀 This is a very long log message that contains a lot of text. *
It is used to test how the logging system handles large messages
and ensures that the text wraps properly instead of overflowing the screen.
**********************************
📌 Why is this useful?

Ensures long messages do not break formatting
Automatically wraps text to improve readability
🎯 Comparison with Other Logging Packages
Feature	log_er	logger	dart:developer
Emoji-based logs	✅ Yes	❌ No	❌ No
Color-coded logs	✅ Yes	✅ Yes	❌ No
JSON auto-formatting	✅ Yes	❌ No	❌ No
StackTrace support	✅ Yes	✅ Yes	✅ Yes
Custom log categories	✅ Yes	❌ No	❌ No
Bordered log formatting	✅ Yes	❌ No	❌ No
📜 License
Log_er is released under the MIT License. You are free to use, modify, and distribute this package.

🚀 Final Thoughts
✅ Visually appealing logs with emojis & colors
✅ Pretty JSON logging with auto-formatting
✅ Handles errors and stack traces automatically
✅ Supports long text wrapping for better readability
✅ Custom log messages with any emoji and color

🚀 Your logging is now clean, structured, and beautiful! 🎉
If you have any questions or feature requests, feel free to ask! 😊

yaml
Kopyala
Düzenle

---

### **🚀 Why This `README.md` is Effective**
✅ **Includes all key features with explanations**  
✅ **Uses emojis and formatting for better readability**  
✅ **Provides detailed usage examples with expected output**  
✅ **Comparison table shows why `log_er` is better**  
✅ **Makes the package look professional and user-friendly**  

🚀 **Your package now has a polished, professional, and visually engaging `README.md`!** 🎉  
Let me know if you need any further improvements! 😊