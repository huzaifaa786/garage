import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/profile/edit_profile/edit_profile_controller.dart';
import 'package:mobilegarage/components/app_bar/chat_top_bar.dart';
import 'package:mobilegarage/components/buttons/main_button.dart';
import 'package:mobilegarage/components/cards/all_profile_card.dart';
import 'package:mobilegarage/components/textfields/name_inputfield.dart';
import 'package:mobilegarage/components/textfields/phone_inputfield.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: ChatTopBar(
            title: "Edit profile",
            showicon: false,
          ),
        ),
        body: SafeArea(
            child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 46, right: 46),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(52),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: CachedNetworkImage(
                          imageUrl: 'https://dummyimage.com/70x70/000/0011ff',
                          height: 110,
                          width: 106,
                          fit: BoxFit.cover,
                          // placeholder: (context, url) => CircularProgressIndicator(),
                          // errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      // ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Image.asset('assets/images/camera.png')),
                    ],
                  ),
                  Gap(20),
                  Row(
                    children: [
                      AppText(
                        title: 'My information',
                        size: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Gap(22),
                  NameInputField(controller: controller.nameController),
                  Gap(22),
                  PhoneInputField(
                    controller: controller.phoneController,
                    onChanged: controller.onChanged,
                  ),
                  Gap(88),
                  MainButton(
                    title: 'Save changes',
                    buttonWidth: Get.width * 0.77,
                    onTap: () {},
                  ),
                  Gap(20),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
