// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/chat_screen/chat_screen_controller.dart';
import 'package:mobilegarage/user_app/app/chat_screen/chat_screen_view.dart';
import 'package:mobilegarage/user_app/app/chats_accounts/Components/charts_card.dart';
import 'package:mobilegarage/user_app/app/chats_accounts/chats_accounts_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';

class ChatsAccountsView extends StatefulWidget {
  const ChatsAccountsView({super.key});

  @override
  State<ChatsAccountsView> createState() => _ChatsAccountsViewState();
}

class _ChatsAccountsViewState extends State<ChatsAccountsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreenController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                toolbarHeight: Get.height * 0.1,
                automaticallyImplyLeading: false,
                title: TopBar(
                  title: "Chats".tr,
                  showicon: true,
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.item.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = controller.item[index];
                          return Container(
                              color: AppColors.grey.shade100,
                              child: ChartsCard(
                                name: 'item',
                                img: 'assets/images/street_garage.png',
                                msg: 'Tap here to view messages',
                                ontap: () {
                                  // Get.toNamed(AppRoutes.chatScreen,parameters: {
                                  //   'id':'1',
                                  //   'name':'item',
                                  //   'img':'assets/images/street_garage.png',
                                  //   'screen':'chat',

                                  // });
                                  Get.to(() => ChatScreenView(
                                      id: 'chatController.scontacts[index].id',
                                      name: 'chatController',
                                      // .scontacts[index].username,
                                      profilePic: 'chatController',
                                      // .scontacts[index].profilePic,
                                      screen: 'chat'));
                                },
                              ));
                        })
                  ],
                )),
              ),
            ));
  }
}
