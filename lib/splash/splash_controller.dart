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
    Get.offAllNamed(AppRoutes.signup);
  }
}
