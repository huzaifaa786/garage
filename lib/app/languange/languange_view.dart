import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/app/languange/languange_controller.dart';
import 'package:mobilegarage/components/cards/language_card.dart';
import 'package:mobilegarage/components/enums/enums.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class LanguangeView extends StatefulWidget {
  const LanguangeView({super.key});

  @override
  State<LanguangeView> createState() => _LanguangeViewState();
}

class _LanguangeViewState extends State<LanguangeView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguagesController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                await controller.toggleplan(translateMethod.English);
                Get.updateLocale(const Locale('en', 'US'));
                GetStorage box = GetStorage();
                await box.write('locale', 'en');
                setState(() {});
                controller.site = translateMethod.English;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: 'English (United States)',
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: controller.site == translateMethod.English
                            ? AppColors.primary
                            : AppColors.black,
                      ),
                      Gap(5),
                      AppText(
                        title: 'Default',
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                  Radio(
                    value: translateMethod.English,
                    groupValue: controller.site,
                    activeColor: AppColors.primary,
                    fillColor:
                        MaterialStateProperty.all(AppColors.primary),
                    onChanged: (value) async {
                      await controller.toggleplan(value!);
                      Get.updateLocale(const Locale('en', 'US'));
                      GetStorage box = GetStorage();
                      await box.write('locale', 'en');
                      setState(() {});
                      controller.site = value;
                    },
                  ),
                ],
              ),
            ),
            Gap(22),
            GestureDetector(
              onTap: () async {
                await controller.toggleplan(translateMethod.Arabic);
                Get.updateLocale(const Locale('ar', 'AE'));
                GetStorage box = GetStorage();
                await box.write('locale', 'ar');
                print('Language changed to Arabic');
                print('Stored locale: ${box.read('locale')}');
                print('Current locale: ${Get.locale}');
                controller.site = translateMethod.Arabic;
                setState(() {});
              },
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          title: 'العربية',
                          size: 14,
                          fontWeight: FontWeight.w400,
                          color: controller.site == translateMethod.Arabic
                              ? AppColors.primary
                              : AppColors.black,
                        ),
                        Gap(5),
                        AppText(
                          title: 'Arabic',
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                    Radio(
                      value: translateMethod.Arabic,
                      groupValue: controller.site,
                      fillColor:
                          MaterialStateProperty.all(AppColors.primary),
                      activeColor: AppColors.primary,
                      onChanged: (value) async {
                        await controller.toggleplan(value!);
                        Get.updateLocale(const Locale('ar', 'AE'));
                        GetStorage box = GetStorage();
                        await box.write('locale', 'ar');
                        print('Stored locale: ${box.read('locale')}');
                        print('Current locale: ${Get.locale}');
                        controller.site = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
