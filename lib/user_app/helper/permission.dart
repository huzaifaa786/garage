import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


//! LOCATIONS PERMISSIONS
Future<bool> getLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  print('serviceEnabled $serviceEnabled');

  if (!serviceEnabled) {
    await Permission.location;
    permission = await Geolocator.requestPermission();
    // return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return false;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    /////   remove this comment when snackbar made
    // UiUtilites.errorSnackbar('Error'.tr, 'Provide Location Permissions.'.tr);
    await Future.delayed(Duration(seconds: 3), () {
      openAppSettings();
    });
    return false;
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  await Geolocator.getCurrentPosition();
  return true;
}
