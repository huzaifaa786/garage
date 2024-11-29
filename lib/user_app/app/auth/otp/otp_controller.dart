import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/user_apis/auth_apis/signin_apis/login_verify_api.dart';
import 'package:mobilegarage/apis/user_apis/auth_apis/signup_apis/phone_verify_api.dart';
import 'package:mobilegarage/apis/user_apis/auth_apis/verify_otp_test_api.dart';
import 'package:mobilegarage/apis/user_apis/edit_profile_apis/edit_profile.dart';
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
    otp = Get.parameters['otp'];
    otpController.text = otp.toString();
    update();
  //  await veryifyTestCode();
    print(phone);
    print(otp);

    // await verifyPhone();
  }

  veryifyTestCode() async {
    var response = await VerifyOtpTestApi.verifyNumber(phone: phone, otp: otp);
    if (response.isNotEmpty) {
        box.write('api_token', response['user']['token']);
        box.write('number_verified', 'true');
        box.write('user_type', 'user');
        box.write('user_id', response['user']['id']);

        Get.offAllNamed(AppRoutes.main);
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

  void verifyOtpCode() async {
    LoadingHelper.show();
    try {
      // PhoneAuthCredential credential = PhoneAuthProvider.credential(
      //   verificationId: verificationid,
      //   smsCode: otpCode,
      // );
      // await auth.signInWithCredential(credential);
      Map<String, dynamic> response;
      if (authmethod == 'signin') {
        response = await LoginVerifyApi.verifyNumber(phone: phone);
      } else if (authmethod == 'signup') {
        response = await phoneOtpApi.registerUserWithOtp(phone: phone);
      } else {
        response = await EditProfileApi.editProfile(phone: phone);
      }

      if (response.isNotEmpty) {
        // Check if the response indicates that the account has been banned
        if (response['error'] == true &&
            response['error_data'] == 'Your account has been banned') {
          LoadingHelper.dismiss();
          Get.snackbar(
            'Error'.tr,
            'Your account has been banned'.tr,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: AppColors.white,
          );
          return;
        }
        box.write('api_token', response['user']['token']);
        box.write('number_verified', 'true');

        box.write('user_type', 'user');
        box.write('user_type', 'user');
        box.write('user_id', response['user']['id']);

        Get.offAllNamed(AppRoutes.main);
        LoadingHelper.dismiss();
        UiUtilites.successSnackbar(
          'OTP verified successfully'.tr,
          'Success!'.tr,
        );
      } else {
        LoadingHelper.dismiss();
        Get.snackbar(
          'Error'.tr,
          'Login failed'.tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: AppColors.white,
        );
      }
    } catch (e) {
      LoadingHelper.dismiss();
      Get.snackbar(
        'Verification failed'.tr,
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: AppColors.white,
      );
    }
  }
}
