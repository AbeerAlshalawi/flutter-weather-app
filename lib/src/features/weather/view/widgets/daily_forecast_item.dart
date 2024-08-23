import 'package:flutter/material.dart';
import 'package:weather/src/core/constants/app_opacity.dart';
import 'package:weather/src/core/constants/app_sizes.dart';
import 'package:weather/src/features/weather/models/weather.dart';
import 'package:weather/src/features/weather/utils/formatters.dart';

class DailyForecastItem extends StatelessWidget {
  const DailyForecastItem(this.weather, {super.key});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          formatDate(weather.datetime!),
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(
                      AppOpacity.label,
                    ),
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              formatDay(weather.datetime!),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              children: [
                Image.asset(
                  weather.imagePath,
                  height: Sizes.p32,
                ),
                gapW8,
                Text(
                  '${weather.maxTemp!.toInt()}°/${weather.minTemp!.toInt()}°',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
