import 'package:log_er/log_er.dart';

void main() {
  Log.info("This is a test log!", fileName: "main.dart");
  Log.error("Something went wrong!", fileName: "error.dart");
}
