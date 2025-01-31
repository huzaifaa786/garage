import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/user_app/app/languange/languange_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/enums/enums.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';

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
                showgarageicon: false,
                showicon: true,
                title: "Language".tr,
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
          child: Column(
            children: [
              InkWell(
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
                          title: 'English (United States)'.tr,
                          size: 14,
                          fontWeight: FontWeight.w400,
                          color: controller.site == translateMethod.English
                              ? AppColors.black
                              : AppColors.black,
                        ),
                        const Gap(5),
                        AppText(
                          title: 'Default'.tr,
                          size: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                    Radio(
                      value: translateMethod.English,
                      groupValue: controller.site,
                      activeColor: AppColors.primary,
                      fillColor: MaterialStateProperty.all(AppColors.primary),
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
              const Gap(22),
              InkWell(
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
                                ? AppColors.black
                                : AppColors.black,
                          ),
                          const Gap(5),
                          const AppText(
                            title: 'Arabic',
                            size: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                      Radio(
                        value: translateMethod.Arabic,
                        groupValue: controller.site,
                        fillColor: MaterialStateProperty.all(AppColors.primary),
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
          ),
        )),
      ),
    );
  }
}
