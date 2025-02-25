import 'package:example/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:log_er/log_er.dart';

void main() {
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
