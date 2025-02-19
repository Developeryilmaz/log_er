import 'package:flutter_test/flutter_test.dart';
import 'package:log_er/log_er.dart';

void main() {
  setUp(() {
    // Her testten önce çalıştırılacak setup kodu buraya gelebilir.
    Log.debug("Test başlıyor...");
  });

  tearDown(() {
    // Her testten sonra çalıştırılacak cleanup kodu
    Log.debug("Test tamamlandı.");
  });

  test('Basic arithmetic test', () {
    expect(1 + 1, equals(2));
    Log.info(" Matematik testi başarılı.");
  });

  test('Warning log test', () {
    Log.warning("Dikkat! Pil seviyesi düşük.");
  });

  test('Error log test', () {
    try {
      throw Exception("Bir hata oluştu!");
    } catch (e, stackTrace) {
      Log.error("Kritik Hata: $e", stackTrace: stackTrace);
    }
  });

  test('Long message test', () {
    String longMessage = "🚀 Bu çok uzun bir log mesajıdır. "
        "Büyük metinlerin nasıl işlendiğini test etmek için kullanılır "
        "ve metnin ekrana düzgün bir şekilde sığmasını sağlar.";

    Log.info(longMessage);
  });

  test('JSON Log Test', () {
    Map<String, dynamic> sampleData = {"id": 123, "name": "Test Kullanıcısı", "email": "test@example.com", "role": "Admin", "createdAt": "2024-02-21"};

    Log.data("📊 JSON Verisi: ${sampleData.toString()}");
  });

  test('Large JSON log test', () {
    List<Map<String, dynamic>> users = List.generate(
      1000,
      (index) => {"id": index + 1, "name": "User $index", "email": "user$index@example.com", "role": "Member"},
    );

    Log.data("📊 Büyük JSON Log Verisi: ${users.length} öğe içeriyor.");
  });
}
