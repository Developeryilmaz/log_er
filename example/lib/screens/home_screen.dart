// The home screen containing buttons to test different log levels.
import 'package:example/screens/abc/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:log_er/log_er.dart';
import 'package:logger/logger.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Logs a message and displays a confirmation using a SnackBar.
  //
  // - `context`: The current BuildContext.
  // - `message`: The message to be logged.
  // - `logFunction`: The logging function to be used (e.g., `Log.debug`).
  void _logAndShow(
    BuildContext context,
    String message,
    void Function(String) logFunction,
  ) {
    logFunction(message); // Call the appropriate log function

    // Show a SnackBar as a visual confirmation for the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Log Recorded: $message"),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log_er Example'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Log.info(
                  'Info Log',
                  withTimestamp: true,
                  stackTrace: StackTrace.current,
                );
              },
              child: Text('Detail Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen()),
                );
              },
              child: Text('Detail Screen'),
            ),
            // Button to trigger a **DEBUG** log.
            _buildLogButton(
              context,
              text: "Debug Log",
              color: Colors.green,
              logFunction: (msg) => Log.debug(msg),
            ),

            // // Button to trigger an **INFO** log with a timestamp.
            _buildLogButton(
              context,
              text: "Info Log",
              color: Colors.blue,
              logFunction: (msg) => Log.info(msg, withTimestamp: true),
            ),

            // Button to trigger a **WARNING** log.
            _buildLogButton(
              context,
              text: "Warning Log",
              color: Colors.orange,
              logFunction:
                  (msg) => Log.warning(msg, stackTrace: StackTrace.current),
            ),

            // Button to trigger an **ERROR** log.
            _buildLogButton(
              context,
              text: "Error Log",
              color: Colors.red,
              logFunction:
                  (msg) => Log.error(msg, stackTrace: StackTrace.current),
            ),

            // // Button to trigger a **FATAL** log.
            _buildLogButton(
              context,
              text: "Fatal Log",
              color: Colors.purple,
              logFunction:
                  (msg) => Log.fatal(msg, stackTrace: StackTrace.current),
            ),

            // Button to trigger a **SPECIAL** log (used for custom logs).
            // _buildLogButton(
            //   context,
            //   text: "Special Log",
            //   color: Colors.pink,
            //   logFunction: (msg) => Log.special(msg),
            // ),

            // Button to trigger a **DATA** log (useful for structured data logging).
            // _buildLogButton(
            //   context,
            //   text: "Data Log",
            //   color: Colors.cyan,
            //   logFunction: (msg) => Log.data(msg),
            // ),

            // Button to log a **JSON object** in a structured format.
            // _buildLogButton(
            //   context,
            //   text: "JSON Log",
            //   color: Colors.teal,
            //   logFunction: (msg) {
            //     Log.json(
            //       {
            //       "user": "Jane Doe",
            //       "email": "janedoe@example.com",
            //       "status": "active",
            //       "timestamp": DateTime.now().toString(),
            //     }) ;
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  // Creates a reusable button for logging messages when pressed.
  //
  // - `context`: The current BuildContext.
  // - `text`: The button label.
  // - `color`: The background color of the button.
  // - `logFunction`: The function that logs a message when the button is pressed.
  Widget _buildLogButton(
    BuildContext context, {
    required String text,
    required Color color,
    required void Function(String) logFunction,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12.0),
          ),
          onPressed: () {
            _logAndShow(context, "Button Pressed: $text", logFunction);
          },
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
