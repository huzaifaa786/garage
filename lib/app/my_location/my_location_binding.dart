import 'package:get/get.dart';
import 'package:mobilegarage/app/my_location/my_location_controller.dart';

class MyLocationBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(()=>MyLocationController());
  }}