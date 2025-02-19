import 'package:log_er/log_er.dart';

void main() {
  Log.debug("✅ Debug log example: This is useful for development testing.");
  Log.info("🔵 Info log example: General system information.");
  Log.warning("🚨 Warning log example: Something might need attention.");
  Log.error("🔥 Error log example: An error has occurred!");
  Log.special("💜 Special log example: Custom category logs.");
  Log.data("📊 Data log example: This log is used for analytics and reports.");

  String jsonString = '''
User (Mobile): UserCredential(additionalUserInfo: AdditionalUserInfo(isNewUser: false, profile: {at_hash: 2XYc6bxqlIFIxoE5oKxtIg, aud:
com..drivinglicense.service, exp: 1740021711, iat: 1739935311, iss: https://appleid.apple.com, sub: 000365.81972a4fb785477ea418d0d0cb0faca7.1857,
email: pharraxsoftware@gmail.com, email_verified: true, auth_time: 1739935309, nonce_supported: true}, providerId: apple.com, username: null,
authorizationCode: null), credential: AuthCredential(providerId: apple.com, signInMethod: apple.com, token: 41655215, accessToken: 
asdfasdfasdf.0.ptwv.0wF5WKjg5HJajhohwNBWkg), user: User(displayName: null, email: pharraxsoftware@gmail.com, isEmailVerified:
 true, isAnonymous: false, metadata: UserMetadata(creationTime: 2025-02-17 20:16:36.249Z, lastSignInTime: 2025-02-19 03:21:51.624Z), phoneNumber: null,
 photoURL: null, providerData, [UserInfo(displayName: null, email: pharraxsoftware@gmail.com, phoneNumber: null, photoURL: null, providerId: apple.com,
 uid: sdafasdf.adfasdf.asdfasdf)], refreshToken: null, tenantId: null, uid: ia2e9og05YbSJK0gArWE0iTndgm2))
''';

  Log.data("JsonString: $jsonString");

  try {
    throw Exception("Something went wrong!");
  } catch (e, stackTrace) {
    Log.error("🔥 Critical Error: $e", stackTrace: stackTrace);
  }

  String longMessage = "🚀 This is a very long log message that contains a lot of text. "
      "It is used to test how the logging system handles large messages "
      "and ensures that the text wraps properly instead of overflowing the screen.";

  Log.info(longMessage);

  // List<Map<String, dynamic>> sampleData = List.generate(
  //   1000,
  //   (index) => {"id": index + 1, "name": "User $index", "email": "user$index@example.com", "role": "Member", "createdAt": "2024-02-21"},
  // );

  // String jsonString = jsonEncode(sampleData);
  // Log.json(jsonString);
}

// 🚀 Final Thoughts
// ✅ Visually appealing logs with emojis and colors.
// ✅ Formatted JSON logging with indentation.
// ✅ Handles errors and stack traces automatically.
// ✅ Supports long text wrapping for better readability.
// ✅ Efficiently processes large data logs.


// debug, info, warn, error, fatal, special, data, json