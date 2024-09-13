// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/order/components/vehicle_listTile.dart';
import 'package:mobilegarage/user_app/app/order/order_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/components/filter_bottomsheet/filter_bottomsheet.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';
import 'package:mobilegarage/user_app/utils/ui_utils/ui_utils.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

int activeStep = 0;

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        autoRemove: false,
        builder: (controller) => Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [appbarShadow],
                  ),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    scrolledUnderElevation: 0.0,
                    toolbarHeight: 95.0,
                    title: TopBar(
                      showicon: true,
                      showgarageicon: false,
                      title: 'Find Service',
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(right: 15, left: 25),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                  FilterBottomsheet(),
                                  isScrollControlled: true,
                                );
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    // color: AppColors.lightprimary,
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.lightPink),
                                child: SvgPicture.asset(
                                  'assets/icons/filter.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            Gap(10),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              child: AppText(
                                title: 'Filter By',
                                fontWeight: FontWeight.w600,
                                size: 16.0,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        Gap(19),
                        AppText(
                          title: 'Price Range',
                          size: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        Gap(28),
                        Text(
                          controller.start.toStringAsFixed(2) +
                              " - " +
                              controller.end.toStringAsFixed(2) +
                              " AED",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gap(10),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: AppColors.primary,
                            inactiveTrackColor: AppColors.darkGrey,
                            trackHeight: 1.0,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 10.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 10.0),
                          ),
                          child: RangeSlider(
                            values:
                                RangeValues(controller.start, controller.end),
                            labels: RangeLabels(
                              controller.start.toString(),
                              controller.end.toString(),
                            ),
                            onChanged: (value) {
                              setState(() {
                                controller.start = value.start;
                                controller.end = value.end;
                              });
                            },
                            min: 0.0,
                            max: 80.0,
                          ),
                        ),

                        Gap(36),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/vehicle.svg',
                                  height: 20,
                                  width: 20,
                                ),
                                Gap(8),
                                AppText(
                                  title: 'Choose your vehicle ',
                                  fontWeight: FontWeight.w600,
                                  size: 12,
                                ),
                              ],
                            ),
                            Gap(8),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.vehiclesList.length,
                              itemBuilder: (context, index) {
                                final vehical = controller.vehiclesList[index];
                                return VehicleListTile(
                                    value: vehical.id.toString(),
                                    groupValue: vehical.id.toString(),
                                    onChanged: (value) {
                                      controller.selectCar(value!);
                                    },
                                    iconPath: 'assets/icons/vehicle.svg',
                                    text: vehical.vehicle_info!);
                              },
                            ),
                            Gap(30),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/garage_logo.svg',
                                  height: 20,
                                  width: 20,
                                ),
                                Gap(5),
                                AppText(
                                  title: 'What do you prefer?',
                                  fontWeight: FontWeight.w600,
                                  size: 12,
                                ),
                              ],
                            ),
                            Gap(8),
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'Select garage',
                                  groupValue: controller.selectedgarageName,
                                  onChanged: (value) {
                                    controller.selectGarage(value!);
                                  },
                                  fillColor: MaterialStatePropertyAll(
                                      AppColors.primarybg),
                                ),
                                SvgPicture.asset(
                                  'assets/icons/garage_logo.svg',
                                  color: AppColors.primarybg,
                                  height: 20,
                                  width: 20,
                                ),
                                Gap(10),
                                Text(
                                  'Select garage',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primarybg,
                                  ),
                                ),
                              ],
                            ),
                            Gap(22),
                            Row(
                              children: [
                                Radio<String>(
                                  value:
                                      'Send to all garages', // Updated to match the correct value
                                  groupValue: controller.selectedgarageName,
                                  onChanged: (value) {
                                    controller.selectGarage(value!);
                                  },
                                  fillColor: MaterialStatePropertyAll(
                                      AppColors.primarybg),
                                ),
                                Image.asset(
                                  'assets/images/all_garage.png',
                                  color: AppColors.primarybg,
                                  height: 30,
                                  width: 30,
                                ),
                                Gap(10),
                                Text(
                                  'Send to all garages',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primarybg,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   width: Get.width,
                        //   child: StepperListView(
                        //       shrinkWrap: true,
                        //       physics: BouncingScrollPhysics(),
                        //       showStepperInLast: true,
                        //       stepperThemeData: StepperThemeData(
                        //         lineColor: AppColors.primary,
                        //         lineWidth: 1,
                        //       ),
                        //       stepperData: controller.stepperData,
                        //       stepAvatar: (_, data) {
                        //         return PreferredSize(
                        //           preferredSize: Size.fromRadius(3),
                        //           child: Container(
                        //             height: 6,
                        //             width: 6,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(10),
                        //               color: AppColors.primarybg,
                        //             ),
                        //           ),
                        //         );
                        //       },
                        //       stepContentWidget: (context, value) {
                        //         return value.content;
                        //       }),
                        // ),
                        Gap(40),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: MainButton(
                            title: 'Next',
                            height: Get.height * 0.07,
                            fontsize: 12,
                            onTap: () {
                              Get.toNamed(AppRoutes.acceptedorder);
                              UiUtilites.successAlertDialog(
                                  context: context,
                                  onTap: () {
                                    Get.toNamed(AppRoutes.home);
                                  },
                                  title: 'Thank you!',
                                  description:
                                      'A garage will accept your order from within 3-5 min.');
                            },
                          ),
                        ),
                        Gap(40),
                      ]),
                ),
              ),
            ));
  }
}
