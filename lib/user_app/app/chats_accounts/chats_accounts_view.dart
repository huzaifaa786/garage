// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/chat_screen/chat_screen_controller.dart';
import 'package:mobilegarage/user_app/app/chat_screen/chat_screen_view.dart';
import 'package:mobilegarage/user_app/app/chats_accounts/Components/charts_card.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class ChatsAccountsView extends StatefulWidget {
  const ChatsAccountsView({super.key});

  @override
  State<ChatsAccountsView> createState() => _ChatsAccountsViewState();
}

class _ChatsAccountsViewState extends State<ChatsAccountsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreenController>(
        autoRemove: false,
        initState: (state) {
          Future.delayed(Duration(milliseconds: 100), () {
            state.controller!.getContacts();
          });
        },
        builder: (controller) => Scaffold(


              appBar: AppBar(
                toolbarHeight: Get.height * 0.1,
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
                title: TopBar(
                  title: "Chats".tr,
                  showicon: true,
                ),
              ),
              body: SafeArea(

                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    controller.scontacts.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.scontacts.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  color: AppColors.grey.shade100,
                                  child: ChartsCard(
                                    name: controller.scontacts[index].username,
                                    img: controller.scontacts[index].profilePic,
                                    msg: 'Tap here to view messages'.tr,
                                    ontap: () {
                                      Get.to(() => ChatScreenView(
                                          id: controller.scontacts[index].id,
                                          name: controller
                                              .scontacts[index].username,
                                          profilePic: controller
                                              .scontacts[index].profilePic,
                                          screen: 'chat'));
                                    },
                                  ));
                            })
                        : SizedBox(
                            height: Get.height * 0.7,
                            child: Center(
                                child: Text(
                              'No chat found!'.tr,
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.grey),
                            )),
                          )
                  ],
                )),
              ),
            ));
  }
}
