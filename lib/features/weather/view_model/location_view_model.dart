import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/features/weather/models/location.dart';
import 'package:weather/features/weather/repositories/location_repository.dart';

final locationNotifierProvider = NotifierProvider<LocationNotifier, Location?>(
  () {
    return LocationNotifier();
  },
);

class LocationNotifier extends Notifier<Location?> {
  late LocationRepository _locationRepository;

  @override
  Location? build() {
    _locationRepository = ref.watch(locationRepositoryProvider);
    return null;
  }

  Future<void> initLocation() async {
    final position = await _locationRepository.getPosition();
    final cityName = await _locationRepository.getCityName(position);
    state = Location(cityName: cityName!, lat: position.latitude, lon: position.longitude);
  }
}
