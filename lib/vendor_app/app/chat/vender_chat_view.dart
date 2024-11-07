import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/chat_screen/chat_screen_controller.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/chat/vender_chat_controller.dart';
import 'package:mobilegarage/vendor_app/app/chat/component/vender_chat_card.dart';
import 'package:mobilegarage/vendor_app/app/chat_screen/vender_chat_detail_screen_view.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';

class VChatView extends StatefulWidget {
  const VChatView({super.key});

  @override
  State<VChatView> createState() => _VChatViewState();
}

class _VChatViewState extends State<VChatView> {
  // final ChatScreenController chatController = Get.put(ChatScreenController());
  // @override
  // void initState() {
  //   chatController.getContacts();
  //   chatController.update();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VChatController>(
        autoRemove: false,
        initState: (state) {
          Future.delayed(Duration(milliseconds: 100), () {
            state.controller!.getContacts();
          });   
        },
        builder: (controller) => AppLayout(
            appBarTitle: 'Chat',
            hasBgColor: true,
            child: controller.scontacts.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.scontacts.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ChatCard(
                        name: controller.scontacts[index].username,
                        img: controller.scontacts[index].profilePic != null
                            ? controller.scontacts[index].profilePic
                            : null,
                        ontap: () {
                          Get.to(() => ChatDetailScreenView(
                              id: controller.scontacts[index].id,
                              name: controller.scontacts[index].username,
                              profilePic:
                                  controller.scontacts[index].profilePic,
                              screen: 'chat'));
                        },
                      );
                    },
                  )
                : SizedBox(
                    height: Get.height * 0.7,
                    child: Center(
                        child: Text(
                      'No chat found!',
                      style: TextStyle(fontSize: 14, color: AppColors.grey),
                    )),
                  )));
  }
}
