import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/settings_apis/promotions_api.dart';

class PromotionController extends GetxController {
  static PromotionController instance = Get.find();
  List<Map<String, dynamic>> getPromotions = [];

  @override
  void onInit() {
    super.onInit();
    gargesPromotions();
  }

  gargesPromotions() async {
    var response = await PromotionsApi.garagePromotions();
    if (response['promotions'] != null) {
      getPromotions = List<Map<String, dynamic>>.from(response['promotions']);
      update();
    }
  }
}
