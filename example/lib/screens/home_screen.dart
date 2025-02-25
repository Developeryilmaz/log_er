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
            Log.debug('This is a debug message', fileName: 'home_screen.dart');

            // Log an info message
            Log.info('This is an info message', fileName: 'home_screen.dart');

            // Log a warning message
            Log.warning(
              'This is a warning message',
              fileName: 'home_screen.dart',
            );

            // Log an error message
            Log.log(
              'This is an error message',
              level: LogLevel.error,
              fileName: 'home_screen.dart',
            );

            // Log a fatal message
            Log.fatal('This is a fatal message', fileName: 'home_screen.dart');
          },
          child: Text('Log Messages'),
        ),
      ),
    );
  }
}
