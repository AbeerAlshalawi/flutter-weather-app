import 'package:flutter/material.dart';
import 'package:weather/src/core/constants/app_opacity.dart';
import 'package:weather/src/core/constants/app_sizes.dart';
import 'package:weather/src/features/weather/models/weather.dart';
import 'package:weather/src/features/weather/utils/formatters.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem(this.weather, {super.key});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      child: Column(
        children: [
          Text(
            formatTime(weather.timestamp!),
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(
                        AppOpacity.label,
                      ),
                ),
          ),
          gapH8,
          Image.asset(
            weather.imagePath,
            height: Sizes.p32,
          ),
          gapH8,
          Text(
            '${weather.temp!.toInt()}°',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
