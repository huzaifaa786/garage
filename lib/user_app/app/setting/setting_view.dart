import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/setting/setting_controller.dart';

import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/buttons/social_media_button.dart';
import 'package:mobilegarage/user_app/components/cards/all_profile_card.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';


class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
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
                      title: "Settings",
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
                  top: 40,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AllProfileCard(
                          height: Get.height * 0.08,
                          width: Get.width * 0.8,
                          color: AppColors.lightgreysettingCard,
                          text: 'About us',
                          textColor: AppColors.primary,
                          image: 'assets/icons/users.svg',
                          text2: '',
                          ontap: () {
                            Get.toNamed(AppRoutes.aboutus);
                          }),
                      Gap(23),
                      AllProfileCard(
                          height: Get.height * 0.08,
                          width: Get.width * 0.8,
                          color: AppColors.lightgreysettingCard,
                          text: 'Promotion',
                          textColor: AppColors.primary,
                          image: 'assets/icons/award.svg',
                          text2: '',
                          ontap: () {
                            Get.toNamed(AppRoutes.promotion);
                          }),
                      Gap(23),
                      AllProfileCard(
                          height: Get.height * 0.08,
                          width: Get.width * 0.8,
                          color: AppColors.lightgreysettingCard,
                          text: 'FAQ',
                          textColor: AppColors.primary,
                          image: 'assets/icons/help-circle.svg',
                          text2: '',
                          ontap: () {
                            Get.toNamed(AppRoutes.faq);
                          }),
                      Gap(23),
                      AllProfileCard(
                          height: Get.height * 0.08,
                          width: Get.width * 0.8,
                          color: AppColors.lightgreysettingCard,
                          text: 'Terms and conditions',
                          textColor: AppColors.primary,
                          image: 'assets/icons/align-justify.svg',
                          text2: '',
                          ontap: () {
                            Get.toNamed(AppRoutes.termscondition);
                          }),
                      Gap(23),
                      AllProfileCard(
                          height: Get.height * 0.08,
                          width: Get.width * 0.8,
                          color: AppColors.lightgreysettingCard,
                          text: 'Privacy',
                          textColor: AppColors.primary,
                          image: 'assets/icons/local.svg',
                          text2: '',
                          ontap: () {
                             Get.toNamed(AppRoutes.privacy);
                          }),
                      Gap(28),
                      AppText(
                        title: 'Contact us',
                        size: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkprimary,
                      ),
                      Gap(11),
                      Image.asset(
                        'assets/images/mobile_garage.png',
                        // height: 150,
                      ),
                      Gap(22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SocialMediaButton(
                            image: 'assets/icons/mail.svg',
                            ontap: () {},
                          ),
                          SocialMediaButton(
                            image: 'assets/icons/Instagram.svg',
                            ontap: () {},
                          ),
                          SocialMediaButton(
                            image: 'assets/icons/Instagram.svg',
                            ontap: () {},
                          ),
                          SocialMediaButton(
                            image: 'assets/icons/phone.svg',
                            ontap: () {},
                          ),
                        ],
                      ),
                      Gap(40),
                    ],
                  ),
                ),
              )),
            ));
  }
}