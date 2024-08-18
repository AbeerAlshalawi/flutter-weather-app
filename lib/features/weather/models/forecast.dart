import 'package:weather/features/weather/models/weather.dart';

class Forecast {
  final List<Weather> weatherList;

  Forecast(this.weatherList);

  factory Forecast.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    List<Weather> weatherList = [];
    for (final weatherData in data) {
      weatherList.add(Weather.fromJson(weatherData));
    }
    
    return Forecast(weatherList);
  }
}
