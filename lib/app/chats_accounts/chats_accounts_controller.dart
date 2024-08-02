import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';

class ChatsAccountsController extends GetxController {
  static ChatsAccountsController intanse = Get.find();

  List<Map<String, dynamic>> item = [
    {
      'onTab': () {
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
      'newMessage': " Seen 2m ago",
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
