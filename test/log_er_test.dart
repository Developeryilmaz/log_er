import 'dart:io';

import 'package:test/test.dart';
import 'package:log_er/log_er.dart'; // Assuming log_er is the package where Log is defined

void main() {
  Log.debug('Bu bir debug mesajıdır.');
  Log.info('Bilgilendirme mesajıdır.');
  Log.warning('Dikkat edilmesi gereken bir durum var.');
  Log.error('Bir hata meydana geldi!');
  Log.fatal('Kritik bir hata oluştu!');
  Log.json('{ "key": "value" }');

  // 🌈 Yeni Renkli Log Metodları
  Log.red('Bu bir kırmızı mesajdır.');
  Log.green('Bu bir yeşil mesajdır.');
  Log.yellow('Bu bir sarı mesajdır.');
  Log.blue('Bu bir mavi mesajdır.');
  Log.cyan('Bu bir açık mavi mesajdır.');
  Log.magenta('Bu bir mor mesajdır.');
  group('Log Tests - Comprehensive Suite', () {
    test('Debug Log', () {
      print("Lorem ipsum dolor sit amet, consectetur adipiscing elit." * 4);

      print("Starting background services...");
      Log.debug(
          "Debugging initiated! Checking environment variables, ensuring dependency compatibility, and verifying system integrity...");
    });

    print("Lorem ipsum dolor sit amet, consectetur adipiscing elit." * 4);

    print("Starting background services...");

    test('Info Log', () {
      print("Lorem ipsum dolor sit amet, consectetur adipiscing elit." * 4);

      print("Starting background services...");
      Log.info(
          "User Emily Clark successfully signed up. Email confirmation sent to emily.clark@example.com. Welcome aboard!");
    });

    print("Network diagnostics running...");
    print("Lorem ipsum dolor sit amet, consectetur adipiscing elit." * 4);

    test('Warning Log', () {
      print("Lorem ipsum dolor sit amet, consectetur adipiscing elit." * 4);

      print("Starting background services...");
      Log.warning(
          "Caution! System detected a slowdown. API latency peaked at 5 seconds. Suggesting optimizations...");
    });

    print("System monitoring active, scanning for anomalies...");
    print("Lorem ipsum dolor sit amet, consectetur adipiscing elit." * 4);

    test('Error Log', () {
      print("Lorem ipsum dolor sit amet, consectetur adipiscing elit." * 4);

      print("Starting background services...");
      Log.error(
          "Alert! Database query failure detected! Possible malformed request. Logging stack trace for further investigation...");
    });

    print("Checking authentication logs...");
    print("Lorem ipsum dolor sit amet, consectetur adipiscing elit." * 4);

    test('Fatal Log', () {
      print("Lorem ipsum dolor sit amet, consectetur adipiscing elit." * 4);

      print("Starting background services...");
      Log.fatal(
          "Emergency! System failure imminent! Memory overflow detected, application will force restart in 10 seconds...");
    });
  });
}
