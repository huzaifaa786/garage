import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/routes/app_routes.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();
  GetStorage box = GetStorage();
  String? selectedValue;
  final List<String> items = [
    "Dubai",
    "Abu Dhabi",
    "Fujairah",
    "Ras Al Khaimah",
    "Sharjah",
    "Umm Al Quwain",
    "Ajman",
    "Western Region",
  ];
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

  Future checkFirstSeen() async {
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
