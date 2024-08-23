import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather/src/core/api/api.dart';
import 'package:weather/src/core/api/api_key.dart';
import 'package:weather/src/features/weather/models/forecast.dart';
import 'package:weather/src/features/weather/models/weather.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/src/features/weather/repositories/api_exception.dart';

final weatherRepositoryProvider = Provider(
  (ref) => WeatherRepository(),
);

class WeatherRepository {
  final WeatherBitAPI api = WeatherBitAPI(ApiKey.weatherBitAPIKey);

  Future<Weather> fetchCurrentWeather(double lat, double lon) {
    return _fetchData(
      uri: api.currentWeather(lat, lon),
      builder: (data) => Weather.fromJson(data['data'][0]),
    );
  }

  Future<Forecast> fetchHourlyForecast(double lat, double lon) async {
    return _fetchData(
      uri: api.hourlyForecast(lat, lon),
      builder: (data) => Forecast.fromJson(data),
    );
  }

  Future<Forecast> fetchDailyForecast(double lat, double lon) {
    return _fetchData(
      uri: api.dailyForecast(lat, lon),
      builder: (data) => Forecast.fromJson(data),
    );
  }

  Future<T> _fetchData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await http.get(uri);

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        case 403:
          throw InvalidApiKeyException();
        default:
          throw UnknownAPIException();
      }
    } on SocketException {
      throw NoInternetConnectionException();
    }
  }
}
