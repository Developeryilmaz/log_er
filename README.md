```md
# 📜 log_er - Powerful & Colorful Logging for Flutter

**log_er** is a structured and feature-rich logging package for Flutter applications. It provides colorful and readable log output, making debugging and application monitoring easier than ever! 🚀

## ✨ Features
✅ **Multiple Log Levels** – ERROR, DEBUG, WARNING, INFO, SPECIAL, DATA  
✅ **Color-Coded Console Logs** – Easily differentiate log messages  
✅ **Boxed Logs for Readability** – Auto-wrapped text with structured format  
✅ **Stack Trace Support** – Helps track errors efficiently  
✅ **Performance Optimized** – Minimal overhead, works seamlessly with debug mode  

## 📦 Installation
Add the package to your `pubspec.yaml`:
```yaml
dependencies:
  log_er: latest_version
```

Then, import and use it in your Flutter project:
```dart
import 'package:log_er/log_er.dart';

void main() {
  Log.info("Application Started");
  Log.warning("This is a warning message");
  Log.error("Something went wrong!", stackTrace: StackTrace.current);
}
```

## 📌 Log Levels & Usage
```dart
Log.error("🔥 Critical Error");
Log.debug("🍺 Debugging Mode Enabled");
Log.warning("🚨 Warning: Low Battery");
Log.info("🔵 App Running Smoothly");
Log.special("💜 Special Log Event");
Log.data("✅ User Data Loaded Successfully");
```

## 🎯 Why Use log_er?
With its structured logging approach, **log_er** helps developers track issues efficiently and improve debugging workflows. The colorful log output makes it easier to read and analyze logs, especially when working with large-scale applications.

🚀 Start logging smarter with **log_er** today!
```

