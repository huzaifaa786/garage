// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/chat_screen/chat_screen_controller.dart';
import 'package:mobilegarage/user_app/app/chat_screen/components/app_bar/chat_appbar.dart';
import 'package:mobilegarage/user_app/app/chat_screen/components/input_field/chat_text_field.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/chat/chat_controller.dart';

class ChatScreenView extends StatefulWidget {
  const ChatScreenView({super.key});

  @override
  State<ChatScreenView> createState() => _ChatScreenViewState();
}

class _ChatScreenViewState extends State<ChatScreenView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VChatController>(
      autoRemove: false,
      builder: (controller) => Scaffold(
        body: ChatAppbar(
          hasIcon: true,
          appBarTitle: 'Street garage',
          hasBgColor: true,
          child: Column(
            children: [
              Flexible(
                child: Container(
                  height: Get.height * 0.75,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/Group 473.svg"),
                Gap(8),
                Flexible(
                  child: ChatInputField(
                    obscure: false,
                    readOnly: false,
                    suffiximage: "assets/icons/sent_icon.svg",
                  ),
                ),
                Gap(8),
                SvgPicture.asset("assets/icons/location.svg"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
