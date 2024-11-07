import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/chat/vender_chat_controller.dart';

class VChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VChatController());
  }
}