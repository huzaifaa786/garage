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
<<<<<<< HEAD
      Get.offNamed(AppRoutes.main);
=======
      Get.offNamed(AppRoutes.orders);
>>>>>>> 1b510383602157658b29ea452e4bdaace46f4916
    });
  }
}
