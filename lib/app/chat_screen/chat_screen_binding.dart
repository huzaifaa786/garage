import 'package:get/get.dart';
import 'package:mobilegarage/app/chat_screen/chat_screen_controller.dart';

class ChatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatScreenController());
  }
}
