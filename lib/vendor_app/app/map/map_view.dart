import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';
import 'map_controller.dart';

class VMapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VMapController>(
      autoRemove: false,
      builder: (controller) => AppLayout(
        appBarTitle: 'Map'.tr,
        hasBgColor: true,
        hasShadow: false,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            // target: LatLng(double.parse(controller.lat.toString()),
            //     double.parse(controller.lng.toString())),
            target: LatLng(
              controller.lat ?? 0.0,
              controller.lng ?? 0.0,
            ),
            zoom: 14,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          // markers: Set<Marker>(),
           markers: controller.markers, 
            onMapCreated: (GoogleMapController googleMapController) {
            controller.mController.complete(googleMapController);
          },
        ),
      ),
    );
  }
}
