class WeatherBitAPI {
  WeatherBitAPI(this.apiKey);

  static const _baseUrl = 'api.weatherbit.io';
  static const _apiPath = '/v2.0';
  final String apiKey;

  static const _hours = 24;
  static const _days = 7;

  Uri currentWeather(double lat, double lon) {
    return _buildUri(
      endpoint: 'current',
      queryParameters: _currentParameters(lat, lon),
    );
  }

  Uri hourlyForecast(double lat, double lon) {
    return _buildUri(
      endpoint: 'forecast/hourly',
      queryParameters: _hourlyForecastParameters(lat, lon),
    );
  }

  Uri dailyForecast(double lat, double lon) {
    return _buildUri(
      endpoint: 'forecast/daily',
      queryParameters: _dailyForecastParameters(lat, lon),
    );
  }

  Uri _buildUri(
      {required String endpoint,
      required Map<String, dynamic> queryParameters}) {
    return Uri(
        scheme: 'https',
        host: _baseUrl,
        path: '$_apiPath/$endpoint',
        queryParameters: queryParameters);
  }

  Map<String, dynamic> _currentParameters(double lat, double lon) => {
        'lat': lat.toString(),
        'lon': lon.toString(),
        'key': apiKey,
      };

  Map<String, dynamic> _hourlyForecastParameters(double lat, double lon) => {
        'lat': lat.toString(),
        'lon': lon.toString(),
        'hours': _hours.toString(),
        'key': apiKey,
      };

  Map<String, dynamic> _dailyForecastParameters(double lat, double lon) => {
        'lat': lat.toString(),
        'lon': lon.toString(),
        'days': _days.toString(),
        'key': apiKey,
      };
}
