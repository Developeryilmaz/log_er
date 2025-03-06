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

## 🎯 Features
✅ **Color-coded logs for better readability** 🎨  
✅ **Supports multiple log levels** 🏷️  
✅ **Custom color log functions** 🌈  
✅ **Easy-to-use API** 🚀  
✅ **Emoji-enhanced log messages** 😃  
✅ **Prettified JSON logging** 📝  
✅ **File and API logging support (soon!)** 🔥  

## 📦 Installation
Add the following to your **pubspec.yaml**:
```yaml
dependencies:
  log_er: ^2.0.4
```
Then run:
```sh
flutter pub get
```

## 🚀 Quick Start
### Import the Package
```dart
import 'package:log_er/log_er.dart';
```

### Log Messages
```dart
Log.debug("Initializing app...");
Log.info("User logged in successfully.");
Log.warning("Low memory detected!");
Log.error("Failed to fetch API data!");
Log.fatal("System crashed!");
Log.json('{ "status": "success", "user": "John Doe" }');
```

## 🏷️ Log Levels
| Level       | Emoji | Usage Example |
|------------|------|--------------------|
| **DEBUG**   | 🔹 | `Log.debug("Debugging...");` |
| **INFO**    | ✅ | `Log.info("User logged in.");` |
| **WARNING** | 🚨 | `Log.warning("Slow network detected.");` |
| **ERROR**   | ❌ | `Log.error("Database connection failed!");` |
| **FATAL**   | 💀 | `Log.fatal("Critical failure!");` |
| **JSON**    | 🍺 | `Log.json("{ "status": "ok" }");` |

## 🌈 Custom Color Log Methods
```dart
Log.red("This is a red message.");
Log.green("This is a green message.");
Log.yellow("This is a yellow message.");
Log.blue("This is a blue message.");
Log.cyan("This is a cyan message.");
Log.magenta("This is a magenta message.");
```

---

![log_er Banner](https://raw.githubusercontent.com/Developeryilmaz/log_er/main/assets/banner.png)  

---

## 🛠 Upcoming Features
- **File-based logging**
- **API remote logging**
- **Log filtering & searching**
- **Performance optimizations**

## 📜 License
**log_er** is licensed under the [MIT License](LICENSE).

📌 **Made with ❤️ by [Developeryilmaz](https://github.com/Developeryilmaz).**  
🚀 **Star this repo on GitHub if you found it useful!** 🌟  
