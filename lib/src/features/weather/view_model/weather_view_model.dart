import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/src/features/weather/models/weather_data.dart';
import 'package:weather/src/features/weather/repositories/weather_repository.dart';
import 'package:weather/src/features/weather/view_model/location_view_model.dart';

final weatherProvider = FutureProvider(
  (ref) async {
    final location = ref.watch(locationNotifierProvider)!;
    final weatherRepository = ref.watch(weatherRepositoryProvider);

    final currentWeather = await weatherRepository.fetchCurrentWeather(location.lat, location.lon);
    final hourlyForecast = await weatherRepository.fetchHourlyForecast(location.lat, location.lon);
    final dailyForecast = await weatherRepository.fetchDailyForecast(location.lat, location.lon);
    
    return WeatherData(
      location: location,
      currentWeather: currentWeather,
      hourlyForecast: hourlyForecast,
      dailyForecast: dailyForecast,
    );
  },
);
