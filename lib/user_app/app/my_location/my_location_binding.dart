import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/my_location/my_location_controller.dart';

class MyLocationBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(()=>MyLocationController());
  }}