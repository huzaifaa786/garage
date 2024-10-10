import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/garage_profile/garage_profile_api.dart';
import 'package:mobilegarage/models/garage_model.dart';
import 'package:mobilegarage/user_app/app/home/home_controller.dart';

class GarageController extends GetxController {
  static GarageController instance = Get.find();
  int selectedindex = 0;
  String? garageId = '';
  GarageModel? garage;
  void selectindex(int index) {
    selectedindex = index;
    update();
  }

  @override
  void onInit() async {
    garageId = Get.parameters['id']?.toString();
    await getGarageProfile(garageId);
    super.onInit();
  }

  getGarageProfile(garageId) async {
    var response = await GarageProfileApi.garageProfile(garageId);
    if (response.isNotEmpty) {
      garage = GarageModel.fromJson(response['message']['garage']);
      update();
    }
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
