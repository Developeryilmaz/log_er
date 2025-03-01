import 'package:log_er/log_er.dart';

/// **Simulated Network Request**
class NetworkService {
  Future<void> fetchData() async {
    Log.debug("Fetching data from API...", fileName: "network_service.dart");

    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    if (DateTime.now().second % 2 == 0) {
      Log.info(
        "Successfully retrieved data.",
        fileName: "network_service.dart",
      );
    } else {
      Log.error(
        "Failed to fetch data from server!",
        fileName: "network_service.dart",
      );
    }
  }
}
