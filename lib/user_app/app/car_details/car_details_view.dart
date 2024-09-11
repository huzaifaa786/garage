// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mobilegarage/models/brand_model.dart';
import 'package:mobilegarage/models/brand_name_model.dart';
import 'package:mobilegarage/models/vehicle_model.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/auth/signup/signup_controller.dart';
import 'package:mobilegarage/user_app/components/buttons/dotted_border_button.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/components/textfields/main_input.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_dropdown/app_dropdown.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class CarDetailsView extends StatefulWidget {
  const CarDetailsView({super.key});

  @override
  State<CarDetailsView> createState() => _CarDetailsViewState();
}

class _CarDetailsViewState extends State<CarDetailsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.primarybg,
                toolbarHeight: 20,
                automaticallyImplyLeading: false,
              ),
              body: SafeArea(
                  child: Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(color: AppColors.primarybg),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Image.asset('assets/images/splash_logo.png'),
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 20),
                      child: SvgPicture.asset(
                        'assets/icons/mobile_garagelogo.svg',
                        color: AppColors.white,
                        height: 100,
                        width: 207,
                      ),
                    ),
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
                                  title: 'Car details',
                                  size: 32,
                                  fontWeight: FontWeight.w400,
                                  // color: AppColors.primarybg,
                                  color: AppColors.heading_text_color,
                                  fontFamily: 'Ibarra Real Nova',
                                ),
                                // Gap(15),
                                Column(
                                  children: controller.vehicleSections
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    int index = entry.key;
                                    var section = entry.value;
                                    var errors =
                                        controller.sectionErrors[index] ?? {};
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
                                                        title: index == 0
                                                            ? 'Vehicle Details'
                                                            : 'Vehicle ${index + 1}',
                                                        // 'Vehicle ${index + 1}',
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
                                              DropDownField<VehicleModel>(
                                                displayValue: (item) =>
                                                    item.name!,
                                                items: controller.vehilcles,
                                                hint: 'Type of vehicle',
                                                selectedValue:
                                                    section['vehicletype_id'],
                                                onChanged: (value) {
                                                  controller.setSelectedVehicle(
                                                      index, value);
                                                  controller.validateCarFields(
                                                      "vehicletype",
                                                      controller
                                                          .selectedVehicleId
                                                          .toString());
                                                  controller.update();
                                                },
                                                errorText:
                                                    errors['vehicletype'] ?? '',
                                              ),
                                              Gap(20),
                                              section['vehicletype_id'] !=
                                                          null &&
                                                      controller
                                                          .vehilcles.isNotEmpty
                                                  ? Column(
                                                      children: [
                                                        DropDownField<
                                                            BrandModel>(
                                                          displayValue:
                                                              (item) =>
                                                                  item.name!,
                                                          items: section[
                                                                  'brands'] ??
                                                              [],
                                                          hint: 'Car brand',
                                                          selectedValue: section[
                                                              'vehiclebrand_id'],
                                                          onChanged: (value) {
                                                            controller
                                                                .setSelectedVehicleBrand(
                                                                    index,
                                                                    value);
                                                            controller.validateCarFields(
                                                                "vehiclebrand",
                                                                controller
                                                                    .selectedVehiclebrandId
                                                                    .toString());
                                                            controller.update();
                                                          },
                                                          errorText: errors[
                                                                  'vehiclebrand'] ??
                                                              '',
                                                        ),
                                                        Gap(20),
                                                      ],
                                                    )
                                                  : Gap(0),
                                              section['vehiclebrand_id'] !=
                                                          null &&
                                                      section['brandnames'] !=
                                                          null
                                                  ? Column(
                                                      children: [
                                                        DropDownField<
                                                            BrandNameModel>(
                                                          displayValue:
                                                              (item) =>
                                                                  item.name!,
                                                          items: section[
                                                                  'brandnames'] ??
                                                              [],
                                                          hint: 'Brand name',
                                                          selectedValue: section[
                                                              'vehiclebrandname_id'],
                                                          onChanged: (value) {
                                                            controller
                                                                .setSelectedBrandName(
                                                                    index,
                                                                    value);
                                                            controller.validateCarFields(
                                                                "vehiclebrandname",
                                                                controller
                                                                    .selectedbrandNameId
                                                                    .toString());
                                                            controller.update();
                                                          },
                                                          errorText: errors[
                                                                  'vehiclebrandname'] ??
                                                              '',
                                                        ),
                                                        Gap(27),
                                                      ],
                                                    )
                                                  : Gap(0),
                                              MainInput(
                                                hint: 'Year of manufacture',
                                                controller: controller
                                                        .yearOfManufactureControllers[
                                                    index],
                                                onchange: (p0) {
                                                  section['year_of_manufacture'] =
                                                      p0;
                                                  controller.update();

                                                  errors['year_of_manufacture'] ??
                                                      '';
                                                  controller.update();
                                                },
                                                errorText: errors[
                                                        'year_of_manufacture'] ??
                                                    '',
                                              ),
                                              Gap(27),
                                              MainInput(
                                                hint: 'Car information',
                                                controller: controller
                                                    .carInfoControllers[index],
                                                onchange: (value) {
                                                  section['vehicle_info'] =
                                                      value;
                                                  controller.update();
                                                },
                                                errorText:
                                                    errors['vehicle_info'] ??
                                                        '',
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
                                                    section['image'],
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
                                      color: AppColors.lightPink,
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
                                    // onTap: () {
                                    //   Get.toNamed(AppRoutes.otp);
                                    // }
                                    onTap: () async {
                                      bool isValid =
                                          await controller.validateCarForm();
                                      if (isValid) {
                                        controller.registerUser();
                                      }
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
