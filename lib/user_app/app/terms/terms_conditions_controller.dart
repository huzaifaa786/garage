import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/settings_apis/terms_and_conditions_api.dart';

class TermsConditionsController extends GetxController {
  static TermsConditionsController instance = Get.find();

  List<Map<String, dynamic>> termsConditions = [];

  @override
  void onInit() {
    super.onInit();
    getConditions();
  }

  void getConditions() async {
    var response = await TermsAndConditionsApi.getTermsConditions();
    if (response['terms'] != null) {
      termsConditions = List<Map<String, dynamic>>.from(response['terms']);
      update();
    }
  }
}
