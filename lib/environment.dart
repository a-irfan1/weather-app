import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get apiKey {
    return dotenv.env['API_KEY'] ?? "API key not found";
  }

  static String get baseURL {
    return dotenv.env['Base_URL'] ?? "URL not found";
  }
}
