import 'package:flutter/material.dart';
import 'package:weather/core/constants/app_opacity.dart';
import 'package:weather/core/constants/app_sizes.dart';

class ForecastContainer extends StatelessWidget {
  const ForecastContainer(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.p24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(AppOpacity.container),
        borderRadius: BorderRadius.circular(Sizes.p12),
      ),
      child: child,
    );
  }
}
