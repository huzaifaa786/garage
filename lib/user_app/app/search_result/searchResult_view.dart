// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_view.dart';
import 'package:mobilegarage/user_app/app/search_result/components/radioButton.dart';
import 'package:mobilegarage/user_app/app/search_result/searchResult_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/helper/permission.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';
import 'package:table_calendar/table_calendar.dart';

class SearchresultView extends StatefulWidget {
  const SearchresultView({super.key});

  @override
  State<SearchresultView> createState() => _SearchresultViewState();
}

class _SearchresultViewState extends State<SearchresultView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchResultController>(
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [appbarShadow],
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0.0,
              toolbarHeight: 95.0,
              title: TopBar(title: 'Date & Time'.tr),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(30),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/clock.svg',
                        color: AppColors.black,
                      ),
                      Gap(10),
                      AppText(
                        title: 'Delivery Time'.tr,
                        size: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                Gap(10),
                ColumnRadioTile(),
                Gap(30),
                Container(
                  color: AppColors.lightgrey,
                  child: TableCalendar(
                    availableGestures: AvailableGestures.horizontalSwipe,
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(Duration(days: 365)),
                    focusedDay: DateTime.now(),
                    calendarFormat: CalendarFormat.month,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primarybg,
                      ),
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: AppColors.primarybg,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: AppColors.primarybg,
                      ),
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      controller.selectDate(selectedDay);
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(day, controller.selectedDate);
                    },
                    calendarStyle: CalendarStyle(
                      // isTodayHighlighted: false,
                      todayDecoration: BoxDecoration(
                        color: AppColors.primarybg
                            .withOpacity(0.4), // Today's date background color
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: AppColors
                            .primarybg, // Selected date background color
                        shape: BoxShape.circle,
                      ),
                      weekendTextStyle: TextStyle(
                        color: Colors.black, // Weekend text color
                      ),
                      defaultTextStyle: TextStyle(
                        color: Colors.black, // Default text color
                      ),
                      outsideDaysVisible: false, // Hide outside days
                    ),
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Month',
                    },
                  ),
                ),
                Gap(30),
                Row(
                  children: [
                    Gap(20),
                    SvgPicture.asset(
                      "assets/icons/map_pin.svg",
                    ),
                    Gap(10),
                    AppText(
                      title: 'Select location '.tr,
                      size: 13,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    if (await getLocationPermission() == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlacePicker(
                            apiKey: "AIzaSyASCMQagE0IHqYPiniGuCf-_jh5XHlwMy8",
                            onPlacePicked: (result) {
                              controller.currentAddress =
                                  result.formattedAddress!;
                              controller.lat = result.geometry!.location.lat;
                              controller.lng = result.geometry!.location.lng;
                              controller.update();
                              Navigator.of(context).pop();
                            },
                            initialPosition: LatLng(
                                controller.currentPosition != null
                                    ? controller.currentPosition!.latitude
                                    : 25.1972,
                                controller.currentPosition != null
                                    ? controller.currentPosition!.longitude
                                    : 55.2744),
                            useCurrentLocation: true,
                            resizeToAvoidBottomInset: false,
                          ),
                        ),
                      );
                    }
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/map_image.png',
                      ),
                      Positioned(
                        left: Get.width * 0.1,
                        right: Get.width * 0.1,
                        top: Get.height * 0.12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              height: Get.height * 0.06,
                              width: Get.width * 0.9 / 0.2,
                              decoration: BoxDecoration(
                                color: AppColors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: AppColors.lightPink,
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/icons/map_pin.svg",
                                      color: AppColors.primarybg,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  Gap(5),
                                  controller.currentAddress == ""
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            AppText(
                                              title:
                                                  "Select location on Google map"
                                                      .tr,
                                              size: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        )
                                      : Flexible(
                                          child: AppText(
                                            title: controller.currentAddress,
                                            size: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                  Gap(30),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20.0),
                                        child: SvgPicture.asset(
                                          box.read('locale') != 'ar'
                                              ? "assets/icons/arrow_rightside.svg"
                                              : 'assets/icons/arrow_leftside.svg',
                                          color: AppColors.primarybg,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: MainButton(
                    height: Get.height * 0.077,
                    title: 'Payment'.tr,
                    onTap: () {
                      controller.checkDate();
                    },
                  ),
                ),
                Gap(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
