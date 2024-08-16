// ignore_for_file: avoid_print

import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:developer';

class VMapController extends GetxController {
  final Completer<GoogleMapController> mController =
      Completer<GoogleMapController>();

  double? lat;
  double? lng;
  Position? currentPosition;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      getCurrentLocation();
    } else if (status.isDenied) {
      // Handle the case when the user denied the permission
      log('Location permission denied');
    } else if (status.isPermanentlyDenied) {
      // Handle the case when the user permanently denied the permission
      await openAppSettings();
    }
  }

  Future<void> getCurrentLocation() async {
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = currentPosition?.latitude;
    lng = currentPosition?.longitude;
    update();
  }

  void updateCameraPosition(LatLng newPosition) async {
    final GoogleMapController controller = await mController.future;
    CameraPosition newCameraPosition = CameraPosition(
      target: newPosition,
      zoom: 12,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
    update();
  }
}
