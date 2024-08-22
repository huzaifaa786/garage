import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SearchResultController extends GetxController {
  static SearchResultController instance = Get.find();


 var selectedService = 'quickService';

  void onServiceSelected(String service) {
    selectedService = service;
    update();
  }
 Position? currentPosition;
  double? lat;
  double? lng;
  String currentAddress = '';
 

}
