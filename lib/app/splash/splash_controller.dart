import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();

  // TODO: implement onInit
  @override
  void onInit() {
    super.onInit();
    initscreen();
  }

  void initscreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.main);
    });
  }
}
