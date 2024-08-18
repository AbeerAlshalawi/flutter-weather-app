import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/features/weather/view_model/location_view_model.dart';

final appStartupProvider = FutureProvider((ref) async {
  await ref.read(locationNotifierProvider.notifier).initLocation();
},);