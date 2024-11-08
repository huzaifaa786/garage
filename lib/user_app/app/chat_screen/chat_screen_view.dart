// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:mobilegarage/components/chatify/replycard.dart';
import 'package:mobilegarage/user_app/app/chat_screen/chat_screen_controller.dart';
import 'package:mobilegarage/user_app/app/chat_screen/components/app_bar/chat_appbar.dart';
import 'package:mobilegarage/user_app/app/chat_screen/components/input_field/chat_text_field.dart';
import 'package:mobilegarage/user_app/helper/permission.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'dart:io' as io;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChatScreenView extends StatefulWidget {
  const ChatScreenView(
      {super.key, this.id, this.name, this.profilePic, this.screen});
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
      initState: (state) {
        Future.delayed(Duration(milliseconds: 100), () {
          chatController.massages = RxList([]);
          msg();
          chatController.initPusher(widget.id);
          chatController.fetchmassage(widget.id);
        });
      },
      builder: (controller) => Scaffold(
        body: ChatAppbar(
          hasIcon: true,
          appBarTitle: widget.name,
          appBarimage: widget.profilePic,
          hasBgColor: true,
          child: Column(
            children: [
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
                              .massages[controller.massages.length - 1 - index]
                              .body
                              .toString(), // Reverse the index
                          Time: getTime(controller
                              .massages[controller.massages.length - 1 - index]
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
                              .massages[controller.massages.length - 1 - index]
                              .file_name,
                          fileType: controller
                              .massages[controller.massages.length - 1 - index]
                              .file_type,
                          fileTitle: controller
                              .massages[controller.massages.length - 1 - index]
                              .file_title,
                          fileExist: fileExist,
                          location: controller
                              .massages[controller.massages.length - 1 - index]
                              .location.toString(),
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
                GestureDetector(
                    onTap: () {
                      controller.picksinglefile();
                    },
                    child: SvgPicture.asset("assets/icons/Group 473.svg")),
                Gap(8),
                Flexible(
                  child: ChatInputField(
                    obscure: false,
                    readOnly: false,
                    suffiximage: "assets/icons/sent_icon.svg",
                    controller: controller.massagecontroller,
                    onSubmit: (value) {
                      if (value.trim().isNotEmpty) {
                        // Send the message when 'Enter' is pressed and the input is not empty
                        chatController.sendMassage();
                      }
                      setState(() {});
                    },
                    onsendtap: () {
                      if (chatController.massagecontroller.text
                          .trim()
                          .isNotEmpty) {
                        chatController.sendMassage();
                      }
                    },
                  ),
                ),
                Gap(8),
                GestureDetector(
                    onTap: () async {
                      if (await getLocationPermission() == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlacePicker(
                              apiKey:
                                  "AIzaSyASCMQagE0IHqYPiniGuCf-_jh5XHlwMy8",
                              onPlacePicked: (result)async {
                                log(result.geometry!.location.lat.toString());
                                log(result.geometry!.location.lng.toString());

                                controller.currentAddress =
                                    result.formattedAddress!;
                                controller.lat =
                                    result.geometry!.location.lat;
                                controller.lng =
                                    result.geometry!.location.lng;
                                controller.update();
                                Navigator.of(context).pop();
                                await chatController. sendMassage();
                              },
                              initialPosition: LatLng(
                                  controller.currentPosition != null
                                      ? controller.currentPosition!.latitude
                                      : 25.1972,
                                  controller.currentPosition != null
                                      ? controller.currentPosition!.longitude
                                      : 55.2744),
                              useCurrentLocation: true,
                              resizeToAvoidBottomInset: false,
                            ),
                          ),
                        );
                      }
                    },
                    // },
                    child: SvgPicture.asset("assets/icons/location.svg")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
