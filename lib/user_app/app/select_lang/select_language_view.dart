// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/select_lang/select_language_controller.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/components/cards/language_card.dart';
import 'package:mobilegarage/user_app/components/enums/enums.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class SelectLanguageView extends StatelessWidget {
  const SelectLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectLanguageController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primarybg,
          toolbarHeight: 20,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
            child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(color: AppColors.primarybg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/splash_logo.png'),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                  ),
                  child: Container(
                    height: Get.height * 0.741,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 35,
                        ),
                        child: Column(
                          children: [
                            Gap(30),
                            AppText(
                              title: 'Select \n language',
                              textAlign: TextAlign.center,
                              size: 32,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkprimary,
                            ),
                            Gap(Get.height * 0.06),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: LanguageCard(
                                ontap: () async {
                                  await controller
                                      .toggleplan(translateMethod.English);
                                      Get.offAllNamed(AppRoutes.selectside);
                                },
                                title: 'English',
                                isSelected:
                                    controller.site == translateMethod.English,
                                    
                              ),
                            ),
                            Gap(30),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: LanguageCard(
                                ontap: () async {
                                  await controller
                                      .toggleplan(translateMethod.Arabic);
                                      Get.offAllNamed(AppRoutes.selectside);
                                },
                                title: 'العربية'.tr,
                                isSelected:
                                    controller.site == translateMethod.Arabic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
