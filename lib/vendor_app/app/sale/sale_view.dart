// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/sale/sale_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:table_calendar/table_calendar.dart';

class SaleView extends StatefulWidget {
  const SaleView({super.key});

  @override
  State<SaleView> createState() => _SaleViewState();
}

class _SaleViewState extends State<SaleView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaleController>(
        autoRemove: false,
        builder: (controller) => AppLayout(
              appBarTitle: 'Sale',
              hasBgColor: false,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: AppText(
                          title: '     *Select date to view sales',
                          size: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(color: AppColors.light_red),
                    child: TableCalendar(
                      selectedDayPredicate: (day) =>
                          isSameDay(day, controller.today),
                      firstDay: DateTime.utc(2023, 1, 1),
                      lastDay: DateTime.now(),
                      focusedDay: controller.today,
                      rangeStartDay: controller.rangeStart,
                      rangeEndDay: controller.rangeEnd,
                      rangeSelectionMode: RangeSelectionMode.enforced,
                      // onDaySelected: saleController.onDaySelected,
                      onRangeSelected: controller.onRangeSelected,
                      calendarStyle: CalendarStyle(
                        defaultTextStyle:
                            TextStyle(color: AppColors.primary_color),
                        todayDecoration: BoxDecoration(
                            color: AppColors.primary_color.withOpacity(0.5),
                            // color: greenish,
                            shape: BoxShape.circle),
                        selectedDecoration: BoxDecoration(
                            color: AppColors.primary_color,
                            shape: BoxShape.circle),
                        markerDecoration: BoxDecoration(
                          color: AppColors.primary_color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        rangeStartDecoration: BoxDecoration(
                            color: AppColors.primary_color,
                            shape: BoxShape.circle),
                        rangeEndDecoration: BoxDecoration(
                            color: AppColors.primary_color,
                            shape: BoxShape.circle),
                        rangeHighlightColor:
                            AppColors.primary_color.withOpacity(0.5),
                        isTodayHighlighted: true,
                        outsideDaysVisible: false,
                      ),
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Month',
                        // CalendarFormat.week: 'Week',
                      },

                      headerStyle: HeaderStyle(
                        leftChevronIcon: Icon(Icons.chevron_left,
                            color: AppColors.primary_color),

                        rightChevronIcon: Icon(Icons.chevron_right,
                            color: AppColors.primary_color),

                        titleCentered: true,
                        // formatButtonVisible: false,
                        titleTextStyle: TextStyle(
                            color: AppColors.primary_color,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      onPageChanged: controller.onFormatChanged,
                      calendarFormat: controller.format,
                      onFormatChanged: (CalendarFormat _format) {
                        setState(() {
                          // _format == CalendarFormat.week
                          //     ? size = 0.59
                          //     : size = 0.319;
                          _format == CalendarFormat.week
                              ? controller.format1 = 'week'
                              : controller.format1 = 'month';
                          controller.format = _format;
                          // saleController.getSlaes();
                        });
                      },
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      daysOfWeekVisible: true,
                    ),
                  ),
                  Gap(10),
                  Image.asset('assets/images/sale.png'),
                  Gap(10),
                  AppText(
                    title: 'Total sales',
                    size: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  Gap(20),
                  Container(
                    height: 60,
                    width: Get.width * 0.65,
                    decoration: BoxDecoration(
                      color: AppColors.light_red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          title: '00.00' + 'AED',
                          size: 20,
                          color: AppColors.primary_color,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
