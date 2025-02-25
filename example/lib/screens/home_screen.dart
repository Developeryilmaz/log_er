import 'package:flutter/material.dart';
import 'package:log_er/log_er.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Log a debug message
            Log.debug('This is a debug message');

            // Log an info message
            Log.info('This is an info message');

            // Log a warning message
            Log.warning('This is a warning message');

            // Log an error message
            Log.log('This is an error message', level: LogLevel.error);

            // Log a fatal message
            Log.fatal('This is a fatal message');
          },
          child: Text('Log Messages'),
        ),
      ),
    );
  }
}
