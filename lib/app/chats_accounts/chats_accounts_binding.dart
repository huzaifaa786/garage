import 'package:get/get.dart';
import 'package:mobilegarage/app/chats_accounts/chats_accounts_controller.dart';

class ChatsAccountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatsAccountsController());
  }
}
