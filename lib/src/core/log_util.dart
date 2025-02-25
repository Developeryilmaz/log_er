import 'dart:core';

class LogUtil {
  /// Retrieves the file path and line number of the true caller.
  static String getCallerFilePath() {
    try {
      final frames = StackTrace.current.toString().split('\n');

      print("🔍 Debugging Stack Frames:");
      for (int i = 0; i < frames.length; i++) {
        print("🛠 Frame #$i: ${frames[i]}");
      }

      int frameIndex = _findFirstValidFrame(frames);

      for (int i = frameIndex; i < frames.length; i++) {
        final frame = frames[i];

        if (!_isFrameworkCall(frame)) {
          print("🔍 Found Caller Frame: $frame");

          // ✅ Supports both `package:` and `file:///` formats
          final match = RegExp(r'package:([\w/_.-]+):(\d+):\d+').firstMatch(frame) ??
                        RegExp(r'file:///(.*?):(\d+):\d+').firstMatch(frame);

          if (match != null) {
            return '${match.group(1)} (Line: ${match.group(2)})';
          }
        }
      }
    } catch (e) {
      return 'Unknown Source (Error: $e)';
    }
    return 'Unknown Source';
  }

  /// Finds the first valid frame by skipping internal logging calls
  static int _findFirstValidFrame(List<String> frames) {
    for (int i = 5; i < frames.length; i++) {
      if (!_isFrameworkCall(frames[i]) &&
          !frames[i].contains('log_util.dart') &&
          !frames[i].contains('log_service.dart')) {
        return i;
      }
    }
    return 5; // Default to 5 if no better frame is found
  }

  static bool _isFrameworkCall(String frame) {
    const ignoredPatterns = [
      'dart:', 'package:flutter/', 'package:flutter_bloc',
      'package:test_api', 'package:flutter_test',
      'log_util.dart', 'log_service.dart',
    ];
    return ignoredPatterns.any(frame.contains);
  }
}