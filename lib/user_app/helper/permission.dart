// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart' as permissionHandler;

// //! LOCATIONS PERMISSIONS
// Future<bool> getLocationPermission() async {
//   bool serviceEnabled;
//   print('qqqqqqq');

//   LocationPermission permission;
//   print('sssss');
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   print('serviceEnabled $serviceEnabled');
//   print('sddddddddddddd');

//   if (!serviceEnabled) {
//      Get.snackbar(
//       'Error!',
//       'Enable your mobile location service to select your location',
//       snackPosition: SnackPosition.BOTTOM,
//       duration: Duration(seconds: 3),
//       backgroundColor: Get.theme.primaryColor,
//       colorText: Get.theme.colorScheme.onError,
//     );
//     // UiUtilites.errorSnackbar('Error!',
//     //     'Enable Your mobile location service to select your location');
//     // await Permission.location;
//     // permission = await Geolocator.requestPermission();
//     return false;
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return false;
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     /////   remove this comment when snackbar made
//     await Future.delayed(Duration(seconds: 3), () {
//     });
//     return false;
//   }

//   await Geolocator.getCurrentPosition();
//   return true;
// }

import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';


Future<void> getLocationPermission() async {
  final GeolocatorPlatform _geolocator = GeolocatorPlatform.instance;

  Location location = new Location();

  bool _serviceEnabled;

  _serviceEnabled = await location.serviceEnabled();

  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      await _geolocator.openLocationSettings();
    }
  }
  await location.requestPermission();
  final permissions = [
    Permission.locationWhenInUse,
  ];

  for (var permission in permissions) {
    print(await permission.isGranted);
    if (!await permission.isGranted) {
      await permission.request();
    }
  }

  if (!(await _geolocator.isLocationServiceEnabled())) {
    await _geolocator.openLocationSettings();
  }
}
