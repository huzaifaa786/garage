// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/components/buttons/dotted_border_button.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/components/textfields/main_input.dart';
import 'package:mobilegarage/user_app/components/textfields/main_input_dropdown.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/app/car_details/car_details_controller.dart';

class CarDetailsView extends StatefulWidget {
  const CarDetailsView({super.key});

  @override
  State<CarDetailsView> createState() => _CarDetailsViewState();
}

class _CarDetailsViewState extends State<CarDetailsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarDetailsController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.primarybg,
                toolbarHeight: 20,
              ),
              body: SafeArea(
                  child: Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(color: AppColors.primarybg),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/splash_logo.png'),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                        ),
                        child: Container(
                          height: Get.height * 0.741,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Gap(37),
                                AppText(
                                  title: 'Car Details',
                                  size: 32,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primarybg,
                                ),
                                // Gap(15),
                                Column(
                                  children: controller.vehicleSections
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    int index = entry.key;
                                    var section = entry.value;
                                    return Column(
                                      key: ValueKey(index),
                                      children: [
                                        if (index != 0)
                                          Divider(
                                            thickness: 14,
                                            color: AppColors.grey.shade100,
                                          ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 35,
                                          ),
                                          child: Column(
                                            key: ValueKey(index),
                                            children: [
                                              Gap(28),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 22),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    if (index != 0)
                                                      AppText(
                                                        title:
                                                            'Vehicle ${index + 1}',
                                                        size: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    if (index != 0)
                                                      GestureDetector(
                                                        onTap: () => controller
                                                            .removeVehicleSection(
                                                                index),
                                                        child: Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              "assets/icons/delete.svg",
                                                              color: AppColors
                                                                  .primarybg,
                                                            ),
                                                            AppText(
                                                              title: "Delete",
                                                              size: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .primarybg,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Gap(36),
                                              MainInputDropdown(
                                                hint: "Type of vehicle",
                                                controller: section[
                                                    'typeOfVehicleController'],
                                                errorText: "",
                                                onchange: (value) {},
                                                items: controller.city,
                                              ),
                                              Gap(27),
                                              MainInputDropdown(
                                                hint: "Car brand",
                                                controller: section[
                                                    'carBrandController'],
                                                errorText: "",
                                                onchange: (value) {},
                                                items: controller.brands,
                                              ),
                                              Gap(27),
                                              MainInputDropdown(
                                                hint: "Brand name",
                                                controller: section[
                                                    'brandNameController'],
                                                errorText: "",
                                                onchange: (value) {
                                                  section['brandNameController']
                                                      .text = value;
                                                },
                                                items: controller.city,
                                              ),
                                              Gap(27),
                                              MainInput(
                                                hint: 'Year of manufacture',
                                                controller: section[
                                                    'yearOfManufactureController'],
                                                errorText: '',
                                              ),
                                              Gap(27),
                                              MainInput(
                                                hint: 'Car information',
                                                controller: section[
                                                    'carInformationController'],
                                                errorText: '',
                                              ),
                                              Gap(42),
                                              DottedBorderButton(
                                                title:
                                                    'Upload vehicle photo'.tr,
                                                imgselect: () => controller
                                                    .selectVehicleImage(index),
                                                isImgSelected: controller
                                                    .isImageSelected(index),
                                                selectedimgpath:
                                                    section['vehicleImage'],
                                                imgRemove: () => controller
                                                    .removeVehicleImage(index),
                                              ),
                                              Gap(37),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                                GestureDetector(
                                  onTap: controller.addVehicleSection,
                                  child: Container(
                                    height: Get.height * 0.1 / 1.9,
                                    width: Get.width * 0.6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: AppColors.lightprimary,
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: AppColors.primary),
                                            child: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: AppColors.white,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                          Gap(10),
                                          AppText(
                                            title: 'Add another vehicle',
                                            color: AppColors.primary,
                                            size: 11,
                                            fontWeight: FontWeight.w500,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(71),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 34),
                                  child: MainButton(
                                    title: 'Continue',
                                    txtweight: FontWeight.w600,
                                    onTap: () {
                                      Get.toNamed(AppRoutes.otp);
                                    },
                                  ),
                                ),
                                Gap(20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ));
  }
}
