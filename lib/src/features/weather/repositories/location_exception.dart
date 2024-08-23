sealed class LocationException implements Exception {
  LocationException(this.message);
  final String message;
}

class LocationServicesDisabledException extends LocationException {
  LocationServicesDisabledException() : super('Location services are disabled');
}

class LocationPermissionDeniedException extends LocationException {
  LocationPermissionDeniedException() : super('Location permissions are denied');
}

class LocationPermissionDeniedForeverException extends LocationException {
  LocationPermissionDeniedForeverException() : super('Location permissions are permanently denied');
}

class UnknownLocationException extends LocationException {
  UnknownLocationException() : super('Some error occured');
}