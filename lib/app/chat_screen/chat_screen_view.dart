// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/chat_screen/chat_screen_controller.dart';
import 'package:mobilegarage/app/chat_screen/components/app_bar/chat_appbar.dart';
import 'package:mobilegarage/components/app_bar/icon_top_bar.dart';

import '../../utils/colors/app_color.dart';

class ChatScreenView extends StatefulWidget {
  const ChatScreenView({super.key});

  @override
  State<ChatScreenView> createState() => _ChatScreenViewState();
}

class _ChatScreenViewState extends State<ChatScreenView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreenController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                toolbarHeight: Get.height * 0.12,
                automaticallyImplyLeading: false,
                title: ChatTopBar(
                  showicon: true,
                  title: "Street garage",
                ),
              ),
              bottomNavigationBar: Column(
                children: [
                  Row(
                    children: [
                      Divider(
                        thickness: 67,
                        color: AppColors.grey.shade100,
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
