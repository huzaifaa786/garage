import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController {
  static SettingController instance = Get.find();

  String email = 'mobile.garage@outlook.com';
  String phoneNo = '+971555007411';
  String whatsappNo = '+971555007411';
  String instagram =
      'https://www.instagram.com/mobile_garage_app?igsh=b3M2OHNnYzQ4dWU4';
  String linkedin = 'https://www.facebook.com/share/19jFuhpeay/';
  String subject = '';
  String body = '';
  Future<void> openEmail() async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: email,
      query:
          'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );

    await launchUrl(url);
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
    final uri = Uri.parse("https://www.instagram.com/mobile_garage_app?igsh=b3M2OHNnYzQ4dWU4");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void openLinkedIn() async {
    final uri = Uri.parse(linkedin);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
