import 'package:weather/features/weather/models/forecast.dart';
import 'package:weather/features/weather/models/location.dart';
import 'package:weather/features/weather/models/weather.dart';

class WeatherData {
  final Location location;
  final Weather currentWeather;
  final Forecast hourlyForecast;
  final Forecast dailyForecast;

  WeatherData({
    required this.location,
    required this.currentWeather,
    required this.hourlyForecast,
    required this.dailyForecast,
  });
}
