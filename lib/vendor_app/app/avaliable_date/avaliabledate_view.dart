import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/avaliable_date/components/selected_date.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:mobilegarage/vendor_app/app/avaliable_date/avaliabledate_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class AvaliableDateView extends StatefulWidget {
  const AvaliableDateView({super.key});

  @override
  State<AvaliableDateView> createState() => _AvaliableDateViewState();
}

class _AvaliableDateViewState extends State<AvaliableDateView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AvaliableDateController>(
      autoRemove: false,
      builder: (controller) => AppLayout(
        appBarTitle: 'Edit unavailable dates'.tr,
        hasBgColor: false,
        hasShadow: true,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      title: '*Select date to mark as unavailable'.tr,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary_color,
                    )
                  ],
                ),
                const Gap(24),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.light_red,
                      borderRadius: BorderRadius.circular(2)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCalendar(
                      // availableGestures: AvailableGestures.none,
                      firstDay: DateTime.now(),
                      lastDay: DateTime.now().add(Duration(days: 365 * 2)),
                      focusedDay: controller.focusedDay,
                      selectedDayPredicate: (day) => controller.isSelected(day),
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Month',
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        bool isDateSelected =
                            controller.selectedDates.contains(selectedDay);
                        String alertMessage = isDateSelected
                            ? 'Are you sure that you want\n to delete this date?'
                                .tr
                            : 'Are you sure that you want\n to add this date?'
                                .tr;
                        UiUtilites.showConfirmationDialog(
                          false,
                          alertMessage,
                          onConfirm: () async {
                            controller.onDaySelected(selectedDay, focusedDay);
                            controller.update();
                          },
                        );
                      },

                      // controller.onDaySelected,
                      onPageChanged: (focusedDay) {
                        controller.focusedDay = focusedDay;
                      },
                      calendarFormat: controller.format,
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                            color: AppColors.primary_color.withOpacity(0.5),
                            shape: BoxShape.circle),
                        selectedDecoration: BoxDecoration(
                            color: AppColors.primary_color,
                            shape: BoxShape.circle),
                        markerDecoration: BoxDecoration(
                          color: AppColors.primary_color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      headerStyle: HeaderStyle(
                        leftChevronIcon: Container(
                          decoration: const BoxDecoration(),
                          child: Icon(
                            Icons.chevron_left,
                            color: AppColors.primary_color,
                          ),
                        ),
                        rightChevronIcon: Container(
                          decoration: const BoxDecoration(),
                          child: Icon(
                            Icons.chevron_right,
                            color: AppColors.primary_color,
                          ),
                        ),
                        titleCentered: true,
                        titleTextStyle: TextStyle(
                            color: AppColors.primary_color,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Column(
                    children: [
                      controller.selectedDates.isNotEmpty
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 49, right: 49),
                                  child: AppText(
                                    title: 'Unavailable dates'.tr,
                                    color: AppColors.primary_color,
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                      const Gap(13),
                      const SelectedDate(),
                      // const Gap(20),
                      // AppButton(
                      //   buttonWidth: 0.8,
                      //   title: controller.isButtonClicked
                      //       ? 'Confirm'.tr
                      //       : 'Confirm'.tr,
                      //   titleColor: controller.isButtonClicked
                      //       ? AppColors.green_color
                      //       : AppColors.white_color,
                      //   buttonColor: controller.isButtonClicked
                      //       ? AppColors.divider_color
                      //       : AppColors.primary_color,
                      //   suffixWidget: controller.isButtonClicked
                      //       ? Padding(
                      //           padding:
                      //               const EdgeInsets.symmetric(horizontal: 8),
                      //           child: SvgPicture.asset(
                      //               'assets/images/checkcircle.svg'),
                      //         )
                      //       : const Gap(1),
                      //   ontap: () {
                      //     controller.onconfirm();
                      //   },
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
