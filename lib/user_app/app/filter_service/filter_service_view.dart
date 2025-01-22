// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/models/battery_models/ampere_model.dart';
import 'package:mobilegarage/models/battery_models/origin_model.dart';
import 'package:mobilegarage/models/battery_models/product_type_model.dart';
import 'package:mobilegarage/models/battery_models/voltage_model.dart';
import 'package:mobilegarage/models/brand_model.dart';
import 'package:mobilegarage/models/oil_models/extra_model.dart';
import 'package:mobilegarage/models/oil_models/product_type_model.dart';
import 'package:mobilegarage/models/oil_models/volume_model.dart';
import 'package:mobilegarage/models/tyre_models/height_model.dart';
import 'package:mobilegarage/models/tyre_models/origin_model.dart';
import 'package:mobilegarage/models/tyre_models/pattern_model.dart';
import 'package:mobilegarage/models/tyre_models/size_model.dart';
import 'package:mobilegarage/models/tyre_models/speed_rating_model.dart';
import 'package:mobilegarage/models/tyre_models/width_model.dart';
import 'package:mobilegarage/user_app/app/filter_service/components/vehicle_listTile.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';
import 'package:mobilegarage/vendor_app/utils/app_dropdown/app_dropdown.dart';

class FilterServiceView extends StatefulWidget {
  const FilterServiceView({super.key});

  @override
  State<FilterServiceView> createState() => _FilterServiceViewState();
}

int activeStep = 0;
GetStorage box = GetStorage();

class _FilterServiceViewState extends State<FilterServiceView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterServiceController>(
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
                    title: 'Find Service'.tr,
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
                            // Get.bottomSheet(
                            //   FilterBottomsheet(),
                            //   isScrollControlled: true,
                            // );
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
                            title: 'Filter By'.tr,
                            fontWeight: FontWeight.w600,
                            size: 16.0,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    Gap(19),
                    AppText(
                      title: 'Price Range'.tr,
                      size: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    Gap(28),
                    Text(
                      "${controller.start.toStringAsFixed(2)} - ${controller.end.toStringAsFixed(2)} ${'AED'.tr}",
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
                        values: RangeValues(controller.start, controller.end),
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
                        max: 1000.0,
                      ),
                    ),
                    Gap(25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: AppText(
                        title: '*All boxes are optional'.tr,
                        size: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ),
                    if (![4, 7, 9, 8, 1]
                        .contains(int.parse(controller.categoryId.toString())))
                      Column(
                        children: [
                          Gap(20),
                          DropDownField<BrandModel>(
                            displayValue: (item) => box.read('locale') != 'ar'
                                ? item.name
                                : item.arName!,
                            items: controller.brands,
                            hint: 'Brands Name'.tr,
                            selectedValue: controller.selectedBrand,
                            onChanged: (value) {
                              controller.setSelectedBrands(value);
                              controller.update();
                            },
                            errorText: '',
                          ),
                        ],
                      ),
                    controller.categoryId == '6'
                        ? Column(
                            children: [
                              Gap(20),
                              DropDownField<BatteryProductTypeModel>(
                                displayValue: (item) =>
                                    box.read('locale') != 'ar'
                                        ? item.name!
                                        : item.ar_name!,
                                items: controller.producttypes,
                                hint: 'Product type'.tr,
                                selectedValue: controller.selectedproducttype,
                                onChanged: (value) {
                                  controller.setSelectedproducttype(value);

                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<BatteryOriginModel>(
                                displayValue: (item) =>
                                    box.read('locale') != 'ar'
                                        ? item.origin!
                                        : item.ar_origin!,
                                items: controller.batteryOrigins,
                                hint: 'Origin'.tr,
                                selectedValue: controller.selectedbatteryOrigin,
                                onChanged: (value) {
                                  controller.setSelectedBatteryOrigin(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<BatteryAmpereModel>(
                                displayValue: (item) =>
                                    box.read('locale') != 'ar'
                                        ? item.ampere!
                                        : item.ar_ampere!,
                                items: controller.batteryAmperes,
                                hint: 'Battery Ampere'.tr,
                                selectedValue: controller.selectedampere,
                                onChanged: (value) {
                                  controller.setSelectedBatteryAmpere(value);

                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<BatteryVoltageModel>(
                                displayValue: (item) =>
                                    box.read('locale') != 'ar'
                                        ? item.voltage!
                                        : item.ar_voltage!,
                                items: controller.batteryVoltages,
                                hint: 'Battery Voltage'.tr,
                                selectedValue: controller.selectedvoltage,
                                onChanged: (value) {
                                  controller.setSelectedBatteryvoltage(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                            ],
                          )
                        : Gap(0),
                    controller.categoryId == '3'
                        ? Column(
                            children: [
                              Gap(20),
                              DropDownField<TyreWidthModel>(
                                displayValue: (item) =>
                                    box.read('locale') != 'ar'
                                        ? item.width!
                                        : item.width!,
                                items: controller.tyrewidths,
                                hint: 'Tyre width'.tr,
                                selectedValue: controller.selectedwidth,
                                onChanged: (value) {
                                  controller.setSelectedWidth(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<TyreHeightModel>(
                                displayValue: (item) =>
                                    box.read('locale') != 'ar'
                                        ? item.height!
                                        : item.ar_height!,
                                items: controller.tyreheights,
                                hint: 'Tyre height'.tr,
                                selectedValue: controller.selectedheight,
                                onChanged: (value) {
                                  controller.setSelectedheight(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<TyreSizeModel>(
                                displayValue: (item) =>
                                    box.read('locale') != 'ar'
                                        ? item.size!
                                        : item.ar_size!,
                                items: controller.tyresizes,
                                hint: 'Wheel size'.tr,
                                selectedValue: controller.selectedsize,
                                onChanged: (value) {
                                  controller.setSelectedSize(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<TyreSpeedRatingModel>(
                                displayValue: (item) =>
                                    box.read('locale') != 'ar'
                                        ? item.speedrating!
                                        : item.ar_speedrating!,
                                items: controller.tyreSpeedRatings,
                                hint: 'Speed rating'.tr,
                                selectedValue: controller.selectedSpeedRating,
                                onChanged: (value) {
                                  controller.setSelectedSpeedRating(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<TyrePatternModel>(
                                displayValue: (item) =>
                                    box.read('locale') != 'ar'
                                        ? item.pattern!
                                        : item.ar_pattern!,
                                items: controller.tyrepattterens,
                                hint: 'Pattern'.tr,
                                selectedValue: controller.selectedpatteren,
                                onChanged: (value) {
                                  controller.setSelectedPatteren(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<TyreOriginModel>(
                                displayValue: (item) =>
                                    box.read('locale') != 'ar'
                                        ? item.origin!
                                        : item.ar_origin!,
                                items: controller.tyreorigins,
                                hint: 'Origin'.tr,
                                selectedValue: controller.selectedtyreorigin,
                                onChanged: (value) {
                                  controller.setSelectedTyreOrigin(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                            ],
                          )
                        : Text(''),
                    controller.categoryId == '2'
                        ? Column(
                            children: [
                              DropDownField<OilProductTTypeModel>(
                                displayValue: (item) =>
                                    box.read('locale') != 'ar'
                                        ? item.producttype!
                                        : item.ar_producttype!,
                                items: controller.oilproductTypes,
                                hint: 'Product type'.tr,
                                selectedValue:
                                    controller.selectedoilproductType,
                                onChanged: (value) {
                                  controller.setSelectedOilproducttype(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<OilVolumeModel>(
                                displayValue: (item) =>
                                    box.read('locale') != 'ar'
                                        ? item.volume!
                                        : item.arvolume!,
                                items: controller.oilVolumes,
                                hint: 'Liquid volume liter'.tr,
                                selectedValue: controller.selectedvolume,
                                onChanged: (value) {
                                  controller.setSelectedVolume(value);

                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20)
                            ],
                          )
                        : Gap(0),
                    if ([4, 7, 9, 8, 1, 2]
                        .contains(int.parse(controller.categoryId.toString())))
                      Column(
                        children: [
                          DropDownField<OilExtraModel>(
                            displayValue: (item) => box.read('locale') == 'ar'
                                ? item.ar_name!
                                : item.name!,
                            items: controller.oilextras,
                            hint: 'Extra Name'.tr,
                            selectedValue: controller.selectedexra,
                            onChanged: (value) {
                              controller.setSelectedExtra(value);
                              controller.update();
                            },
                            errorText: '',
                          ),
                        ],
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
                              title: 'Choose your vehicle'.tr,
                              fontWeight: FontWeight.w600,
                              size: 13,
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
                                ontap: () {
                                  controller.selectCar(vehical.id.toString(),
                                      vehical.vehicle_info!);
                                },
                                value: vehical.id.toString(),
                                groupValue: controller.selectedCarid,
                                onChanged: (value) {
                                  controller.selectCar(
                                      value!, vehical.vehicle_info!);
                                },
                                iconPath: vehical.image!.toString(),
                                text: vehical.vehicle_info.toString());
                          },
                        ),
                        Gap(15),
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
                              title: 'What do you prefer?'.tr,
                              fontWeight: FontWeight.w600,
                              size: 13,
                            ),
                          ],
                        ),
                        Gap(8),
                        GestureDetector(
                          onTap: () {
                            controller.selectGarage('Select garage');
                          },
                          child: Row(
                            children: [
                              Radio<String>(
                                value: 'Select garage'.tr,
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
                                'Select garage'.tr,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primarybg,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            controller.selectGarage('Send to all garages');
                          },
                          child: Row(
                            children: [
                              Radio<String>(
                                value: 'Send to all garages'.tr,
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
                                'Send to all garages'.tr,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primarybg,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: MainButton(
                        title: 'Next'.tr,
                        height: Get.height * 0.07,
                        fontsize: 12,
                        onTap: () {
                          controller.selectedgarageName == 'Select garage'.tr
                              ? controller.filterorder()
                              // : UiUtilites.showConfirmationDialog(
                              //     false,
                              //     'Do you this order as urgent order'.tr,
                              //     onConfirm: () async {
                              //       controller.sendtoAllGarages();
                              //     },
                              //   );
                              : controller.sendtoAllGarages();
                        },
                      ),
                    ),
                    Gap(40),
                  ]),
            ))));
  }
}
