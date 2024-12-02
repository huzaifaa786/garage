import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/settings_apis/privacy_policy_api.dart';

class PrivacyController extends GetxController {
  static PrivacyController instance = Get.find();

  List<Map<String, dynamic>> privacyPolicy = [];

  @override
  void onInit() {
    super.onInit();
    getPolicies();
  }

  getPolicies() async {
    var response = await PrivacyPolicyApi.getPolicies();
    if (response['privacies'] != null) {
      privacyPolicy = List<Map<String, dynamic>>.from(response['privacies']);
      update();
    }
  }
}
