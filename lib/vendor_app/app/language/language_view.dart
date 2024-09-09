import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/language/components/language_card.dart';
import 'package:mobilegarage/vendor_app/app/language/language_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';

class VLanguageView extends StatefulWidget {
  const VLanguageView({super.key});

  @override
  State<VLanguageView> createState() => _VLanguageViewState();
}

class _VLanguageViewState extends State<VLanguageView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VLanguageController>(
      autoRemove: false,
      builder: (controller) => AppLayout(
        appBarTitle: 'Language',
        hasBgColor: true,
        child: Column(
          children: [
            const Gap(9),
            LanguageOption(
              languageName: 'English (United States)',
              languageDescription: 'Default'.tr,
              value: 1,
              groupValue: controller.selectedValue,
              onChanged: (value) {
                setState(() {
                  controller.selectedValue = value!;
                });
              },
            ),
            const Gap(22),
            LanguageOption(
              languageName: 'العربية',
              languageDescription: 'Arabic',
              value: 2,
              groupValue: controller.selectedValue,
              onChanged: (value) {
                setState(() {
                  controller.selectedValue = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
