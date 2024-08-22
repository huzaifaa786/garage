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
        body: SafeArea(
          child: SizedBox(
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(Get.height * 0.08),
                  Image.asset('assets/images/auth_logo.png'),
                  Gap(20),
                  AppText(
                    title: 'What is your\n language?..',
                    size: 36,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkprimary,
                  ),
                  Gap(Get.height * 0.06),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: LanguageCard(
                      ontap: () async {
                        await controller.toggleplan(translateMethod.English);
                      },
                      title: 'English',
                      isSelected: controller.site == translateMethod.English,
                    ),
                  ),
                  Gap(30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: LanguageCard(
                      ontap: () async {
                        await controller.toggleplan(translateMethod.Arabic);
                      },
                      title: 'العربية'.tr,
                      isSelected: controller.site == translateMethod.Arabic,
                    ),
                  ),
                  Gap(Get.height * 0.12),
                  MainButton(
                    title: 'Continue',
                    buttonWidth: Get.width * 0.77,
                    onTap: () {
                      Get.offAllNamed(AppRoutes.selectside);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
