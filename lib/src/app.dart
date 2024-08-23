import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/src/core/providers/app_startup.dart';
import 'package:weather/src/features/weather/repositories/location_exception.dart';
import 'package:weather/src/features/weather/view/pages/error_page.dart';
import 'package:weather/src/features/weather/view/pages/home_page.dart';
import 'package:weather/src/features/weather/view/pages/loading_page.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      data: (data) {
        return const HomePage();
      },
      error: (error, stackTrace) {
        if (error is LocationException) {
          return const ErrorPage(
            title: 'No location found',
            message: 'Please enable the location permissions',
          );
        } else {
          return const ErrorPage(
            title: 'Oops!',
            message: 'Something went wrong. Please try again later',
          );
        }
      },
      loading: () {
        return const LoadingPage();
      },
    );
  }
}
