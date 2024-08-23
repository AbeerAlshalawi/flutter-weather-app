import 'package:flutter/material.dart';
import 'package:weather/src/core/constants/app_opacity.dart';
import 'package:weather/src/core/constants/app_sizes.dart';
import 'package:weather/src/features/weather/models/forecast.dart';
import 'package:weather/src/features/weather/view/widgets/daily_forecast_item.dart';
import 'package:weather/src/features/weather/view/widgets/forecast_container.dart';

class DailyForecast extends StatelessWidget {
  const DailyForecast(this.forecast, {super.key});

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    return ForecastContainer(
      Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('7-day forecast',
                  style: Theme.of(context).textTheme.titleLarge),
              gapH4,
              Divider(
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withOpacity(AppOpacity.divider),
              )
            ],
          ),
          gapH20,
          Column(
            children: List.generate(
              forecast.weatherList.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                    bottom: index == forecast.weatherList.length - 1
                        ? 0
                        : Sizes.p20),
                child: DailyForecastItem(forecast.weatherList[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
