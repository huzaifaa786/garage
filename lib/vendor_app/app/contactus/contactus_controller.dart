import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/contact_us/contact_us_api.dart';
import 'package:url_launcher/url_launcher.dart';

class VContactusController extends GetxController {
  static VContactusController instance = Get.find();
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   getContacts();
  // }
  // getContacts() async {
  //   var response = await VContactUsApi.getContacts();
  //   if (response.isNotEmpty) {
  //     var contact = response['contacts'];
  //     email = contact['email'] ?? '';
  //     phoneNo = contact['phone_no'] ?? '';
  //     whatsappNo = contact['whatsapp_no'] ?? '';
  //     instagram = contact['instagram_handle'] ?? '';
  //     update();
  //   }
  // }

  String email = '';
  String phoneNo = '';
  String whatsappNo = '';
  String instagram = '';

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
