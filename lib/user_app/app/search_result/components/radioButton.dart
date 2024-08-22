// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/search_result/searchResult_controller.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class ColumnRadioTile extends StatelessWidget {
  const ColumnRadioTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchResultController>(
        builder: (controller) => Column(
              children: [
                RadioListTile(
                  title: Row(
                    children: [
                      AppText(
                        title: 'Quick Service',
                        size: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      Gap(5),
                      SvgPicture.asset('assets/icons/Thunder.svg'),
                    ],
                  ),
                  value: 'quickService',
                  groupValue: controller.selectedService,
                  onChanged: (value) {
                    controller.onServiceSelected(value!);
                  },
                ),
                RadioListTile(
                  title: Row(
                    children: [
                      AppText(
                        title: 'Set time',
                        size: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      Gap(20),
                      Container(
                        height: 33,
                        width: 85,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.lightgrey),
                        child: Center(
                            child: AppText(
                          title: '09 : 41',
                          color: controller.selectedService != 'quickService'
                              ? AppColors.black
                              : AppColors.greybg,
                          size: 11,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                      Gap(15),
                      Container(
                        height: 33,
                        width: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.lightgrey),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Row(
                            children: [
                              Container(
                                height: 27,
                                width: 38,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: controller.selectedService !=
                                            'quickService'
                                        ? AppColors.primary
                                        : AppColors.grey.withOpacity(0.6),
                                    ),
                                child: Center(
                                  child: AppText(
                                    title: 'AM'.tr,
                                    size: 10,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              Gap(7),
                              AppText(
                                title: 'PM'.tr,
                                size: 10,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  value: 'Set_time',
                  groupValue: controller.selectedService,
                  onChanged: (value) {
                    controller.onServiceSelected(value!);
                  },
                ),
              ],
            ));
  }
}
