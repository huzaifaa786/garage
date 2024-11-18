import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/app/avaliable_date/avaliabledate_controller.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class SelectedDate extends StatelessWidget {
  const SelectedDate({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AvaliableDateController>(
      initState: (_) {
        Get.find<AvaliableDateController>().getUnavailableDates();
      },
      builder: (controller) {
        if (controller.selectedDates.isEmpty) {
          return Center(
            child: AppText(
              title: 'No unavailable dates'.tr,
              color: AppColors.primary_color,
            ),
          );
        }
        return Column(
          children: controller.selectedDates.map((date) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width * 0.63,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.light_red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            title: DateFormat('EEEE').format(date),
                            color: AppColors.primary_color,
                            size: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          const Gap(10),
                          AppText(
                            title: DateFormat('d MMMM yyyy').format(date),
                            color: AppColors.primary_color,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(13),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.light_red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // controller.removeDate(date);
                        UiUtilites.showConfirmationDialog(
                          false,
                          'Are you sure that you want\n to delete this date?'.tr,
                          onConfirm: () async {
                            // If confirmed, remove the date
                            controller.removeDate(date);
                            controller.update();
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset('assets/images/delete.svg'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
