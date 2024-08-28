import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/home/home_controller.dart';


class GarageController extends GetxController {
  static GarageController instanse = Get.find();
  int selectedindex = 0;
  void selectindex(int index) {
    selectedindex = index;
    update();
    print('object');
  }

  

  var services = <ServiceItem>[
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Car wash',
        subText: 'View more'),
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Oil change',
        subText: 'View more'),
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Battery',
        subText: 'View more'),
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Road Service',
        subText: 'View more'),
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Maintenance',
        subText: 'View more'),
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Car Warranty',
        subText: 'View more'),
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Tyer Replacement',
        subText: 'View more'),
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Oil change',
        subText: 'View more'),
  ];
}
