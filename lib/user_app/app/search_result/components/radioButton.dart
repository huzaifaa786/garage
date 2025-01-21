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
                        title: 'Quick Service'.tr,
                        size: 13,
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
                        title: 'Set time'.tr,
                        size: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      Gap(20),
                      GestureDetector(
                        onTap: () async {
                          final TimeOfDay? newTime = await showTimePicker(
                            context: Get.context!,
                            initialTime: controller.selectedTimeFrom,
                          );
                          if (newTime != null) {
                            controller.updateSelectedTime(
                                newTime, newTime.period == DayPeriod.am);
                          }
                        },
                        child: Container(
                          height: 33,
                          width: 85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.lightgrey),
                          child: Center(
                              child: AppText(
                            title:
                                "${controller.selectedTimeFrom.hourOfPeriod.toString().padLeft(2, '0')} : ${controller.selectedTimeFrom.minute.toString().padLeft(2, '0')}",
                            color: controller.selectedService != 'quickService'
                                ? AppColors.black
                                : AppColors.greybg,
                            size: 11,
                            fontWeight: FontWeight.w500,
                          )),
                        ),
                      ),
                      Gap(15),
                      Container(
                        height: 33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.lightgrey,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 27,
                              width: 38,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: controller.selectedTimeFrom.period ==
                                        DayPeriod.am
                                    ? AppColors.primary
                                    : AppColors.lightgrey,
                              ),
                              child: Center(
                                child: AppText(
                                  title: 'AM',
                                  size: 10,
                                  fontWeight: FontWeight.w500,
                                  color: controller.selectedTimeFrom.period ==
                                          DayPeriod.am
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                            ),
                            Container(
                              height: 27,
                              width: 38,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: controller.selectedTimeFrom.period ==
                                        DayPeriod.pm
                                    ? AppColors.primary
                                    : AppColors.lightgrey,
                              ),
                              child: Center(
                                child: AppText(
                                  title: 'PM',
                                  size: 10,
                                  fontWeight: FontWeight.w500,
                                  color: controller.selectedTimeFrom.period ==
                                          DayPeriod.pm
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildAmPmToggle(SearchResultController controller) {
    return Container(
      height: 33,
      width: 75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: AppColors.lightgrey),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                controller.updateSelectedTime(
                  controller.selectedTimeFrom,
                  true,
                ); // AM selected
              },
              child: Container(
                height: 27,
                width: 38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: controller.isAm
                        ? AppColors.primary
                        : AppColors.grey.withOpacity(0.6)),
                child: Center(
                  child: AppText(
                    title: 'AM'.tr,
                    size: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            Gap(7),
            GestureDetector(
              onTap: () {
                controller.updateSelectedTime(
                  controller.selectedTimeFrom,
                  false,
                ); // PM selected
              },
              child: AppText(
                title: 'PM'.tr,
                size: 10,
                fontWeight: FontWeight.w400,
                color: controller.isAm
                    ? AppColors.grey.withOpacity(0.5)
                    : AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
