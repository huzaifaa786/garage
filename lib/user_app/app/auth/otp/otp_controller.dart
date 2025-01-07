import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/user_apis/auth_apis/resend_otp_api.dart';
import 'package:mobilegarage/apis/user_apis/auth_apis/verify_otp_test_api.dart';
import 'package:mobilegarage/apis/user_apis/edit_profile_apis/edit_profile.dart';
import 'package:mobilegarage/models/user_model.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/helper/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class OtpController extends GetxController {
  static OtpController instanse = Get.find();
  TextEditingController otpController = TextEditingController();
  @override
  void onInit() async {
    super.onInit();
    phone = Get.parameters['phone'];
    authmethod = Get.parameters['auth'];
    // otp = Get.parameters['otp'];
    // otpController.text = otp.toString();
    update();
    //  await veryifyTestCode();

    // await verifyPhone();
  }

  veryifyTestCode() async {
    var response = await VerifyOtpTestApi.verifyNumber(
        phone: phone, otp: otpController.text);
    if (response.isNotEmpty) {
      box.write('api_token', response['user']['token']);
      box.write('number_verified', 'true');
      box.write('user_type', 'user');
      box.write('user_id', response['user']['id']);

      Get.offAllNamed(AppRoutes.main);
    }
  }

  resendOtp() async {
    var response = await ResendOtpApi.sendOtp(
      phone: phone,
    );
    if (response.isNotEmpty) {
      update();
    }
  }

  String? phone = '';
  String? authmethod = '';
  String? otp = '';

  String otpCode = '';
  GetStorage box = GetStorage();
//----------------otp sign-up/ sign-in--------
  RxString? last2;
  String? completePhone;
  int? resendtoken;
  String verificationid = "";

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  verifyPhone() async {
    LoadingHelper.show();
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 10),
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        LoadingHelper.dismiss();
        Get.snackbar(
          'Verification failed'.tr,
          e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: AppColors.white,
        );
      },
      forceResendingToken: resendtoken,
      codeSent: (String verificationId, int? resendToken) {
        last2 = phone.toString().substring(phone.toString().length - 3).obs;
        verificationid = verificationId;
        resendtoken = resendToken;

        LoadingHelper.dismiss();
        update();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationid = verificationId;
        // Get.snackbar(
        //   'TIMEOUT'.tr,
        //   '',
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.red,
        //   colorText: AppColors.white,
        // );
      },
    );
  }

  UserModel? user;

  void verifyOtpCode() async {
    var response = await EditProfileApi.editProfile(phone: phone);
    if (response.isNotEmpty) {
      // user = UserModel.fromJson(response['user']);
      // box.write('api_token', response['user']['token']);
      // box.write('number_verified', 'true');
      // box.write('user_type', 'user');
      // box.write('user_type', 'user');
      // box.write('user_id', response['user']['id']);

      Get.offAllNamed(AppRoutes.main);
      UiUtilites.successSnackbar(
          'Phone Number changed successfully'.tr, 'Success!'.tr);
    }
  }
}
