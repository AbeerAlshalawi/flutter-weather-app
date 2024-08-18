import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/core/constants/api_parameters.dart';
import 'package:weather/features/weather/models/forecast.dart';
import 'package:weather/features/weather/models/weather.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherRepositoryProvider = Provider(
  (ref) => WeatherRepository(),
);

class WeatherRepository {
  Future<Weather> fetchCurrentWeather(double lat, double lon) async {
    final response = await http.get(Uri.parse(
        '${ApiParameters.endpoint}/current?lat=$lat&lon=$lon&key=${ApiParameters.apiKey}'));
    
    final bodyJson = json.decode(response.body);
    return Weather.fromJson(bodyJson['data'][0]);
  }

  Future<Forecast> fetchHourlyForecast(double lat, double lon) async {
    final res = await http.get(Uri.parse(
        '${ApiParameters.endpoint}/forecast/hourly?lat=$lat&lon=$lon&hours=${ApiParameters.hoursInHourlyForecast}&key=${ApiParameters.apiKey}'));

    final bodyJson = json.decode(res.body);
    return Forecast.fromJson(bodyJson);
  }

  Future<Forecast> fetchDailyForecast(double lat, double lon) async {
    final res = await http.get(Uri.parse(
        '${ApiParameters.endpoint}/forecast/daily?lat=$lat&lon=$lon&days=${ApiParameters.daysInDailyForecast}&key=${ApiParameters.apiKey}'));

    final bodyJson = json.decode(res.body);
    return Forecast.fromJson(bodyJson);
  }
}
