import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/chat_screen/chat_screen_controller.dart';
import 'package:mobilegarage/user_app/app/chat_screen/components/app_bar/chat_appbar.dart';
import 'package:mobilegarage/user_app/app/chat_screen/components/input_field/chat_text_field.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

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
        resizeToAvoidBottomInset: true, 
       appBar: AppBar(
              toolbarHeight: Get.height * 0.12,
              automaticallyImplyLeading: false,
              title: ChatTopBar(
                showicon: true,
                title: "Street garage",
              ),
            ),
        body: SingleChildScrollView(
          child: Column(
            children: [
             Gap(10),
              Container(
                height: Get.height * 0.75, // Adjust this to fit your chat messages
                // Chat messages container
                // ...
              ),
              Divider(
                thickness: 2,
                color: AppColors.grey.shade100,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset("assets/icons/Group 473.svg"),
                    ChatInputField(
                      obscure: false,
                      readOnly: false,
                      suffiximage: "assets/icons/sent_icon.svg",
                    ),
                    SvgPicture.asset("assets/icons/location.svg"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
