import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoint {
  static String baseUrl = dotenv.get('API_URL');

  // Auth
  static String login = '$baseUrl/auth/login';
  static String register = '$baseUrl/auth/register';

  // News
  static String news = '$baseUrl/news';
}
