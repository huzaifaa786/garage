// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/banner/banner_controller.dart';
import 'package:mobilegarage/vendor_app/app/banner/component/cover_picker.dart';
import 'package:mobilegarage/vendor_app/app/banner/component/radio_button.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';
import 'package:mobilegarage/vendor_app/utils/app_button/app_button.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class VBannerView extends StatefulWidget {
  const VBannerView({super.key});

  @override
  State<VBannerView> createState() => _VBannerViewState();
}

class _VBannerViewState extends State<VBannerView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VBannerController>(
        autoRemove: false,
        builder: (controller) => AppLayout(
              appBarTitle: 'Add Banner',
              hasBgColor: true,
              hasShadow: false,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CoverPickerr(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Gap(20),
                              AppText(
                                title: 'Select',
                                size: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          Gap(10),
                          RadioButton(value: 1, text: "3 Days for 30.00 AED"),
                          RadioButton(value: 2, text: "5 Days for 50.00 AED"),
                          RadioButton(value: 3, text: "7 Days for 65.00 AED"),
                          Gap(30),
                          AppButton(
                            title: 'Purchase',
                            buttonColor: controller.cover == null
                                ? Colors.grey
                                : AppColors.primary_color,
                            ontap: controller.cover == null ? null : () {},
                          ),
                        ],
                      ),
                    ),
                    Gap(20),
                  ],
                ),
              ),
            ));
  }
}
