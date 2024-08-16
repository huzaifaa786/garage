// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/profile/edit_profile/edit_profile_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/icon_top_bar.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';

import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/components/cards/all_profile_card.dart';
import 'package:mobilegarage/user_app/components/textfields/main_input.dart';

import 'package:mobilegarage/user_app/components/textfields/phone_inputfield.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';

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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(95.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [appbarShadow],
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0.0,
              toolbarHeight: 95.0,
              title: TopBar(
                showicon: true,
                title: "Edit profile",
              ),
            ),
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
                  Gap(12),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(
                          title: '(Optional)',
                          size: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                  ),
                  Gap(12),
                  MainInput(
                    hint: 'Email'.tr,
                    controller: controller.emailController,
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
                  Gap(22),
                  Container(
                    height: 37,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: AppColors.lightprimary,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.changephonenumber);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            title: 'Change phone number',
                            size: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                          Gap(2),
                          SvgPicture.asset('assets/icons/arrow-left.svg'),
                        ],
                      ),
                    ),
                  ),
                  Gap(50),
                  // Gap(88),
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
