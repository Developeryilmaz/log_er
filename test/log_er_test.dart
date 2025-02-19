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

  String jsonString = '''
User (Mobile): UserCredential(additionalUserInfo: AdditionalUserInfo(isNewUser: false, profile: {at_hash: 2XYc6bxqlIFIxoE5oKxtIg, aud:
com..drivinglicense.service, exp: 1740021711, iat: 1739935311, iss: https://appleid.apple.com, sub: 000365.81972a4fb785477ea418d0d0cb0faca7.1857,
email: pharraxsoftware@gmail.com, email_verified: true, auth_time: 1739935309, nonce_supported: true}, providerId: apple.com, username: null,
authorizationCode: null), credential: AuthCredential(providerId: apple.com, signInMethod: apple.com, token: 41655215, accessToken:
ace2fdff4ef7c464e9388d187c33bdfcd.0.ptwv.0wF5WKjg5HJajhohwNBWkg), user: User(displayName: null, email: pharraxsoftware@gmail.com, isEmailVerified:
true, isAnonymous: false, metadata: UserMetadata(creationTime: 2025-02-17 20:16:36.249Z, lastSignInTime: 2025-02-19 03:21:51.624Z), phoneNumber: null,
photoURL: null, providerData, [UserInfo(displayName: null, email: pharraxsoftware@gmail.com, phoneNumber: null, photoURL: null, providerId: apple.com,
uid: 000365.81972a4fb785477ea418d0d0cb0faca7.1857)], refreshToken: null, tenantId: null, uid: ia2e9og05YbSJK0gArWE0iTndgm2))
''';

  test('Large JSON log test', () {
    Log.data("Büyük JSON Log Verisi: $jsonString öğe içeriyor.");
  });
}
