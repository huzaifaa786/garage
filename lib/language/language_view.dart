// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/language/component/language_selecter.dart';
import 'package:mobilegarage/selectside/selectside_controller.dart';
import 'package:mobilegarage/user_app/components/enums/enums.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageView();
}

class _LanguageView extends State<LanguageView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectSideController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primarybg,
          toolbarHeight: 20,
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
                          child: Column(children: [
                            Gap(30),
                            AppText(
                              title: '  Select \nlanguage',
                              size: 30,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 96, 3, 5),
                            ),
                            Gap(120),
                            LanguageSelecter(
                              text: 'English',
                              ontap: () async {
                                await controller
                                    .toggleplan(translateMethod.English);
                                Get.updateLocale(const Locale('en', 'US'));
                                GetStorage box = GetStorage();
                                await box.write('locale', 'en');
                              },
                              isSelected:
                                  controller.site == translateMethod.English,
                            ),
                            Gap(60),
                            LanguageSelecter(
                              text: 'العربية',
                              ontap: () async {
                                await controller
                                    .toggleplan(translateMethod.Arabic);
                                Get.updateLocale(const Locale('ar', 'AE'));
                                GetStorage box = GetStorage();
                                await box.write('locale', 'ar');
                              },
                              isSelected:
                                  controller.site == translateMethod.Arabic,
                            ),
                          ])),
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
