import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/settings_apis/faq_api.dart';

class FaqController extends GetxController {
  static FaqController instance = Get.find();

  List<Map<String, dynamic>> frequentlyAskedQuestions = [];

  @override
  void onInit() {
    super.onInit();
    faqApi();
  }

  void faqApi() async {
    var response = await FaqApi.getFaq();
    if (response['faqs'] != null) {
      frequentlyAskedQuestions =
          List<Map<String, dynamic>>.from(response['faqs']);
      update();
    }
  }
}
