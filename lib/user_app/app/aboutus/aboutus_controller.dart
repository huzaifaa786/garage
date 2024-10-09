import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/settings_apis/aboutUs_api.dart';

class AboutusController extends GetxController {
  static AboutusController instance = Get.find();

  String? des;
  String? lat;
  String? lng;
  String? location;
  String? city;

  @override
  void onInit() {
    super.onInit();
    aboutusApi();
  }

  void aboutusApi() async {
    var response = await AboutusApi.getAboutUs();

    des = response['aboutus']['des'];
    lat = response['aboutus']['lat'];
    lng = response['aboutus']['lng'];

    final latDouble = double.parse(lat!);
    final lngDouble = double.parse(lng!);
    final placemark = await placemarkFromCoordinates(latDouble, lngDouble);
    if (placemark.isNotEmpty) {
      final locationData = placemark.first;
      location =
          '${locationData.thoroughfare}${locationData.subLocality}, ${locationData.locality}, ${locationData.country}.';
      city = locationData.locality;
    }
    update();
  }
}
