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
      Get.offNamed(AppRoutes.chats_accounts);
=======
      Get.offNamed(AppRoutes.account);
>>>>>>> 8d9e1b3ac90eea20fd80933cf4567671afd20825
    });
  }
}

 