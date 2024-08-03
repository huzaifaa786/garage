import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/profile/edit_profile/edit_profile_controller.dart';
import 'package:mobilegarage/components/app_bar/icon_top_bar.dart';

import 'package:mobilegarage/components/buttons/main_button.dart';
import 'package:mobilegarage/components/cards/all_profile_card.dart';
import 'package:mobilegarage/components/textfields/main_input.dart';

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
          title: IconTopBar(
            title: "Edit profile",
            showicon: false,
          ),
          automaticallyImplyLeading: false,
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
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: controller.cameraImage != null
                            ? FileImage(controller.cameraImage!)
                            : null,
                        child: controller.cameraImage == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://dummyimage.com/70x70/000/0011ff',
                                  height: 110,
                                  width: 106,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              )
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            controller.selectCameraImage();
                          },
                          child: Image.asset('assets/images/camera.png'),
                        ),
                      ),
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
                  MainInput(
                    hint: 'Name'.tr,
                    controller: controller.nameController,
                    
                    errorText: '',
                  ),
                  Gap(22),
                  MainInput(
                    hint: '+971  User 2366718'.tr,
                    readOnly: true,
                    controller: controller.phoneController,
                    errorText: '',
                    onchange: (value) {
                      print('Current input: $value');
                    },
                  ),
                  Gap(88),
                  MainButton(
                    title: 'Save changes',
                    buttonWidth: Get.width * 0.77,
                    onTap: () {
                      Get.back();
                    },
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
