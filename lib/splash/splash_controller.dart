import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:is_first_run/is_first_run.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();
  GetStorage box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initscreen();
  }

  void initscreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      checkFirstSeen();
    });
  }

  Future<void> checkFirstSeen() async {
    bool firstRun = await IsFirstRun.isFirstRun();
    if (firstRun) {
      Get.offNamed(AppRoutes.selectlang);
      return;
    }
    String? apiToken = box.read('api_token');
    String? usertype = box.read('user_type');
    String? user_verified = box.read('number_verified');

    if (apiToken == null) {
      Get.offNamed(AppRoutes.selectside);
    } else {
      if (usertype == 'vendor') {
        Get.offNamed(AppRoutes.vhome);
      } else {
        if (user_verified == 'true') {
          Get.offNamed(AppRoutes.main);
        } else {
          Get.offNamed(AppRoutes.signin);
        }
      }
    }
  }
}
