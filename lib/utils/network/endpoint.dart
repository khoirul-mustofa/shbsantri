import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoint {
  static String baseUrl = dotenv.get('API_URL');

  // Auth
  static String login = '$baseUrl/auth/login';
  static String register = '$baseUrl/auth/register';

  // User
  static String user = '$baseUrl/auth/user';

  // News
  static String news = '$baseUrl/news';

  // File
  static String uploadImage = '$baseUrl/upload/image';
  static String uploadPdf = '$baseUrl/upload/pdf';
  static String uploadPpt = '$baseUrl/upload/ppt';

  // Category
  static String category = '$baseUrl/category';
}
