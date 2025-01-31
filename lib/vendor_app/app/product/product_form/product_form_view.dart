// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/models/battery_models/ampere_model.dart';
import 'package:mobilegarage/models/battery_models/origin_model.dart';
import 'package:mobilegarage/models/battery_models/product_type_model.dart';
import 'package:mobilegarage/models/battery_models/voltage_model.dart';
import 'package:mobilegarage/models/oil_models/product_type_model.dart';
import 'package:mobilegarage/models/oil_models/volume_model.dart';
import 'package:mobilegarage/models/brand_model.dart';
import 'package:mobilegarage/models/category_model.dart';
import 'package:mobilegarage/models/tyre_models/height_model.dart';
import 'package:mobilegarage/models/tyre_models/origin_model.dart';
import 'package:mobilegarage/models/tyre_models/pattern_model.dart';
import 'package:mobilegarage/models/tyre_models/size_model.dart';
import 'package:mobilegarage/models/tyre_models/speed_rating_model.dart';
import 'package:mobilegarage/models/tyre_models/width_model.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_view.dart';
import 'package:mobilegarage/user_app/components/textfields/main_input.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/product/product_form/components/product_images_picker.dart';
import 'package:mobilegarage/vendor_app/app/product/product_form/product_form_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';
import 'package:mobilegarage/vendor_app/utils/app_button/app_button.dart';
import 'package:mobilegarage/vendor_app/utils/app_dropdown/app_dropdown.dart';
import 'package:mobilegarage/vendor_app/utils/app_dropdown/dropdown_with_add.dart';
import 'package:mobilegarage/vendor_app/utils/app_inputfields/app_inputfield.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class ProductFormView extends StatelessWidget {
  const ProductFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductFormController>(
      autoRemove: false,
      builder: (controller) => AppLayout(
        appBarTitle: 'Add Product or Service'.tr,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: ProductImagesPicker(),
              ),
              Divider(color: AppColors.divider_color, thickness: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: AppText(
                        title: 'Fill Info'.tr,
                        size: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppText(
                        title:
                            '(Note : prices will be final and if you ever need to change the price contact the owner.)'
                                .tr,
                        size: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ),
                    Gap(20),
                    DropDownField<CategoryModel>(
                      displayValue: (item) => box.read('locale') == 'ar'
                          ? item.ar_name!
                          : item.name!,
                      items: controller.categories,
                      hint: 'Category'.tr,
                      selectedValue: controller.selectedCategory,
                      onChanged: (value) {
                        controller.setSelectedCategory(value);
                        controller.validateFields("Category",
                            controller.selectedCategoryId.toString());
                        controller.update();
                      },
                      errorText: controller.categorysError,
                    ),
                    if (![4, 7, 9, 1, 8]
                        .contains(controller.selectedCategoryId))
                      Column(
                        children: [
                          // Gap(20),
                          ////////////////////////
                          // GestureDetector(
                          //   onTap: () {
                          //     controller.toggleisExpanded();
                          //   },
                          //   child: Container(
                          //     height: 55,
                          //     width: Get.width,
                          //     decoration: controller.brandserror.isNotEmpty
                          //         ? circularErrorInputDecoration
                          //         : circularInputDecoration,
                          //     child: Padding(
                          //       padding:
                          //           const EdgeInsets.symmetric(horizontal: 20),
                          //       child: Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           AppText(
                          //             title: controller.selectedName,
                          //             size: 13,
                          //             fontWeight: FontWeight.w400,
                          //           ),
                          //           Icon(Icons.keyboard_arrow_down_sharp)
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Gap(20),
                          // if (controller.isExpanded)
                          //   Container(
                          //     width: Get.width*0.6,
                          //     // height: 55,
                          //     decoration: circularInputDecoration,
                          //     child: ListView.builder(
                          //       shrinkWrap: true,
                          //       physics: NeverScrollableScrollPhysics(),
                          //       itemCount: controller.brands.length,
                          //       itemBuilder: (context, index) {
                          //         final brand = controller.brands[index];
                          //         return GestureDetector(
                          //           onTap: () {
                          //             controller.setSelectedBrands(brand);
                          //             controller.toggleisExpanded();
                          //           },
                          //           child: Padding(
                          //             padding: const EdgeInsets.symmetric(
                          //                 vertical: 10, horizontal: 20),
                          //             child: Row(
                          //               children: [
                          //                 AppText(
                          //                   title: brand.name.toString(),
                          //                   size: 13,
                          //                   fontWeight: FontWeight.w400,
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //     ),
                          //   ),
                          //////////////////////////
                          Gap(20),
                          DropDownWithAdd<BrandModel>(
                            displayValue: (item) => box.read('locale') == 'ar'
                                ? item.arName!
                                : item.name,
                            items: controller.brands,
                            hint: 'Brands Name'.tr,
                            selectedValue: controller.selectedBrand,
                            onChanged: (value) {
                              controller.setSelectedBrands(value);
                              controller.validateFields("Brand",
                                  controller.selectedBrandId.toString());
                              controller.update();
                            },
                            errorText: controller.brandError,
                            onAddPressed: () {
                              UiUtilites.AddProductDialog(
                                context,
                                controller.nameController,
                                () {
                                  controller.addBrand();
                                },
                              );
                            },
                            searchController: controller.searchbrandController,
                            searchInnerWidget: Container(
                              padding: const EdgeInsets.all(8),
                              child: TextFormField(
                                controller: controller.searchbrandController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  hintText: 'Search brands'.tr,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            searchMatchFn: (item, searchValue) {
                              if (item.value == null) return true;
                              final brand = item.value as BrandModel;
                              return brand.name
                                      .toLowerCase()
                                      .contains(searchValue.toLowerCase()) ||
                                  brand.arName!
                                      .toLowerCase()
                                      .contains(searchValue.toLowerCase());
                            },
                            onMenuStateChange: (isOpen) {
                              if (!isOpen) {
                                controller.searchbrandController.clear();
                              }
                            },
                          )
                        ],
                      ),
                    controller.selectedCategoryId == 6
                        ? Column(
                            children: [
                              Gap(20),
                              DropDownField<BatteryProductTypeModel>(
                                displayValue: (item) =>
                                    box.read('locale') == 'ar'
                                        ? item.ar_name.toString()
                                        : item.name!,
                                items: controller.producttypes,
                                hint: 'Product type'.tr,
                                selectedValue: controller.selectedproducttype,
                                onChanged: (value) {
                                  controller.setSelectedproducttype(value);
                                  controller.validateFields(
                                      "producttype",
                                      controller.selectedProducttypeId
                                          .toString());
                                  controller.update();
                                },
                                errorText: controller.producttypeError,
                              ),
                              Gap(20),
                              DropDownField<BatteryOriginModel>(
                                displayValue: (item) =>
                                    box.read('locale') == 'ar'
                                        ? item.ar_origin.toString()
                                        : item.origin!,
                                items: controller.batteryOrigins,
                                hint: 'Origin'.tr,
                                selectedValue: controller.selectedbatteryOrigin,
                                onChanged: (value) {
                                  controller.setSelectedBatteryOrigin(value);
                                  controller.validateFields(
                                      "origin",
                                      controller.selectedbatteryOriginId
                                          .toString());
                                  controller.update();
                                },
                                errorText: controller.originError,
                              ),
                              Gap(20),
                              DropDownField<BatteryAmpereModel>(
                                displayValue: (item) =>
                                    box.read('locale') == 'ar'
                                        ? item.ar_ampere.toString()
                                        : item.ampere!,
                                items: controller.batteryAmperes,
                                hint: 'Battery Ampere'.tr,
                                selectedValue: controller.selectedampere,
                                onChanged: (value) {
                                  controller.setSelectedBatteryAmpere(value);
                                  controller.validateFields("ampere",
                                      controller.selectedampereId.toString());
                                  controller.update();
                                },
                                errorText: controller.ampereError,
                              ),
                              Gap(20),
                              DropDownField<BatteryVoltageModel>(
                                displayValue: (item) =>
                                    box.read('locale') == 'ar'
                                        ? item.ar_voltage.toString()
                                        : item.voltage!,
                                items: controller.batteryVoltages,
                                hint: 'Battery Voltage'.tr,
                                selectedValue: controller.selectedvoltage,
                                onChanged: (value) {
                                  controller.setSelectedBatteryvoltage(value);
                                  controller.validateFields("voltage",
                                      controller.selectedvoltageId.toString());
                                  controller.update();
                                },
                                errorText: controller.voltageError,
                              ),
                            ],
                          )
                        : Gap(0),
                    controller.selectedCategoryId == 3
                        ? Column(
                            children: [
                              Gap(20),
                              DropDownField<TyreWidthModel>(
                                displayValue: (item) =>
                                    box.read('locale') == 'ar'
                                        ? item.ar_width.toString()
                                        : item.width!,
                                items: controller.tyrewidths,
                                hint: 'Tyre width'.tr,
                                selectedValue: controller.selectedwidth,
                                onChanged: (value) {
                                  controller.setSelectedWidth(value);
                                  controller.validateFields("width",
                                      controller.selectedwidthId.toString());
                                  controller.update();
                                },
                                errorText: controller.widthError,
                              ),
                              Gap(20),
                              DropDownField<TyreHeightModel>(
                                displayValue: (item) =>
                                    box.read('locale') == 'ar'
                                        ? item.ar_height.toString()
                                        : item.height!,
                                items: controller.tyreheights,
                                hint: 'Tyre height'.tr,
                                selectedValue: controller.selectedheight,
                                onChanged: (value) {
                                  controller.setSelectedheight(value);
                                  controller.validateFields("height",
                                      controller.selectedheightId.toString());
                                  controller.update();
                                },
                                errorText: controller.heightError,
                              ),
                              Gap(20),
                              DropDownField<TyreSizeModel>(
                                displayValue: (item) =>
                                    box.read('locale') == 'ar'
                                        ? item.ar_size.toString()
                                        : item.size!,
                                items: controller.tyresizes,
                                hint: 'Wheel size'.tr,
                                selectedValue: controller.selectedsize,
                                onChanged: (value) {
                                  controller.setSelectedSize(value);
                                  controller.validateFields("size",
                                      controller.selectedsizeId.toString());
                                  controller.update();
                                },
                                errorText: controller.sizeError,
                              ),
                              Gap(20),
                              DropDownField<TyreSpeedRatingModel>(
                                displayValue: (item) =>
                                    box.read('locale') == 'ar'
                                        ? item.ar_speedrating.toString()
                                        : item.speedrating!,
                                items: controller.tyreSpeedRatings,
                                hint: 'Speed rating'.tr,
                                selectedValue: controller.selectedSpeedRating,
                                onChanged: (value) {
                                  controller.setSelectedSpeedRating(value);
                                  controller.validateFields(
                                      "speed rating",
                                      controller.selectedSpeedRatingId
                                          .toString());
                                  controller.update();
                                },
                                errorText: controller.speedratingError,
                              ),
                              Gap(20),
                              DropDownField<TyrePatternModel>(
                                displayValue: (item) =>
                                    box.read('locale') == 'ar'
                                        ? item.ar_pattern.toString()
                                        : item.pattern!,
                                items: controller.tyrepattterens,
                                hint: 'Pattern'.tr,
                                selectedValue: controller.selectedpatteren,
                                onChanged: (value) {
                                  controller.setSelectedPatteren(value);
                                  controller.validateFields("patteren",
                                      controller.selectedpatterenId.toString());
                                  controller.update();
                                },
                                errorText: controller.patterenError,
                              ),
                              Gap(20),
                              DropDownField<TyreOriginModel>(
                                displayValue: (item) =>
                                    box.read('locale') == 'ar'
                                        ? item.ar_origin.toString()
                                        : item.origin!,
                                items: controller.tyreorigins,
                                hint: 'Origin'.tr,
                                selectedValue: controller.selectedtyreorigin,
                                onChanged: (value) {
                                  controller.setSelectedTyreOrigin(value);
                                  controller.validateFields(
                                      "tyre origin",
                                      controller.selectedtyreoriginId
                                          .toString());
                                  controller.update();
                                },
                                errorText: controller.tyreoriginError,
                              ),
                            ],
                          )
                        : Gap(0),
                    controller.selectedCategoryId == 2
                        ? Column(
                            children: [
                              Gap(20),
                              DropDownField<OilProductTTypeModel>(
                                displayValue: (item) =>
                                    box.read('locale') == 'ar'
                                        ? item.ar_producttype.toString()
                                        : item.producttype!,
                                items: controller.oilproductTypes,
                                hint: 'Product type'.tr,
                                selectedValue:
                                    controller.selectedoilproductType,
                                onChanged: (value) {
                                  controller.setSelectedOilproducttype(value);
                                  controller.validateFields(
                                      "product type",
                                      controller.selectedoilproductTypeId
                                          .toString());
                                  controller.update();
                                },
                                errorText: controller.oilproductTypeError,
                              ),
                              Gap(20),
                              DropDownField<OilVolumeModel>(
                                displayValue: (item) =>
                                    box.read('locale') == 'ar'
                                        ? item.arvolume.toString()
                                        : item.volume!,
                                items: controller.oilVolumes,
                                hint: 'Liquid volume liter'.tr,
                                selectedValue: controller.selectedvolume,
                                onChanged: (value) {
                                  controller.setSelectedVolume(value);
                                  controller.validateFields("volume",
                                      controller.selectedVolumeId.toString());
                                  controller.update();
                                },
                                errorText: controller.volumeError,
                              ),
                            ],
                          )
                        : Gap(0),
                    if (![7, 9, 4, 1, 8]
                        .contains(controller.selectedCategoryId))
                      Gap(20),
                    if (![4, 7, 9, 1, 8]
                        .contains(controller.selectedCategoryId))
                      Column(
                        children: [
                          AppInputField(
                            errorText: controller.selectedCategoryId != 6
                                ? controller.descriptionError
                                : '',
                            hint: controller.selectedCategoryId == 2
                                ? 'Description'.tr
                                : 'Description (optional)'.tr,
                            controller: controller.descriptionController,
                            onchange: (val) {
                              controller.selectedCategoryId != 6
                                  ? controller.validateFields("Price", val)
                                  : print('no validation needed');
                            },
                          ),
                          Gap(20),
                        ],
                      ),
                    if (![4, 7, 9, 1, 8]
                        .contains(controller.selectedCategoryId))
                      AppInputField(
                        errorText: controller.priceError,
                        hint: 'Price'.tr,
                        type: TextInputType.number,
                        controller: controller.priceController,
                        onchange: (val) {
                          controller.validateFields("Price", val);
                        },
                        hasSuffix: true,
                        suffixWidget: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: AppText(
                            title: 'AED'.tr,
                            size: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary_color,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if ([2, 4, 7, 9, 1, 8].contains(controller.selectedCategoryId))
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.itemCount,
                  itemBuilder: (context, index) {
                    var priceError = controller.getPriceError(index);
                    var timeError = controller.getTimeError(index);
                    var descriptionError =
                        controller.acextradescriptionErrors[index] ?? '';
                    return Column(
                      children: [
                        if (![7, 9, 4, 1, 8]
                                .contains(controller.selectedCategoryId) ||
                            index != 0)
                          Divider(
                            thickness: 7,
                            color: AppColors.grey.shade100,
                          ),
                        Gap(28),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 12,
                                width: 12,
                                decoration: BoxDecoration(
                                    color: AppColors.black,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              Gap(10),
                              AppText(
                                title: controller.getTitle(index),
                                size: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Gap(26),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: MainInput(
                            hint: controller.selectedCategoryId == 8
                                ? 'Description'.tr
                                : 'Description (optional)'.tr,
                            onchange: (p0) {
                              switch (
                                  controller.selectedCategoryId.toString()) {
                                case '2':
                                  controller.oilextras[index].description = p0;
                                  break;
                                case '4':
                                  controller.roadAssistanceExtras[index]
                                      .description = p0;
                                  break;
                                case '7':
                                  controller.recoveryExtras[index].description =
                                      p0;
                                  break;
                                case '9':
                                  controller.fuelExtras[index].description = p0;
                                  break;
                                case '1':
                                  controller.carwashExtras[index].description =
                                      p0;
                                  break;
                                case '8':
                                  controller.acExtras[index].description = p0;
                                  break;
                                default:
                                  print('Not showing for other categories');
                                  break;
                              }
                              controller.update();
                            },
                            errorText: controller.selectedCategoryId == 8
                                ? descriptionError
                                : '',
                          ),
                        ),
                        Column(
                          children: [
                            Gap(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 22),
                              child: AppInputField(
                                hint: 'Price'.tr,
                                type: TextInputType.number,
                                errorText: priceError,
                                onchange: (val) {
                                  switch (controller.selectedCategoryId
                                      .toString()) {
                                    case '2':
                                      controller.oilextras[index].price = val;
                                      break;
                                    case '4':
                                      controller.roadAssistanceExtras[index]
                                          .price = val;
                                      break;
                                    case '7':
                                      controller.recoveryExtras[index].price =
                                          val;
                                      break;
                                    case '9':
                                      controller.fuelExtras[index].price = val;
                                      break;
                                    case '1':
                                      controller.carwashExtras[index].price =
                                          val;
                                      break;
                                    case '8':
                                      controller.acExtras[index].price = val;
                                      break;
                                    default:
                                      print('Not showing for other categories');
                                      break;
                                  }
                                  controller.update();
                                },
                                hasSuffix: true,
                                suffixWidget: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: AppText(
                                    title: 'AED'.tr,
                                    size: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary_color,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if ([4, 7, 9, 1]
                            .contains(controller.selectedCategoryId))
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: Column(
                              children: [
                                Gap(20),
                                AppInputField(
                                  errorText: timeError,
                                  hint: 'Time'.tr,
                                  type: TextInputType.number,
                                  onchange: (val) {
                                    switch (controller.selectedCategoryId
                                        .toString()) {
                                      case '7':
                                        controller.recoveryExtras[index].time =
                                            val;
                                        break;
                                      case '4':
                                        controller.roadAssistanceExtras[index]
                                            .time = val;
                                        break;
                                      case '9':
                                        controller.fuelExtras[index].time = val;
                                        break;
                                      case '1':
                                        controller.carwashExtras[index].time =
                                            val;
                                        break;
                                      default:
                                        print(
                                            'Not showing for other categories');
                                        break;
                                    }
                                    controller.update();
                                  },
                                  hasSuffix: true,
                                  suffixWidget: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: AppText(
                                      title: 'Min'.tr,
                                      size: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary_color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Gap(26),
                      ],
                    );
                  },
                ),
              // if (controller.selectedCategoryId == 8)
              //   Column(
              //     children: [
              //       Divider(
              //         thickness: 7,
              //         color: AppColors.grey.shade100,
              //       ),
              //       Gap(25),
              //       Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 32),
              //         child: AppInputField(
              //           errorText: controller.priceError,
              //           hint: 'Price',
              //           type: TextInputType.number,
              //           controller: controller.priceController,
              //           onchange: (val) {
              //             controller.validateFields("Price", val);
              //           },
              //           hasSuffix: true,
              //           suffixWidget: Padding(
              //             padding: const EdgeInsets.symmetric(vertical: 16),
              //             child: AppText(
              //               title: 'AED',
              //               size: 14,
              //               fontWeight: FontWeight.w600,
              //               color: AppColors.primary_color,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Gap(20)
              //     ],
              //   ),
              Gap(40),
              AppButton(
                buttonWidth: 0.8,
                title: 'Add product'.tr,
                buttonColor: AppColors.primary_color,
                ontap: () {
                  controller.addProduct();
                },
              ),
              Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
