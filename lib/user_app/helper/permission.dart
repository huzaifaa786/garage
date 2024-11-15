import 'package:geolocator/geolocator.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';
import 'package:permission_handler/permission_handler.dart';

//! LOCATIONS PERMISSIONS
Future<bool> getLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  print('serviceEnabled $serviceEnabled');

  if (!serviceEnabled) {
    UiUtilites.errorSnackbar('Error!', 'Enable Your mobile location service to select your location');
    // await Permission.location;
    // permission = await Geolocator.requestPermission();
    return false;
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
    await Future.delayed(Duration(seconds: 3), () {
      openAppSettings();
    });
    return false;
  }

  await Geolocator.getCurrentPosition();
  return true;
}
