// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_view.dart';
import 'package:mobilegarage/user_app/app/profile/edit_profile/edit_profile_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/components/textfields/main_input.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';

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
          preferredSize: Size.fromHeight(70.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [appbarShadow],
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0.0,
              toolbarHeight: 95.0,
              title: TopBar(
                showgarageicon: false,
                showicon: true,
                title: "Edit profile".tr,
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: 46, right: 46),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(15),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: controller.img != ''
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: CachedNetworkImage(
                                imageUrl: controller.img.toString(),
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            )
                          : controller.profilepic != null
                              ? ClipOval(
                                  child: Image.file(
                                    controller.profilepic!,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipOval(
                                  child: Image.asset(
                                    'assets/images/user_profile2.png',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          controller.pickImageFromGallery('profilepic');
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
                      title: 'My information'.tr,
                      size: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Gap(22),
                MainInput(
                  height: Get.height * 0.07,
                  hint: 'Name'.tr,
                  controller: controller.nameController,
                  errorText: '',
                ),
                Gap(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(
                            title: '(Optional)'.tr,
                            size: 10,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                    ),
                    Gap(12),
                    MainInput(
                      height: Get.height * 0.07,
                      hint: 'Email'.tr,
                      controller: controller.emailController,
                      errorText: '',
                    ),
                  ],
                ),

                Gap(22),
                MainInput(
                  height: Get.height * 0.07,
                  hint: 'Phone number'.tr,
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
                    color: AppColors.lightPink,
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
                          title: 'Change phone number'.tr,
                          size: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                        Gap(2),
                        SvgPicture.asset(box.read('locale') != 'ar'
                            ? 'assets/icons/arrow-left.svg'
                            : 'assets/icons/arrow_leftside.svg'),
                      ],
                    ),
                  ),
                ),
                Gap(50),
                // Gap(88),
                MainButton(
                  title: 'Save changes'.tr,
                  buttonWidth: Get.width * 0.77,
                  height: Get.height * 0.077,
                  onTap: () {
                    controller.onSaveChanges();
                  },
                ),
                Gap(20),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
