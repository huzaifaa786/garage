import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController {
  static SettingController instance = Get.find();
 
  String email = 'admin@gmail.com';
  String phoneNo = '+923455453765';
  String whatsappNo = '+923455453765';
  String instagram = '@babarAzam';

  void openEmail() async {
    final uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void openPhone() async {
    final uri = Uri(scheme: 'tel', path: phoneNo);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void openWhatsApp() async {
    final uri = Uri.parse("https://wa.me/$whatsappNo");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void openInstagram() async {
    final uri = Uri.parse("https://www.instagram.com/$instagram");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
 
}
