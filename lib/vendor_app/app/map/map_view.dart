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
        appBarTitle: 'Map',
        hasBgColor: true,
        hasShadow: false,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(25.2048, 55.2708),
            zoom: 14,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers:  Set<Marker>(),
        
        ),
      ),
    );
  }
}
