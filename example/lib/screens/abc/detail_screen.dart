import 'package:flutter/material.dart';
import 'package:log_er/exports.dart';
import 'package:logger/logger.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Screen'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Logger().f(
                  'This is a fatal error!',
                  stackTrace: StackTrace.current,
                );
                // Log.debug("Test", stackTrace: StackTrace.current);
              },
              child: Text('Test'),
            ),
            ElevatedButton(
              onPressed: () {
                Log.info("Test", stackTrace: StackTrace.current);
              },
              child: Text('Test'),
            ),
            ElevatedButton(
              onPressed: () {
                Log.warning("Test", stackTrace: StackTrace.current);
              },
              child: Text('Test'),
            ),
          ],
        ),
      ),
    );
  }
}
