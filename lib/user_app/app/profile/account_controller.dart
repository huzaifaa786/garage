import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/edit_profile_apis/edit_profile.dart';
import 'package:mobilegarage/models/user_model.dart';

class AccountController extends GetxController {
  static AccountController instance = Get.find();


  void onInit() {
    super.onInit();
    userdata();
  }

  UserModel? user;
  userdata() async {
    var response = await EditProfileApi.getuser();
    if (response.isNotEmpty) {
      user = UserModel.fromJson(response['user']);
      update();
    }
  }
}
