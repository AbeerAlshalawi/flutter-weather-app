import 'package:flutter/material.dart';
import 'package:weather/core/constants/app_opacity.dart';
import 'package:weather/core/constants/app_sizes.dart';
import 'package:weather/features/weather/models/forecast.dart';
import 'package:weather/features/weather/view/widgets/forecast_container.dart';
import 'package:weather/features/weather/view/widgets/hourly_forecast_item.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast(this.forecast, {super.key});

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    return ForecastContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Today',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          gapH4,
          Divider(
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withOpacity(AppOpacity.divider),
          ),
          gapH16,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                forecast.weatherList.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                      right: index == forecast.weatherList.length - 1
                          ? 0
                          : Sizes.p20),
                  child: HourlyForecastItem(forecast.weatherList[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
