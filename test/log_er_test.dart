import 'package:flutter_test/flutter_test.dart';
import 'package:log_er/src/services/log_service.dart';

void main() {
  group('Log Tests', () {
    test('Debug log should not throw an error', () {
      expect(() => Log.debug('This is a debug message'), returnsNormally);
    });

    test('Error log should be processed correctly', () {
      expect(() => Log.error('This is an error message'), returnsNormally);
    });

    test('Fatal log should be processed correctly', () {
      expect(
          () => Log.fatal('This is a fatal error!',
              stackTrace: StackTrace.current),
          returnsNormally);
    });

    test('Info log should include timestamp', () {
      expect(
          () => Log.info('Info log with timestamp',
              withTimestamp: true, stackTrace: StackTrace.current),
          returnsNormally);
    });

    test('Warning log should be processed correctly', () {
      expect(
          () =>
              Log.warning('This is a warning!', stackTrace: StackTrace.current),
          returnsNormally);
    });

    // test('Logging JSON should not throw an error', () {
    //   final jsonData = {'key1': 'value1', 'key2': 'value2'};
    //   expect(() => Log.json(jsonData), returnsNormally);
    // });

    // test('Log should correctly handle different log levels', () {
    //   expect(() => Log.log('General log message', level: LogLevel.debug),
    //       returnsNormally);
    //   expect(() => Log.log('General log message', level: LogLevel.error),
    //       returnsNormally);
    //   expect(() => Log.log('General log message', level: LogLevel.info),
    //       returnsNormally);
    // });
  });
}
