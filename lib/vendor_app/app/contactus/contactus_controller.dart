import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/contact_us/contact_us_api.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class VContactusController extends GetxController {
  static VContactusController instance = Get.find();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getContacts();
  }

  getContacts() async {
    var response = await VContactUsApi.getContacts();
    if (response.isNotEmpty) {
      var contacts = response['contacts'];
      if (contacts != null) {
        email = contacts['email'] ?? '';
        phoneNo = contacts['phone_no'] ?? '';
        whatsappNo = contacts['whatsapp_no'] ?? '';
        instagram = contacts['instagram_handle'] ?? '';
      }

      update();
    }
  }

  String email = '';
  String phoneNo = '';
  String whatsappNo = '';
  String instagram = '';
  void openEmail(BuildContext context) async {
    final uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Use custom error snackbar
      UiUtilites.errorSnackbar('Error'.tr, 'Email not found.'.tr);
    }
  }

  void openPhone(BuildContext context) async {
    final uri = Uri(scheme: 'tel', path: phoneNo);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      UiUtilites.errorSnackbar('Error'.tr, 'Phone number not found.'.tr);
    }
  }

  void openWhatsApp(BuildContext context) async {
    final uri = Uri.parse("https://wa.me/$whatsappNo");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      UiUtilites.errorSnackbar('Error'.tr, 'WhatsApp number not found.'.tr);
    }
  }

  void openInstagram(BuildContext context) async {
    final uri = Uri.parse("https://www.instagram.com/$instagram");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      UiUtilites.errorSnackbar('Error'.tr, 'Instagram account not found.'.tr);
    }
  }
}
