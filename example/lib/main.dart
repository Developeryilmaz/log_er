import 'package:example/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:log_er/log_er.dart';

void main() {
  // Enables logging in the application.
  // When set to `false`, all log messages will be ignored.
  // Log.enableLogging = true;

  // Controls whether log messages should be written to a file.
  // When `true`, logs will be saved in `log_er_output.txt` (or a custom file path).
  // When `false`, logs are only printed to the console.
  // Log.writeToLogFile = true;
  // printColoredLogs();

  Log.info("Test");
  runApp(const MyApp());
}

// The main application widget that initializes and displays the UI.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log_er Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
