import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/src/features/weather/repositories/location_exception.dart';

final locationRepositoryProvider = Provider(
  (ref) => LocationRepository(),
);

class LocationRepository {

  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const LocationServiceDisabledException();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationPermissionDeniedException();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationPermissionDeniedForeverException();
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<String?> getCityName(Position position) async {
    final placeMarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    return placeMarks[0].locality;
  }
}
