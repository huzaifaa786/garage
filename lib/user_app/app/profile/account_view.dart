import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/profile/account_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/icon_top_bar.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';

import 'package:mobilegarage/user_app/components/buttons/logout_button.dart';
import 'package:mobilegarage/user_app/components/cards/all_profile_card.dart';
import 'package:mobilegarage/user_app/components/cards/email_profile_card.dart';
import 'package:mobilegarage/user_app/components/cards/profile_card.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';
import 'package:mobilegarage/user_app/utils/ui_utils/ui_utils.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      autoRemove: false,
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
                title: "Profile",
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.grey.withOpacity(0.1),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              left: 44,
              right: 44,
              top: 56,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileCard(
                    image: 'https://dummyimage.com/70x70/000/0011ff',
                    userName: 'User38498990',
                    userNumber: 'User38498990',
                    userEmail: 'ahmed34@gmail.com',
                    ontap: () {
                      Get.toNamed(
                        AppRoutes.editprofile,
                        arguments: {
                          'image': 'https://dummyimage.com/70x70/000/0011ff',
                          'userName': 'User38498990',
                          'userNumber': '+971 0000 0000',
                          'userEmail': 'ahmed34@gmail.com',
                        },
                      );
                    },
                  ),
                  Gap(23),
                  AllProfileCard(
                      height: Get.height * 0.08,
                      width: Get.width * 0.8,
                      color: AppColors.lightprimary,
                      text: 'Dubai',textColor: AppColors.black,
                      image: 'assets/icons/map_pin.svg',
                      text2: 'zayed street , house3564 ,....',
                      ontap: () {
                        Get.toNamed(AppRoutes.my_location);
                      }),
                  Gap(15),
                  AllProfileCard(
                      height: Get.height * 0.08,
                      width: Get.width * 0.8,
                      color: AppColors.lightprimary,
                      text: 'My cars',textColor: AppColors.black,
                      image: 'assets/icons/car.svg',
                      text2: '',
                      ontap: () {
                        Get.toNamed(AppRoutes.my_cars);
                      }),

                  Gap(15),
                  AllProfileCard(
                      height: Get.height * 0.08,
                      width: Get.width * 0.8,
                      color: AppColors.lightprimary,
                      text: 'Language',textColor: AppColors.black,
                      image: 'assets/icons/language.svg',
                      text2: 'English',
                      ontap: () {
                        Get.toNamed(AppRoutes.language);
                      }),
                  Gap(15),
                  AllProfileCard(
                    color: AppColors.lightprimary,
                    text: 'Settings',textColor: AppColors.black,
                    image: 'assets/icons/setting.svg',
                    ontap: () {
                      Get.toNamed(AppRoutes.setting);
                    },
                    text2: '',
                    height: Get.height * 0.08,
                    width: Get.width * 0.8,
                  ),
                  Gap(15),
                  AllProfileCard(
                    color: AppColors.lightprimary,
                      height: Get.height * 0.08,
                      width: Get.width * 0.8,
                      text: 'Orders history',textColor: AppColors.black,
                      image: 'assets/icons/order.svg',
                      text2: '12 items',
                      ontap: () {
                        Get.toNamed(AppRoutes.order_history);
                      }),
                  // EmailProfileCard(
                  //     height: Get.height * 0.08,
                  //     width: Get.width * 0.8,
                  //     text: 'Contact us',
                  //     image: 'assets/icons/mail.svg',
                  //     text2: 'mobilegarage1@gmail.com',
                  //     ontap: () {}),
                  Gap(53),
                  LogoutButton(
                    image: 'assets/icons/log-out.svg',
                    title: 'Log out',
                    buttonWidth: Get.width * 0.77,
                    onTap: () {
                      UiUtilites.logoutSuccessAlert(context, () {}, () {});
                    },
                  ),
                  Gap(25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}