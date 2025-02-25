import 'package:flutter/material.dart';
import 'package:log_er/log_er.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Log.info("Rendering HomeScreen UI...", fileName: "home_screen.dart");

    return Scaffold(
      appBar: AppBar(title: const Text("Log_er Demo")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            Log.info("Login button clicked.", fileName: "home_screen.dart");
            await AuthService().login("john_doe", "password123");
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}