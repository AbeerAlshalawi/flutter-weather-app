import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKey {
  static final weatherBitAPIKey = dotenv.env['API_KEY']!;
}