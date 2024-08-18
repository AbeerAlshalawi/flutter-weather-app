import 'package:flutter/material.dart';
import 'package:weather/core/constants/app_opacity.dart';
import 'package:weather/core/constants/app_sizes.dart';
import 'package:weather/features/weather/models/weather.dart';
import 'package:weather/features/weather/utils/converters.dart';
import 'package:weather/features/weather/view/widgets/weather_details_item.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails(this.weather, {super.key});

  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        WeatherDetailsItem(
          iconData: Icons.thermostat,
          label: 'Feels like',
          info: '${weather.feelsLike!.toInt()}°',
        ),
        SizedBox(
          height: Sizes.p32,
          child: VerticalDivider(
            color: Theme.of(context)
                .colorScheme
                .onPrimary
                .withOpacity(AppOpacity.divider),
          ),
        ),
        WeatherDetailsItem(
          iconData: Icons.water_drop_outlined,
          label: 'Humidity',
          info: '${weather.humidity}%',
        ),
        SizedBox(
          height: Sizes.p32,
          child: VerticalDivider(
            color: Theme.of(context)
                .colorScheme
                .onPrimary
                .withOpacity(AppOpacity.divider),
          ),
        ),
        WeatherDetailsItem(
          iconData: Icons.air,
          label: 'Wind',
          info: '${msTokmh(weather.windSpeed).toInt()} km/h',
        ),
      ],
    );
  }
}
