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
final Set<Marker> markers = {};
  @override
  void onInit() {
    super.onInit();
    lat = double.parse(Get.parameters['lat'].toString());
    lng = double.parse(Get.parameters['lng'].toString());
     if (lat != null && lng != null) {
      addMarker(LatLng(lat!, lng!), "Initial Position");
    }
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
     if (lat != null && lng != null) {
      addMarker(LatLng(lat!, lng!), "My Location");
    }
    update();
  }
 void addMarker(LatLng position, String markerId) {
    markers.add(
      Marker(
        markerId: MarkerId(markerId),
        position: position,
        infoWindow: InfoWindow(
          title: markerId,
        ),
      ),
    );
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
