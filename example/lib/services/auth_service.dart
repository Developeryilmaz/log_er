import 'package:log_er/log_er.dart';

/// **Simulated Authentication Service**
class AuthService {
  Future<void> login(String username, String password) async {
    Log.debug("Attempting login for user: $username");

    await Future.delayed(const Duration(seconds: 2)); // Simulate API delay

    if (username == "john_doe" && password == "password123") {
      Log.info("User $username successfully logged in!");
    } else {
      Log.warning("Failed login attempt for user: $username");
    }
  }
}
