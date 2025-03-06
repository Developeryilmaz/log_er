import 'package:flutter/material.dart';
import 'package:log_er/log_er.dart';
import 'screens/home_screen.dart';
import 'utils/log_setup.dart';

void main() {
  Log.debug("Initializing app...");
  Log.info("User logged in successfully.");
  Log.warning("Low memory detected!");
  Log.error("Failed to fetch API data!");
  Log.fatal("System crashed!");
  Log.json('{ "status": "success", "user": "John Doe" }');

  Log.red("This is a red message.");
  Log.green("This is a green message.");
  Log.yellow("This is a yellow message.");
  Log.blue("This is a blue message.");
  Log.cyan("This is a cyan message.");
  Log.magenta("This is a magenta message.");
  setupLogging(); // Configuring log settings before app starts
  Log.info("Application is launching...");
  runApp(const MyApp());
}

/// **Flutter Application Main Widget**
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Log.debug("Building main widget...");

    return MaterialApp(
      title: 'Log_er Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
