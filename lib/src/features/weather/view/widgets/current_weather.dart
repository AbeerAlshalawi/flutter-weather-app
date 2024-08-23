import 'package:flutter/material.dart';
import 'package:weather/src/core/constants/app_opacity.dart';
import 'package:weather/src/core/constants/app_sizes.dart';
import 'package:weather/src/features/weather/models/weather.dart';
import 'package:weather/src/features/weather/view/widgets/weather_details.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather(this.weather, {super.key});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 128,
              width: 128,
              child: Image.asset(
                weather.imagePath,
                fit: BoxFit.contain,
              ),
            ),
            gapW4,
            Text(
              '${weather.temp!.round()}°',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 96,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        gapH12,
        Text(
          weather.description,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(
                  AppOpacity.label,
                ),
          ),
          textAlign: TextAlign.center,
        ),
        gapH32,
        WeatherDetails(weather),
      ],
    );
  }
}
