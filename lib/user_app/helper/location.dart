import 'package:geolocator/geolocator.dart';

Future<double> calculateDistance(double startLat, double startLng, double endLat, double endLng) async {
  double distanceInMeters = await Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
  return distanceInMeters / 1000;
}
