// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/sales/sales_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:table_calendar/table_calendar.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesController>(
      autoRemove: false,
      builder: (controller) => AppLayout(
        appBarTitle: 'Sales'.tr,
        hasBgColor: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: AppText(
                    title: '     *Select date to view sales'.tr,
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(color: AppColors.light_red),
              child: TableCalendar(
                selectedDayPredicate: (day) => isSameDay(day, controller.today),
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.now(),
                focusedDay: controller.today,
                rangeStartDay: controller.rangeStart,
                rangeEndDay: controller.rangeEnd,
                rangeSelectionMode: RangeSelectionMode.enforced,
                // onDaySelected: saleController.onDaySelected,
                onRangeSelected: controller.onRangeSelected,
                rowHeight: 40,
                calendarStyle: CalendarStyle(
                  defaultTextStyle: TextStyle(color: AppColors.primary_color),
                  todayDecoration: BoxDecoration(
                      color: AppColors.primary_color.withOpacity(0.5),
                      // color: greenish,
                      shape: BoxShape.circle),
                  selectedDecoration: BoxDecoration(
                      color: AppColors.primary_color, shape: BoxShape.circle),
                  markerDecoration: BoxDecoration(
                    color: AppColors.primary_color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  rangeStartDecoration: BoxDecoration(
                      color: AppColors.primary_color, shape: BoxShape.circle),
                  rangeEndDecoration: BoxDecoration(
                      color: AppColors.primary_color, shape: BoxShape.circle),
                  rangeHighlightColor: AppColors.primary_color.withOpacity(0.3),
                  isTodayHighlighted: true,
                  outsideDaysVisible: false,
                ),
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month',
                  // CalendarFormat.week: 'Week',
                },

                headerStyle: HeaderStyle(
                  leftChevronIcon:
                      Icon(Icons.chevron_left, color: AppColors.primary_color),

                  rightChevronIcon:
                      Icon(Icons.chevron_right, color: AppColors.primary_color),

                  titleCentered: true,
                  // formatButtonVisible: false,
                  titleTextStyle: TextStyle(
                      color: AppColors.primary_color,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                onPageChanged: controller.onFormatChanged,
                calendarFormat: controller.format,
                onFormatChanged: (CalendarFormat format) {
                  setState(() {
                    // _format == CalendarFormat.week
                    //     ? size = 0.59
                    //     : size = 0.319;
                    format == CalendarFormat.week
                        ? controller.format1 = 'week'
                        : controller.format1 = 'month';
                    controller.format = format;
                    // saleController.getSlaes();
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.monday,
                daysOfWeekVisible: true,
              ),
            ),
            const Gap(20),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/salelogo.png',
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            const Gap(16),
            AppText(
              title: '${'Total orders'.tr} (${controller.totalOrders})',
              size: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary_color,
            ),
            const Gap(20),
            AppText(
              title: 'Total sales'.tr,
              size: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.darkprimary,
            ),
            const Gap(16),
            Container(
              height: 55,
              width: Get.width * 0.65,
              decoration: BoxDecoration(
                color: AppColors.light_red,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    title:
                        '${controller.totalAmount.toStringAsFixed(2)} ${'AED'.tr}',
                    size: 20,
                    color: AppColors.primary_color,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            Gap(12),
          ],
        ),
      ),
    );
  }
}
