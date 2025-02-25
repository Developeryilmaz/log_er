## 🚀 log_er - Powerful & Colorful Logging for Flutter & Dart

![Dart CI](https://github.com/Developeryilmaz/log_er/actions/workflows/flutter.yml/badge.svg)
[![Pub Version](https://img.shields.io/pub/v/log_er)](https://pub.dev/packages/log_er)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/Developeryilmaz/log_er/blob/main/LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/Developeryilmaz/log_er)](https://github.com/Developeryilmaz/log_er/stargazers)
[![GitHub Issues](https://img.shields.io/github/issues/Developeryilmaz/log_er)](https://github.com/Developeryilmaz/log_er/issues)
[![GitHub Forks](https://img.shields.io/github/forks/Developeryilmaz/log_er)](https://github.com/Developeryilmaz/log_er/network)
[![Code Size](https://img.shields.io/github/languages/code-size/Developeryilmaz/log_er)](https://github.com/Developeryilmaz/log_er)

🔹 **log_er** is a structured, colorful, and emoji-enhanced logging package for **Dart & Flutter**.  
🔹 Supports **custom log levels, JSON logging, stack traces, and more!**  

---

## 🎯 **Features**
✅ **Color-coded logs for better readability** 🎨  
✅ **Supports multiple log levels** 🏷️  
✅ **Easy-to-use API** 🚀  
✅ **Emoji-enhanced log messages** 😃  
✅ **Prettified JSON logging** 📝  
✅ **File and API logging support (soon!)** 🔥  

---

## 📦 **Installation**
Add the following to your **`pubspec.yaml`**:
```yaml
dependencies:
  log_er: ^2.0.4
```
Then run:
```sh
flutter pub get
```

---

## 🚀 **Quick Start**
### **1️⃣ Import the Package**
```dart
import 'package:log_er/log_er.dart';
```

### **2️⃣ Log Messages**
```dart
Log.debug("Initializing app...", fileName: "main.dart");
Log.info("User logged in successfully.", fileName: "auth_service.dart");
Log.warning("Low memory detected!", fileName: "performance_monitor.dart");
Log.error("Failed to fetch API data!", fileName: "network_service.dart");
Log.fatal("System crashed!", fileName: "core_system.dart");
```

---

## 🏷️ **Log Levels**
| Level       | Emoji | Usage Example |
|------------|------|--------------------|
| **DEBUG**   | 🍺 | `Log.debug("Debugging...", fileName: "main.dart");` |
| **INFO**    | 🔵 | `Log.info("User logged in.", fileName: "auth.dart");` |
| **WARNING** | 🚨 | `Log.warning("Slow network detected.", fileName: "network.dart");` |
| **ERROR**   | 🔥 | `Log.error("Database connection failed!", fileName: "db.dart");` |
| **FATAL**   | 💀 | `Log.fatal("Critical failure!", fileName: "system.dart");` |
| **SPECIAL** | 💜 | `Log.special("Feature flag enabled.", fileName: "config.dart");` |
| **DATA**    | ✅ | `Log.data({"user": "John"}, fileName: "api.dart");` |

---

![log_er Banner](https://raw.githubusercontent.com/Developeryilmaz/log_er/main/assets/banner.png)  

---

## 📊 **Logging Structured Data**
```dart
Log.json({
  "status": "success",
  "user": {"id": 1, "name": "John Doe"}
}, fileName: "api_service.dart");
```

---

## ⚙️ **Configuration**
Customize logging behavior by passing a **custom logger**:
```dart
Log(logger: FileLogger("logs.txt")).info("App started", fileName: "main.dart");
```

---

## 🛠 **Upcoming Features**
- **File-based logging**
- **API remote logging**
- **Log filtering & searching**
- **Performance optimizations**

---

## 📜 **License**
**log_er** is licensed under the [MIT License](LICENSE).

---

📌 **Made with ❤️ by [Developeryilmaz](https://github.com/Developeryilmaz).**  
🚀 **Star this repo on GitHub if you found it useful!** 🌟
