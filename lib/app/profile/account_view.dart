import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/profile/account_controller.dart';
import 'package:mobilegarage/components/app_bar/icon_top_bar.dart';
import 'package:mobilegarage/components/app_bar/top_bar.dart';

import 'package:mobilegarage/components/buttons/logout_button.dart';
import 'package:mobilegarage/components/cards/all_profile_card.dart';
import 'package:mobilegarage/components/cards/email_profile_card.dart';
import 'package:mobilegarage/components/cards/profile_card.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';
import 'package:mobilegarage/utils/shadows/appbar_shadow.dart';
import 'package:mobilegarage/utils/ui_utils/ui_utils.dart';

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
                    ontap: () {
                      Get.toNamed(
                        AppRoutes.editprofile,
                        arguments: {
                          'image': 'https://dummyimage.com/70x70/000/0011ff',
                          'userName': 'User38498990',
                          'userNumber': '+971 0000 0000',
                        },
                      );
                    },
                  ),
                  Gap(23),
                  AllProfileCard(
                      height: Get.height * 0.08,
                      width: Get.width * 0.8,
                      text: 'Dubai',
                      image: 'assets/icons/map_pin.svg',
                      text2: 'zayed street , house3564 ,....',
                      ontap: () {}),
                  Gap(15),
                  AllProfileCard(
                      height: Get.height * 0.08,
                      width: Get.width * 0.8,
                      text: 'My cards',
                      image: 'assets/icons/credit-card.svg',
                      text2: '',
                      ontap: () {
                        Get.toNamed(AppRoutes.my_cars);
                      }),
                  Gap(15),
                  AllProfileCard(
                      height: Get.height * 0.08,
                      width: Get.width * 0.8,
                      text: 'Orders history',
                      image: 'assets/icons/order.svg',
                      text2: '12 items',
                      ontap: () {
                        Get.toNamed(AppRoutes.order_history);
                      }),
                  Gap(15),
                  AllProfileCard(
                      height: Get.height * 0.08,
                      width: Get.width * 0.8,
                      text: 'Language',
                      image: 'assets/icons/language.svg',
                      text2: 'English',
                      ontap: () {
                        Get.toNamed(AppRoutes.language);
                      }),
                  Gap(15),
                  AllProfileCard(
                    text: 'Settings',
                    image: 'assets/icons/language.svg',
                    ontap: () {},
                    text2: '',
                    height: Get.height * 0.08,
                    width: Get.width * 0.8,
                  ),
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
