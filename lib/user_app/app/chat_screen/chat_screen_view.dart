// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/components/chatify/replycard.dart';
import 'package:mobilegarage/user_app/app/chat_screen/chat_screen_controller.dart';
import 'package:mobilegarage/user_app/app/chat_screen/components/app_bar/chat_appbar.dart';
import 'package:mobilegarage/user_app/app/chat_screen/components/input_field/chat_text_field.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'dart:io' as io;

class ChatScreenView extends StatefulWidget {
  const ChatScreenView(
      {super.key,
      this.id,
       this.name,
       this.profilePic,
      this.screen});
  final String? id;
  final String? name;
  final String? profilePic;
  final String? screen;

  @override
  State<ChatScreenView> createState() => _ChatScreenViewState();
}

class _ChatScreenViewState extends State<ChatScreenView> {
  final ChatScreenController chatController = Get.put(ChatScreenController());

   GetStorage box = GetStorage();
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  msg() async {
    await chatController.makeseen(widget.id!);
    await chatController.unseenchat();
  }
 @override
  void initState() {
    // chatController.massages = RxList([]);
    // msg();
    // chatController.initPusher(widget.id);
    // chatController.fetchmassage(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    pusher.disconnect();
    pusher.unsubscribe(channelName: "private-chatify.${widget.id}");
    super.dispose();
  }

  String getTime(DateTime? dateTime) {
    if (dateTime != null) {
      return TimeOfDay.fromDateTime(dateTime.toLocal()).format(context);
    } else {
      return '';
    }
  }

  Future<bool> checkFileExistance(int index) async {
    var fileExist = await io.File('/storage/emulated/0/Download/' +
            chatController.massages[chatController.massages.length - 1 - index]
                .file_title!)
        .exists();
    return fileExist;
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreenController>(
      autoRemove: false,
      builder: (controller) => Scaffold(
        body: ChatAppbar(
          hasIcon: true,
          appBarTitle: widget.name,
          appBarimage: widget.profilePic,
          hasBgColor: true,
          child: Column(
            children: [
              // Flexible(
              //   child: Container(
              //      height: Get.height * 0.75,
              //   ),
              // ),
               Expanded(
                    child: ListView.builder(
                        reverse: true, // Set reverse to true
                        itemCount: controller.massages.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          bool fileExist = false;
                          checkFileExistance(index)
                              .then((value) => fileExist = value);
                          print(fileExist);
                          return ReplyMessageCard(
                            msg: controller
                                .massages[
                                    controller.massages.length - 1 - index]
                                .body
                                .toString(), // Reverse the index
                            Time: getTime(controller
                                .massages[
                                    controller.massages.length - 1 - index]
                                .dateTime), // Reverse the index
                            sender: controller
                                        .massages[controller.massages.length -
                                            1 -
                                            index]
                                        .to_id ==
                                    widget.id
                                ? false
                                : true,
                            fileName: controller
                                .massages[
                                    controller.massages.length - 1 - index]
                                .file_name,
                            fileType: controller
                                .massages[
                                    controller.massages.length - 1 - index]
                                .file_type,
                            fileTitle: controller
                                .massages[
                                    controller.massages.length - 1 - index]
                                .file_title,
                            fileExist: fileExist,
                          );
                        })),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
