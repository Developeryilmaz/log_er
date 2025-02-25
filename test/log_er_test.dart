import 'package:test/test.dart';
import '../lib/log_er.dart';

void main() {
  group('Log Tests', () {
    test('Debug Log', () {
      Log.debug("🛠️ Debugging session started: Initializing app configurations, loading cached user preferences, and checking connectivity status...", fileName: "app_initializer.dart");
    });

    test('Info Log', () {
      Log.info("🔔 User John Doe has successfully completed the registration process. Email verification sent to john.doe@example.com.", fileName: "user_registration.dart");
    });

    test('Warning Log', () {
      Log.warning("⚠️ Network latency detected! API response time exceeded 3 seconds, indicating possible server overload or slow connection.", fileName: "network_monitor.dart");
    });

    test('Error Log', () {
      Log.error("🚨 Critical error: Database transaction failed due to a primary key constraint violation. Rolling back changes and notifying admin.", fileName: "database_service.dart");
    });

    test('Fatal Log', () {
      Log.fatal("💀 System failure detected! The application encountered a fatal exception leading to an unhandled crash. Immediate debugging required.", fileName: "system_monitor.dart");
    });

    test('Special Log', () {
      Log.special("💡 Feature toggle activated: Dark mode and custom themes now enabled for beta testers in the settings panel.", fileName: "feature_manager.dart");
    });

    test('Data Log', () {
      Log.data({
        "event": "🛍️ User Purchase",
        "user": "👤 john_doe",
        "items": [
          {"name": "💻 Laptop", "price": 1299.99, "quantity": 1},
          {"name": "🖱️ Wireless Mouse", "price": 49.99, "quantity": 1},
          {"name": "⌨️ Keyboard", "price": 149.99, "quantity": 1}
        ],
        "total_price": "💲1499.97",
        "payment_method": "💳 Credit Card",
        "transaction_status": "✅ Success",
        "timestamp": "🕒 2025-02-25T14:45:00Z"
      }, fileName: "purchase_tracker.dart");
    });

    test('JSON Log', () {
      Log.json({
        "status": "🎉 SUCCESS",
        "message": "🔄 Data synchronized successfully!",
        "sync_details": {
          "sync_time": "⏳ 2025-02-25T14:30:00Z",
          "records_synced": "📂 250 Entries",
          "database": "🗄️ Cloud DB",
          "sync_duration": "⚡ 1.25s"
        },
        "user": {
          "id": "#123456",
          "name": "👤 John Doe",
          "role": "🔑 Admin"
        },
        "metadata": {
          "device": "📱 iPhone 14 Pro",
          "os": "🍏 iOS 17.2",
          "app_version": "📦 v2.3.1"
        }
      }, fileName: "sync_manager.dart");
    });
  });
}