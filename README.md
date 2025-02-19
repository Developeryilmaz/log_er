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
  LogEr.info("Application Started");
  LogEr.warning("This is a warning message");
  LogEr.error("Something went wrong!", stackTrace: StackTrace.current);
}
```

## 📌 Log Levels & Usage
```dart
LogEr.error("🔥 Critical Error");
LogEr.debug("🍺 Debugging Mode Enabled");
LogEr.warning("🚨 Warning: Low Battery");
LogEr.info("🔵 App Running Smoothly");
LogEr.special("💜 Special Log Event");
LogEr.data("✅ User Data Loaded Successfully");
```

## 🎯 Why Use log_er?
With its structured logging approach, **log_er** helps developers track issues efficiently and improve debugging workflows. The colorful log output makes it easier to read and analyze logs, especially when working with large-scale applications.

🚀 Start logging smarter with **log_er** today!
```

