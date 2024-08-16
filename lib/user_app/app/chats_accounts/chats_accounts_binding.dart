import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/chats_accounts/chats_accounts_controller.dart';

class ChatsAccountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatsAccountsController());
  }
}
