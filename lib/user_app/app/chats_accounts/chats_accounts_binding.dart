import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/chat_screen/chat_screen_controller.dart';
// import 'package:mobilegarage/user_app/app/chats_accounts/chats_accounts_controller.dart';

class ChatsAccountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatScreenController());
  }
}
