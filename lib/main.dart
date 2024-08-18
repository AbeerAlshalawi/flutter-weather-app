import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/providers/app_startup.dart';
import 'package:weather/core/theme/app_theme.dart';
import 'package:weather/features/weather/view/pages/error_page.dart';
import 'package:weather/features/weather/view/pages/home_page.dart';
import 'package:weather/features/weather/view/pages/loading_page.dart';

void main() async {
  
  await dotenv.load();

  runApp(
    const ProviderScope(
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: const AppStartupWidget(),
    );
  }
}

class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      data: (data) {
        return const HomePage();
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
