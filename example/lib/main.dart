import 'package:flutter/material.dart';
import 'package:log_er/log_er.dart';
import 'screens/home_screen.dart';
import 'utils/log_setup.dart';

void main() {
  setupLogging(); // Configuring log settings before app starts
  Log.info("Application is launching...", fileName: "main.dart");

  runApp(const MyApp());
}

/// **Flutter Application Main Widget**
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Log.debug("Building main widget...", fileName: "main.dart");

    return MaterialApp(
      title: 'Log_er Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
