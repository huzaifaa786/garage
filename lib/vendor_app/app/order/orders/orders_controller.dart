import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class VOrdersController extends GetxController {
  static VOrdersController instance = Get.find();
  GetStorage box = GetStorage();
  String? image;
  String? phoneNumber;
  int selectedIndex = 0;
  int selectedSubIndex = 0;
  List<Map<String, dynamic>> filterList = [
    {
      'Name': 'New orders',
    },
    {
      'Name': 'On the way',
    },
    {
      'Name': 'Delivered',
    },
    {
      'Name': 'Rejected',
    },
  ];

  List<Map<String, dynamic>> subFilterList = [
    {
      'Name': 'Pending',
    },
    {
      'Name': 'Accepted',
    },
  ];

  void makePhoneCall(String phoneNumber) async {
    print(phoneNumber);
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
