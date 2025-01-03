
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController {
  static SettingController instance = Get.find();
 
  String email = 'admin@gmail.com';
  String phoneNo = '+923455453765';
  String whatsappNo = '+923455453765';
  String instagram = '@babarAzam';
 String linkedin = 'https://www.linkedin.com/in/your-profile/';
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
   void openLinkedIn() async {
    final uri = Uri.parse(linkedin);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
 
}
