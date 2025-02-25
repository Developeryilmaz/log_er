import 'package:log_er/log_er.dart';

void main() {
  Log.info("This is a test log!", fileName: "main.dart");
  Log.debug('Complated Success', fileName: "home_page.dart");
  Log.warning("Something is not right!", fileName: "auth_repository.dart");
  Log.error("Something went wrong!", fileName: "auth_service.dart");
}
