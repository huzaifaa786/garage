// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

class ServiceItem {
  final String imageUrl;
  final String text;

  ServiceItem({
    required this.imageUrl,
    required this.text,
  });
}

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  var services = <ServiceItem>[
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Car wash',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Oil change',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Battery',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Road Service',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Maintenance',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Battery',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Car wash',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Oil change',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }
}
