// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/profile/garage_timings/garage_timings_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';
import 'package:mobilegarage/vendor_app/utils/app_button/app_button.dart';

class GarageTimingsView extends StatelessWidget {
  const GarageTimingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GarageTimingsController>(
      autoRemove: false,
      builder: (controller) {
        bool isButtonPressed = false;
        String successMessage = '';

        return AppLayout(
          appBarTitle: "Open time & close time",
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTimeSection(
                  "Morning period",
                  controller.selectedTimeOpenFrom,
                  controller.selectedTimeOpenTo,
                  (fromTime, toTime) {
                    controller.selectedTimeOpenFrom = fromTime;
                    controller.selectedTimeOpenTo = toTime;
                    controller.update(); // Update the state
                  },
                ),
                Divider(thickness: 6, color: AppColors.divider_color),
                _buildTimeSection(
                  "Night period",
                  controller.selectedTimeClosedFrom,
                  controller.selectedTimeClosedTo,
                  (fromTime, toTime) {
                    controller.selectedTimeClosedFrom = fromTime;
                    controller.selectedTimeClosedTo = toTime;
                    controller.update(); // Update the state
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 50.0),
                  child: GestureDetector(
                    onTap: () {
                      controller.onSaveChanges(() {
                        isButtonPressed = true;
                        successMessage = 'Changes have been saved successfully';
                        Future.delayed(const Duration(seconds: 2), () {
                          isButtonPressed = false;
                          controller.update();
                        });
                      });
                    },
                    child: AppButton(
                      buttonColor:
                          isButtonPressed ? AppColors.grey : AppColors.primary,
                      title: 'Save changes',
                      textColor:
                          isButtonPressed ? AppColors.primary : AppColors.white,
                    ),
                  ),
                ),
                if (isButtonPressed)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        title: successMessage,
                        color: AppColors.green_color,
                        size: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      const Gap(5),
                      SvgPicture.asset('assets/images/checkcircle.svg'),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTimeSection(String title, TimeOfDay fromTime, TimeOfDay toTime,
      Function(TimeOfDay, TimeOfDay) onTimesSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: title,
            size: 16,
            fontWeight: FontWeight.w600,
          ),
          const Gap(20.0),
          const AppText(
            title: 'Open from',
            size: 14,
            fontWeight: FontWeight.w500,
          ),
          const Gap(8),
          buildTimeRow('From', fromTime, onTimesSelected, true),
          const Gap(20.0),
          const AppText(
            title: 'To',
            size: 14,
            fontWeight: FontWeight.w500,
          ),
          const Gap(8),
          buildTimeRow('To', toTime, onTimesSelected, false),
        ],
      ),
    );
  }

  Widget buildTimeRow(String label, TimeOfDay selectedTime,
      Function(TimeOfDay, TimeOfDay) onTimesSelected, bool isFromTime) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: GestureDetector(
            onTap: () async {
              final TimeOfDay? newTime = await showTimePicker(
                context: Get.context!,
                initialTime: selectedTime,
              );
              if (newTime != null) {
                if (isFromTime) {
                  onTimesSelected(newTime, selectedTime);
                } else {
                  onTimesSelected(selectedTime, newTime);
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.grey[100],
                borderRadius: BorderRadius.circular(3),
              ),
              child: Center(
                child: Text(
                  selectedTime.format(Get.context!),
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: AppColors.grey[100],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildAmPmButton('AM', selectedTime.period == DayPeriod.am),
                const Gap(5),
                _buildAmPmButton('PM', selectedTime.period == DayPeriod.pm),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAmPmButton(String label, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: isSelected ? AppColors.primary : Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w500,
          color: isSelected ? AppColors.white : AppColors.black,
        ),
      ),
    );
  }
}
