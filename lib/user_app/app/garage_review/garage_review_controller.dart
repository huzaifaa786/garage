import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/home_apis/garage_review_api.dart';
import 'package:mobilegarage/models/garage_reviews_model.dart';

class GarageReviewController extends GetxController {
  static GarageReviewController instance = Get.find();

  GarageReviewsModel? garage;
  @override
  void onInit() async {
    super.onInit();
    await getReviews();
  }

  getReviews() async {
    var response = await GarageReviewsApi.garageReviews();
    if (response['error'] == false && response['ratings'] != null) {
      garage = GarageReviewsModel.fromJson(response);

      update();
    }
    ;
  }
}
