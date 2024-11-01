import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';

class ChatScreenController extends GetxController {
  static ChatScreenController intance = Get.find();
  // String id = '';
  // String name = '';
  // String img = '';
  // String screen = '';

  @override
  void onInit() async {
    // id = Get.parameters['id'] ?? '';
    // name = Get.parameters['name'] ?? '';
    // img = Get.parameters['img'] ?? '';
    // screen = Get.parameters['screen'] ?? '';

    update();
    super.onInit();
  }
    List<Map<String, dynamic>> item = [
    {
      'onTab': () {
        Get.toNamed(AppRoutes.chatScreen);
      },
      'image': 'assets/images/street_garage.png',
      "messagetitle": "Street garage",
      "messageSubTitle": "oh hello ahmed, the batte ...",
      'newMessage': "3 New messages",
      "showBluedot": true,
      "showcolor": true,
    },
    {
      "onTab": () {
        Get.toNamed(AppRoutes.chatScreen);
      },
      "imgurl": "https://dummyimage.com/61x61/000/fff",
      "messagetitle": "Street garage",
      "messageSubTitle": "oh hello ahmed, the batte ...",
      'newMessage': " Seen 2m ago",
      "showBluedot": false,
      "showcolor": false,
    },
    {
      "onTab": () {
        Get.toNamed(AppRoutes.chatScreen);
      },
      "messagetitle": "Street garage",
      "messageSubTitle": "oh hello ahmed, the batte ...",
      'newMessage': " 3 days ago",
      "showBluedot": false,
      "showcolor": false,
    },
    {
      "onTab": () {
        Get.toNamed(AppRoutes.chatScreen);
      },
      "imgurl": "https://dummyimage.com/61x61/000/fff",
      "messagetitle": "Street garage",
      "messageSubTitle": "oh hello ahmed, the batte ...",
      'newMessage': "3 New messages",
      "showBluedot": true,
      "showcolor": true,
    },
    {
      "onTab": () {
        Get.toNamed(AppRoutes.chatScreen);
      },
      "imgurl": "https://dummyimage.com/61x61/000/fff",
      "messagetitle": "Street garage",
      "messageSubTitle": "oh hello ahmed, the batte ...",
      'newMessage': "3 New messages",
      "showBluedot": true,
      "showcolor": true,
    },
  ];
}
