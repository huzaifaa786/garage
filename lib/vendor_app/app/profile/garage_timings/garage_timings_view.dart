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
          appBarTitle: "Open time & close time".tr,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTimeSection(
                  "Morning period".tr,
                  controller.selectedTimeOpenFromMorning,
                  controller.selectedTimeCloseMorning,
                  (fromTime, toTime) {
                    if (toTime.hour < fromTime.hour ||
                        (toTime.hour == fromTime.hour &&
                            toTime.minute < fromTime.minute)) {
                      Get.snackbar(
                        'Invalid Time',
                        'Closing time cannot be before opening time.',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppColors.red,
                        colorText: AppColors.white,
                      );
                      return;
                    }
                    controller.selectedTimeOpenFromMorning = fromTime;

                    controller.selectedTimeCloseMorning = toTime;

                    controller.update();
                  },
                  isMorning: true,
                ),
                Divider(thickness: 6, color: AppColors.divider_color),
                _buildTimeSection(
                  "Night period".tr,
                  controller.selectedTimeOpenFromNight,
                  controller.selectedTimeCloseNight,
                  (fromTime, toTime) {
                    // Validate the time selection
                    if (toTime.hour < fromTime.hour ||
                        (toTime.hour == fromTime.hour &&
                            toTime.minute < fromTime.minute)) {
                      Get.snackbar(
                        'Invalid Time',
                        'Closing time cannot be before opening time.',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppColors.red,
                        colorText: AppColors.white,
                      );
                      return; // Exit if validation fails
                    }
                    controller.selectedTimeOpenFromNight = fromTime;

                    controller.selectedTimeCloseNight = toTime;

                    controller.update();
                  },
                  isMorning: false,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 50.0),
                  child: GestureDetector(
                    onTap: () {
                      controller.onSaveChanges(() {
                        isButtonPressed = true;

                        successMessage =
                            'Changes have been saved successfully'.tr;

                        Future.delayed(const Duration(seconds: 2), () {
                          isButtonPressed = false;

                          controller.update();
                        });
                      });
                    },
                    child: AppButton(
                      buttonColor:
                          isButtonPressed ? AppColors.grey : AppColors.primary,
                      title: 'Save changes'.tr,
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
                        size: 13,
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
      Function(TimeOfDay, TimeOfDay) onTimesSelected,
      {required bool isMorning}) {
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
          AppText(
            title: 'Open from'.tr,
            size: 14,
            fontWeight: FontWeight.w500,
          ),
          const Gap(8),
          buildTimeRow('From'.tr, fromTime,
              (newTime) => onTimesSelected(newTime, toTime), isMorning, true),
          const Gap(20.0),
          AppText(
            title: 'To'.tr,
            size: 14,
            fontWeight: FontWeight.w500,
          ),
          const Gap(8),
          buildTimeRow(
              'To',
              toTime,
              (newTime) => onTimesSelected(fromTime, newTime),
              isMorning,
              false),
        ],
      ),
    );
  }

// Updated method to display time in 12-hour format
  String _formatTime(TimeOfDay time) {
    final hours = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final minutes = time.minute.toString().padLeft(2, '0');
    final period = time.hour < 12 ? 'AM'.tr : 'PM'.tr;
    return "$hours:$minutes $period";
  }

  Widget buildTimeRow(String label, TimeOfDay selectedTime,
      Function(TimeOfDay) onTimeSelected, bool isMorning, bool isFromTime) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: GestureDetector(
            onTap: () async {
              final TimeOfDay? newTime = await showTimePicker(
                cancelText: 'Cancel'.tr,
                confirmText: 'Ok'.tr,
                errorInvalidText: 'Enter a valid time'.tr,
                helpText: 'Select time'.tr,
                context: Get.context!,
                initialTime: selectedTime,
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      primaryColor: AppColors.primary_color,
                      timePickerTheme: TimePickerThemeData(
                        dialHandColor: AppColors.primary_color,
                        dialBackgroundColor: Colors.transparent,
                        hourMinuteColor: AppColors.primary_color,
                        dayPeriodColor: AppColors.primary_color,
                      ),
                      colorScheme: ColorScheme.fromSwatch().copyWith(
                        primary: AppColors.primary_color,
                        secondary: AppColors.white,
                        onPrimary: Colors.white,
                        onSecondary: Colors.white,
                      ),
                    ),
                    child: child!,
                  );
                },
              );

              if (newTime != null) {
                onTimeSelected(newTime);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.grey[100],
                borderRadius: BorderRadius.circular(3),
              ),
              child: Center(
                child: AppText(
                  title: _formatTime(selectedTime),
                  color: AppColors.black,
                  size: 10,
                  fontWeight: FontWeight.w500,
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
                _buildAmPmButton('AM'.tr, selectedTime.hour < 12),
                const Gap(5),
                _buildAmPmButton('PM'.tr, selectedTime.hour >= 12),
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
        color: isSelected ? AppColors.primary : AppColors.grey[200],
      ),
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 13),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: isSelected ? AppColors.white : AppColors.grey[600],
        ),
      ),
    );
  }
}
