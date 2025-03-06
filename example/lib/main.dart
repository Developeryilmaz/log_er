import 'package:log_er/log_er.dart';

void main() {
  print("🔹 Running log_er example...");

  // **Web ortamında mı çalışıyoruz?**
  bool isWeb = identical(0, 0.0);

  if (isWeb) {
    print("\n🌍 Running on Web - Some features may be limited\n");
  } else {
    print("\n📱 Running on Mobile/Desktop - Full features enabled\n");
  }

  // **Temel log seviyeleri**
  Log.debug("Debugging application...");
  Log.info("User logged in successfully.");
  Log.warning("Low memory detected!");
  Log.error("Failed to fetch API data!");
  Log.fatal("System crashed!");
  Log.json('{ "status": "success", "user": "John Doe" }');

  // **Renkli log fonksiyonları**
  Log.red("This is a red message.");
  Log.green("This is a green message.");
  Log.yellow("This is a yellow message.");
  Log.blue("This is a blue message.");
  Log.cyan("This is a cyan message.");
  Log.magenta("This is a magenta message.");
  
  print("\n✅ Log example completed!");
}
