// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/models/brand_model.dart';
import 'package:mobilegarage/models/brand_name_model.dart';
import 'package:mobilegarage/models/vehicle_model.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_view.dart';
import 'package:mobilegarage/user_app/app/my_cars/components/radio_card.dart';
import 'package:mobilegarage/user_app/app/my_cars/my_cars_controllers.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/buttons/dotted_border_button.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/components/textfields/main_input.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';
import 'package:mobilegarage/user_app/utils/ui_utils/ui_utils.dart';
import 'package:mobilegarage/vendor_app/utils/app_dropdown/app_dropdown.dart';

class MyCarsView extends StatefulWidget {
  const MyCarsView({super.key});

  @override
  State<MyCarsView> createState() => _MyCarsViewState();
}

class _MyCarsViewState extends State<MyCarsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCarsControllers>(
        builder: (controller) => Scaffold(
              // backgroundColor: AppColors.grey.shade200,
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
                      title: TopBar(
                        showicon: true,
                        showgarageicon: false,
                        title: "My Cars".tr,
                      ),
                    ),
                  )),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(color: AppColors.white),
                            child: Column(
                              children: [
                                Gap(40),
                                // Padding(
                                //   padding: const EdgeInsets.only(right: 20.0),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       SvgPicture.asset(
                                //         "assets/icons/cars.svg",
                                //         height: 17,
                                //         width: 17,
                                //       ),
                                //       Gap(6),
                                //       Text(
                                //         "Marked as default",
                                //         style: TextStyle(
                                //             fontSize: 10,
                                //             fontWeight: FontWeight.w500),
                                //       ),
                                //       Gap(7),
                                //       Text(
                                //         "white Mercedes 2022",
                                //         style: TextStyle(
                                //           fontSize: 10,
                                //           fontWeight: FontWeight.w500,
                                //           color: AppColors.grey,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                controller.uservehicles!.isNotEmpty
                                    ? ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemCount:
                                            controller.uservehicles!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final vehicle =
                                              controller.uservehicles![index];
                                          return RadioCard(
                                            ondeletetap: () {
                                              UiUtilites.DeleteAlert(
                                                  context, vehicle.vehicle_info,
                                                  () {
                                                controller
                                                    .deleteVehicles(vehicle.id);

                                                Navigator.of(context).pop();
                                              }, () {
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            userVehicles: vehicle,
                                            value: vehicle.id.toString(),
                                            groupValue:
                                                controller.selectedValue,
                                            onChanged: (value) {
                                              controller.selectedValue = value;
                                              controller.update();
                                            },
                                            addCars: vehicle,
                                            isSelected:
                                                controller.selectedValue ==
                                                    vehicle.id.toString(),
                                          );
                                        })
                                    : Text('No Car found'.tr),
                              ],
                            ),
                          ),
                          Gap(28),
                          Divider(
                            color: AppColors.grey.shade200,
                            thickness: 15,
                          ),
                          Gap(20),
                          if (controller.vehicleSections.isNotEmpty)
                            AppText(
                              title: 'Add Car details'.tr,
                              size: 26,
                              fontWeight: FontWeight.w400,
                              color: AppColors.heading_text_color,
                              fontFamily: 'Ibarra Real Nova',
                            ),
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
                                        color: AppColors.grey.shade100),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 35),
                                    child: Column(
                                      key: ValueKey(index),
                                      children: [
                                        Gap(28),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 22),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AppText(
                                                title: index == 0
                                                    ? 'Vehicle Details'.tr
                                                    : 'Vehicle ${index + 1}',
                                                size: 14,
                                                fontWeight: FontWeight.w500,
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
                                                              .primarybg),
                                                      AppText(
                                                        title: "Delete".tr,
                                                        size: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.primarybg,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Gap(36),
                                        DropDownField<VehicleModel>(
                                          displayValue: (item) =>
                                              box.read('locale') == 'ar'
                                                  ? item.arName!
                                                  : item.name!,
                                          items: controller.vehilcles,
                                          hint: 'Type of vehicle'.tr,
                                          selectedValue:
                                              section['vehicletype_id'],
                                          onChanged: (value) {
                                            controller.setSelectedVehicle(
                                                index, value);
                                            controller.validateCarFields(
                                                "vehicletype", value?.id,
                                                index: index);
                                          },
                                          errorText:
                                              errors['vehicletype'] ?? "",
                                        ),
                                        if (section['vehicletype_id'] != null &&
                                            controller.vehilcles.isNotEmpty)
                                          Gap(20),
                                        if (section['vehicletype_id'] != null &&
                                            controller.vehilcles.isNotEmpty)
                                          DropDownField<BrandModel>(
                                            displayValue: (item) =>
                                                box.read('locale') == 'ar'
                                                    ? item.arName!
                                                    : item.name,
                                            items: section['brands'] ?? [],
                                            hint: 'Brand'.tr,
                                            selectedValue:
                                                section['vehiclebrand_id'],
                                            onChanged: (value) {
                                              controller
                                                  .setSelectedVehicleBrand(
                                                      index, value);
                                              controller.validateCarFields(
                                                  "vehiclebrand", value?.id,
                                                  index: index);
                                            },
                                            errorText:
                                                errors['vehiclebrand'] ?? "",
                                          ),
                                        Gap(20),
                                        if (section['vehiclebrand_id'] !=
                                                null &&
                                            section['brandnames'] != null)
                                          Column(
                                            children: [
                                              DropDownField<BrandNameModel>(
                                                displayValue: (item) =>
                                                    box.read('locale') == 'ar'
                                                        ? item.arName ??
                                                            item.name!
                                                        : item.name!,
                                                items:
                                                    section['brandnames'] ?? [],
                                                hint: 'Brand name'.tr,
                                                selectedValue: section[
                                                    'vehiclebrandname_id'],
                                                onChanged: (value) {
                                                  controller
                                                      .setSelectedBrandName(
                                                          index, value);
                                                  controller.validateCarFields(
                                                      "vehiclebrandname",
                                                      value?.id,
                                                      index: index);
                                                  controller.update();
                                                },
                                                errorText: errors[
                                                        'vehiclebrandname'] ??
                                                    "",
                                              ),
                                              Gap(20),
                                            ],
                                          ),
                                        MainInput(
                                          hint: 'Year of manufacture'.tr,
                                          type: TextInputType.number,
                                          controller: controller
                                                  .yearOfManufactureControllers[
                                              index],
                                          onchange: (value) {
                                            section['year_of_manufacture'] =
                                                value;
                                            controller.validateCarFields(
                                              "year_of_manufacture",
                                              value,
                                              index: index,
                                            );
                                            controller.update();
                                          },
                                          errorText:
                                              errors['year_of_manufacture'] ??
                                                  "",
                                        ),
                                        Gap(20),
                                        MainInput(
                                          hint: 'Car information'.tr,
                                          controller: controller
                                              .carInfoControllers[index],
                                          onchange: (value) {
                                            section['vehicle_info'] = value;
                                            controller.validateCarFields(
                                                "vehicle_info", value,
                                                index: index);
                                          },
                                          errorText:
                                              errors['vehicle_info'] ?? "",
                                        ),
                                        Gap(42),
                                        DottedBorderButton(
                                          title: 'Upload vehicle photo'.tr,
                                          imgselect: () => controller
                                              .selectVehicleImage(index),
                                          isImgSelected:
                                              controller.isImageSelected(index),
                                          selectedimgpath: section['image'],
                                          imgRemove: () => controller
                                              .removeVehicleImage(index),
                                          errorText: controller.imgerror,
                                        ),
                                        Gap(37),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                          Gap(28),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: GestureDetector(
                              onTap: controller.addVehicleSection,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Container(
                                  height: Get.height * 0.07,
                                  width: Get.width * 0.8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColors.lightPink,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
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
                                          title: 'Add another vehicle'.tr,
                                          color: AppColors.primary,
                                          size: 11,
                                          fontWeight: FontWeight.w500,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(28),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 45.0,
                            ),
                            child: MainButton(
                              height: Get.height * 0.07,
                              title: 'Save Changes'.tr,
                              onTap: () async {
                                bool isValid = await controller
                                    .validateAllVehicleSections();
                                if (isValid) {
                                  controller.addvehicle();
                                }
                                // controller.validateAndProceed(context);

                                // UiUtilites.DeleteSuccessAlert(
                                //     context, () {}, () {});
                              },
                            ),
                          ),
                          Gap(15),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
