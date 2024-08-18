import 'package:flutter/material.dart';
import 'package:weather/core/constants/app_opacity.dart';
import 'package:weather/core/constants/app_sizes.dart';

class WeatherDetailsItem extends StatelessWidget {
  const WeatherDetailsItem(
      {super.key,
      required this.iconData,
      required this.label,
      required this.info});

  final IconData iconData;
  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withOpacity(AppOpacity.label),
              size: Sizes.p20,
            ),
            gapW4,
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(AppOpacity.label),
                  ),
            )
          ],
        ),
        Text(
          info,
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}
