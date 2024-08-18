import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_sizes.dart';
import 'package:weather/features/weather/view/pages/error_page.dart';
import 'package:weather/features/weather/view/pages/loading_page.dart';
import 'package:weather/features/weather/view/widgets/current_weather.dart';
import 'package:weather/features/weather/view/widgets/daily_forecast.dart';
import 'package:weather/features/weather/view/widgets/hourly_forecast.dart';
import 'package:weather/features/weather/view_model/weather_view_model.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final weatherAsync = ref.watch(weatherProvider);

    return weatherAsync.when(
      data: (weatherData) {
        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: weatherData.currentWeather.isDay
                    ? AppColors.dayGradient
                    : AppColors.nightGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                weatherData.location.cityName,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(Sizes.p16),
              child: Column(
                children: [
                  CurrentWeather(weatherData.currentWeather),
                  gapH48,
                  HourlyForecast(weatherData.hourlyForecast),
                  gapH24,
                  DailyForecast(weatherData.dailyForecast),
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return const ErrorPage();
      },
      loading: () {
        return const LoadingPage();
      },
    );
  }
}
