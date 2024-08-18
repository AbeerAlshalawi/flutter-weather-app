
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiParameters {
  static const String endpoint = 'https://api.weatherbit.io/v2.0';
  static String apiKey = dotenv.env['API_KEY']!;
  static const int daysInDailyForecast = 7;
  static const int hoursInHourlyForecast = 24;
}
