// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/book_service/book_service_controller.dart';
import 'package:mobilegarage/user_app/app/book_service/components/seller_card.dart';
import 'package:mobilegarage/user_app/app/book_service/components/servicesTypesCard.dart';
import 'package:mobilegarage/user_app/app/home/components/banner_card.dart';
import 'package:mobilegarage/user_app/app/order/components/vehicle_listTile.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

class BookServiceView extends StatefulWidget {
  const BookServiceView({super.key});

  @override
  State<BookServiceView> createState() => _BookServiceViewState();
}

class _BookServiceViewState extends State<BookServiceView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookServiceController>(
        autoRemove: false,
        builder: (controller) => Scaffold(
              backgroundColor: AppColors.grey.withOpacity(0.2),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(95.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [appbarShadow],
                  ),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    scrolledUnderElevation: 0.0,
                    toolbarHeight: 95.0,
                    title: TopBar(
                      title: 'Street Garage',
                      showtrailingicon: true,
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, -2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: BottomAppBar(
                  height: Get.height * 0.135,
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Gap(25),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                  title: 'Total price:',
                                  fontWeight: FontWeight.w500,
                                  size: 12,
                                  color: AppColors.grey,
                                ),
                                Gap(5),
                                AppText(
                                  title: '70.50 AED',
                                  fontWeight: FontWeight.w600,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                          Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.payments);
                                },
                                child: Container(
                                  height: Get.height * 0.07,
                                  width: Get.width * 0.4,
                                  // decoration: BoxDecoration(
                                  //   boxShadow: buttonShadow,
                                  //   // color: AppColors.primary,
                                  //   borderRadius: BorderRadius.circular(radius!),
                                  // ),
                                  decoration: ShapeDecoration(
                                    color: AppColors.primarybg,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(45),
                                        side: BorderSide.none),
                                    // shadows: buttonShadow,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.done_all_rounded,
                                        color: AppColors.white,
                                        size: 20,
                                      ),
                                      Gap(5),
                                      AppText(
                                        title: 'Book Service',
                                        color: AppColors.white,
                                        size: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Gap(10),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 65,
                                  width: 65,
                                  // decoration: BoxDecoration(
                                  //   boxShadow: buttonShadow,
                                  //   // color: AppColors.primary,
                                  //   borderRadius: BorderRadius.circular(radius!),
                                  // ),
                                  decoration: ShapeDecoration(
                                    color: AppColors.primarybg,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(45),
                                        side: BorderSide.none),
                                    // shadows: buttonShadow,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/cart_white.svg',
                                        height: 20,
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Gap(10),
                    ],
                  ),
                ),
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: Get.height * 0.49,
                      color: AppColors.white,
                      child: Column(
                        children: [
                          CarouselSlider.builder(
                            itemCount: 5,
                            itemBuilder: (context, index, realIndex) {
                              return BannerCard(
                                picture: 'https://dummyimage.com/70x70/000/fff',
                                isRectangle: true,
                                onTap: () {
                                  print('object');
                                },
                              );
                            },
                            options: CarouselOptions(
                              height: Get.height * 0.28,
                              enableInfiniteScroll: true,
                              autoPlay: false,
                              viewportFraction: 0.9,
                              enlargeCenterPage: false,
                              initialPage: controller.carouselIndex,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  controller.updateCarouselIndex(index);
                                });
                              },
                            ),
                          ),
                          Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SmoothPageIndicator(
                                controller: PageController(),
                                count: 5,
                                axisDirection: Axis.horizontal,
                                effect: ColorTransitionEffect(
                                    dotHeight: 5,
                                    dotWidth: 5,
                                    activeDotColor: AppColors.primary,
                                    dotColor: AppColors.lightprimary),
                              ),
                            ],
                          ),
                          Gap(11),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 45.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      title: 'Car washing',
                                      fontWeight: FontWeight.w600,
                                      size: 14,
                                    ),
                                    AppText(
                                      title: '45' + ' AED',
                                      fontWeight: FontWeight.w600,
                                      size: 14,
                                      color: AppColors.darkblue,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gap(10),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/clock.svg'),
                                        Gap(5),
                                        AppText(
                                          title: '30 min',
                                          fontWeight: FontWeight.w400,
                                          size: 11,
                                          color: AppColors.primary,
                                        ),
                                      ],
                                    ),
                                    Gap(30),
                                    AppText(
                                      title: 'Description',
                                      fontWeight: FontWeight.w500,
                                      size: 13,
                                    ),
                                    Gap(5),
                                    SizedBox(
                                      width: Get.width * 0.75,
                                      child: AppText(
                                        title:
                                            'We provide all car wash types and we make sure to take care of your car,We provide all car wash types and we make sure to take care of your car',
                                        fontWeight: FontWeight.w400,
                                        // maxLines: 4,
                                        // overFlow: TextOverflow.ellipsis,
                                        size: 11,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(7),
                    Container(
                      height: Get.height * 0.15,
                      width: Get.width,
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(16),
                            AppText(
                              title: 'Seller',
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackgrey,
                              size: 13,
                            ),
                            Gap(12),
                            SellerCard(
                              garageName: 'Street Garage',
                              image: 'https://dummyimage.com/70x70/000/fff',
                              ontap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(7),
                    Container(
                      // height: Get.height * 0.15,
                      width: Get.width,
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(30),
                            AppText(
                              title: 'Type of service',
                              fontWeight: FontWeight.w600,
                              size: 13,
                            ),
                            Gap(12),
                            GridView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing:6.0,
                                mainAxisSpacing: 6.0,
                              ),
                              itemCount: controller.services.length,
                              itemBuilder: (context, index) {
                                final service = controller.services[index];
                                bool isSelected =
                                    controller.selectedServiceIndex == index;

                                return ServicesTypesCard(
                                  serviceName: service['name']!,
                                  price: service['price']!,
                                  isSelected: isSelected,
                                  onChanged: (value) {
                                    controller.selectService(index);
                                  },
                                );
                              },
                            ),
                            Gap(30),
                            AppText(
                              title: 'Time',
                              fontWeight: FontWeight.w600,
                              size: 13,
                            ),
                            Gap(30),
                            TimePickerSpinnerPopUp(
                              mode: CupertinoDatePickerMode.time,
                              initTime: DateTime.now(),
                              minTime: DateTime.now()
                                  .subtract(const Duration(days: 1)),
                              maxTime:
                                  DateTime.now().add(const Duration(days: 1)),
                              confirmTextStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black),
                              cancelTextStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black),
                              minuteInterval: 1,
                              use24hFormat: false,
                              isCancelTextLeft: true,
                              padding:
                                  const EdgeInsets.fromLTRB(12, 10, 12, 10),
                              cancelText: 'Cancel',
                              confirmText: 'OK',
                              enable: true,
                              radius: 10,
                              pressType: PressType.singlePress,
                              timeFormat: 'HH:mm',
                              locale: const Locale('en'),
                              onChange: (dateTime) {
                                // Implement your logic with selected dateTime
                              },
                            ),
                            Gap(30),
                            AppText(
                              title: 'Date',
                              fontWeight: FontWeight.w600,
                              size: 13,
                            ),
                            Gap(30),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: AppColors.grey.withOpacity(0),
                            ),
                            child: TableCalendar(
                              firstDay: DateTime.utc(2023, 1, 1),
                              lastDay: DateTime.now(),
                              focusedDay: DateTime.now(),
                              calendarFormat: CalendarFormat.month,
                              startingDayOfWeek: StartingDayOfWeek.monday,

                              // Removed range selection and custom onDaySelected logic for simplicity
                              // onDaySelected: (selectedDay, focusedDay) {
                              //   controller.onDaySelected(
                              //       selectedDay, focusedDay);
                              // },

                              // Simplified header style
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

                              // Simplified calendar style
                              calendarStyle: CalendarStyle(
                                todayDecoration: BoxDecoration(
                                  color: AppColors
                                      .primarybg, // Today's date background color
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

                              // Removed custom calendar builders and format changing logic
                              availableCalendarFormats: const {
                                CalendarFormat.month: 'Month',
                              },

                              // // Removed page change logic for simplicity
                              // onPageChanged: (focusedDay) {
                              //   controller.onFormatChanged(
                              //       focusedDay); // Keep if needed
                              // },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(30),
                    Container(
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(16),
                            AppText(
                              title: 'Select vehicle',
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackgrey,
                              size: 13,
                            ),
                            Gap(12),
                            SizedBox(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.carNames.length,
                                itemBuilder: (context, index) {
                                  final name = controller.carNames[index];
                                  return VehicleListTile(
                                    value: name,
                                    groupValue: controller.selectedCarName,
                                    onChanged: (value) {
                                      controller.selectCar(value!);
                                    },
                                    iconPath: 'assets/icons/vehicle.svg',
                                    text: name,
                                    
                                  );
                                },
                              ),
                            ),
                            Gap(50),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ));
  }
}
