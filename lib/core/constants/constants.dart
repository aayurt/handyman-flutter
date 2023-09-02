import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String baseUrl = "${dotenv.get('BASE_URL')}/api";
  static String fileUrl = "${dotenv.get('BASE_URL')}/api";
  static String googleMapApiKey = dotenv.get('BASE_URL');
  static String title = "Handyman";
  static String fsmWeb = dotenv.get('fsm_web');
}
