// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
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
import 'package:mobilegarage/user_app/components/filter_bottomsheet/filter_bottomsheet.dart';
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
                      "${controller.start.toStringAsFixed(2)} - ${controller.end.toStringAsFixed(2)} AED",
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
                    if (![4, 7, 9, 8, 1]
                        .contains(int.parse(controller.categoryId.toString())))
                      Column(
                        children: [
                          Gap(30),
                          DropDownField<BrandModel>(
                            displayValue: (item) => item.name!,
                            items: controller.brands,
                            hint: 'Brands Name',
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
                                displayValue: (item) => item.name!,
                                items: controller.producttypes,
                                hint: 'Product type',
                                selectedValue: controller.selectedproducttype,
                                onChanged: (value) {
                                  controller.setSelectedproducttype(value);

                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<BatteryOriginModel>(
                                displayValue: (item) => item.origin!,
                                items: controller.batteryOrigins,
                                hint: 'Origin',
                                selectedValue: controller.selectedbatteryOrigin,
                                onChanged: (value) {
                                  controller.setSelectedBatteryOrigin(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<BatteryAmpereModel>(
                                displayValue: (item) => item.ampere!,
                                items: controller.batteryAmperes,
                                hint: 'Battery Ampere',
                                selectedValue: controller.selectedampere,
                                onChanged: (value) {
                                  controller.setSelectedBatteryAmpere(value);

                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<BatteryVoltageModel>(
                                displayValue: (item) => item.voltage!,
                                items: controller.batteryVoltages,
                                hint: 'Battery Voltage',
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
                                displayValue: (item) => item.width!,
                                items: controller.tyrewidths,
                                hint: 'Tyer width',
                                selectedValue: controller.selectedwidth,
                                onChanged: (value) {
                                  controller.setSelectedWidth(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<TyreHeightModel>(
                                displayValue: (item) => item.height!,
                                items: controller.tyreheights,
                                hint: 'Tyer height',
                                selectedValue: controller.selectedheight,
                                onChanged: (value) {
                                  controller.setSelectedheight(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<TyreSizeModel>(
                                displayValue: (item) => item.size!,
                                items: controller.tyresizes,
                                hint: 'Wheel size',
                                selectedValue: controller.selectedsize,
                                onChanged: (value) {
                                  controller.setSelectedSize(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<TyreSpeedRatingModel>(
                                displayValue: (item) => item.speedrating!,
                                items: controller.tyreSpeedRatings,
                                hint: 'Speed rating',
                                selectedValue: controller.selectedSpeedRating,
                                onChanged: (value) {
                                  controller.setSelectedSpeedRating(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<TyrePatternModel>(
                                displayValue: (item) => item.pattern!,
                                items: controller.tyrepattterens,
                                hint: 'Pattern',
                                selectedValue: controller.selectedpatteren,
                                onChanged: (value) {
                                  controller.setSelectedPatteren(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                              Gap(20),
                              DropDownField<TyreOriginModel>(
                                displayValue: (item) => item.origin!,
                                items: controller.tyreorigins,
                                hint: 'Origin',
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
                                displayValue: (item) => item.producttype!,
                                items: controller.oilproductTypes,
                                hint: 'Product type',
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
                                displayValue: (item) => item.volume!,
                                items: controller.oilVolumes,
                                hint: 'Liquid volume litter',
                                selectedValue: controller.selectedvolume,
                                onChanged: (value) {
                                  controller.setSelectedVolume(value);

                                  controller.update();
                                },
                                errorText: '',
                              ),
                            ],
                          )
                        : Gap(0),
                         if ([4, 7, 9, 8, 1, 2]
                        .contains(int.parse(controller.categoryId.toString())))
                      Column(
                        children: [
                          Gap(20),

                          DropDownField<OilExtraModel>(
                            displayValue: (item) => item.name!,
                            items: controller.oilextras,
                            hint: 'Extra  Name',
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
                                groupValue: controller.selectedCarName,
                                onChanged: (value) {
                                  controller.selectCar(value!);
                                },
                                iconPath: vehical.image!.toString(),
                                text: vehical.vehicle_info.toString());
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
                              fillColor:
                                  MaterialStatePropertyAll(AppColors.primarybg),
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
                              value: 'Send to all garages',
                              groupValue: controller.selectedgarageName,
                              onChanged: (value) {
                                controller.selectGarage(value!);
                              },
                              fillColor:
                                  MaterialStatePropertyAll(AppColors.primarybg),
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
                    Gap(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: MainButton(
                        title: 'Next',
                        height: Get.height * 0.07,
                        fontsize: 12,
                        onTap: () {
                          controller.filterorder();
                        },
                      ),
                    ),
                    Gap(40),
                  ]),
            ))));
  }
}