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
import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';

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
                preferredSize: const Size.fromHeight(70.0),
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
                      showgarageicon: false,
                      title: "Settings".tr,
                    ),
                  ),
                ),
              ),
              backgroundColor: AppColors.grey.withOpacity(0.1),
              body: SafeArea(
                  child: Container(
                padding: const EdgeInsets.only(
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
                          text: 'About us'.tr,
                          textColor: AppColors.primary,
                          image: 'assets/icons/users.svg',
                          text2: '',
                          ontap: () {
                            Get.toNamed(AppRoutes.aboutus);
                          }),
                      const Gap(23),
                      AllProfileCard(
                          height: Get.height * 0.08,
                          width: Get.width * 0.8,
                          color: AppColors.lightgreysettingCard,
                          text: 'Promotion'.tr,
                          textColor: AppColors.primary,
                          image: 'assets/icons/award.svg',
                          text2: '',
                          ontap: () {
                            Get.toNamed(AppRoutes.promotion);
                          }),
                      const Gap(23),
                      AllProfileCard(
                          height: Get.height * 0.08,
                          width: Get.width * 0.8,
                          color: AppColors.lightgreysettingCard,
                          text: 'FAQ'.tr,
                          textColor: AppColors.primary,
                          image: 'assets/icons/help-circle.svg',
                          text2: '',
                          ontap: () {
                            Get.toNamed(AppRoutes.faq);
                          }),
                      const Gap(23),
                      AllProfileCard(
                          height: Get.height * 0.08,
                          width: Get.width * 0.8,
                          color: AppColors.lightgreysettingCard,
                          text: 'Terms and conditions'.tr,
                          textColor: AppColors.primary,
                          image: 'assets/icons/align-justify.svg',
                          text2: '',
                          ontap: () {
                            Get.toNamed(AppRoutes.termscondition);
                          }),
                      const Gap(23),
                      AllProfileCard(
                          height: Get.height * 0.08,
                          width: Get.width * 0.8,
                          color: AppColors.lightgreysettingCard,
                          text: 'Privacy'.tr,
                          textColor: AppColors.primary,
                          image: 'assets/icons/local.svg',
                          text2: '',
                          ontap: () {
                            Get.toNamed(AppRoutes.privacy);
                          }),
                      const Gap(28),
                      AppText(
                        title: 'Contact us'.tr,
                        size: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkprimary,
                      ),
                      const Gap(11),
                      SvgPicture.asset(
                        ImageConst.appLogoSvg,
                        height: 70,
                        color: AppColors.primary_color,
                      ),
                      const Gap(22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SocialMediaButton(
                            image: 'assets/icons/mail_bold.svg',
                            ontap: () {
                              controller.openEmail();
                            },
                          ),
                          SocialMediaButton(
                            image: 'assets/icons/Instagram.svg',
                            ontap: () {
                              controller.openInstagram();
                            },
                          ),
                          SocialMediaButton(
                            image: 'assets/icons/whatsapp_img.svg',
                            ontap: () {
                              controller.openWhatsApp();
                            },
                          ),
                          SocialMediaButton(
                            image: 'assets/icons/phone.svg',
                            ontap: () {
                              controller.openPhone();
                            },
                          ),
                        ],
                      ),
                      const Gap(40),
                    ],
                  ),
                ),
              )),
            ));
  }
}
