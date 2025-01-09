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
import 'package:mobilegarage/user_app/components/textfields/main_input.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/product/edit_product/components/edit_product_images_picker.dart';
import 'package:mobilegarage/vendor_app/app/product/edit_product/edit_product_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';
import 'package:mobilegarage/vendor_app/utils/app_button/app_button.dart';
import 'package:mobilegarage/vendor_app/utils/app_dropdown/app_dropdown.dart';
import 'package:mobilegarage/vendor_app/utils/app_inputfields/app_inputfield.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProductController>(
      autoRemove: false,
      builder: (controller) => AppLayout(
        appBarTitle: 'Edit product'.tr,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: EditProductImagesPicker(),
              ),
              Divider(color: AppColors.divider_color, thickness: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: AppText(
                        title: 'Edit info.'.tr,
                        size: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: AppText(
                        title:
                            '(Note : prices will not be edited unless approved from the owner.)'
                                .tr,
                        size: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ),
                    Gap(17),
                    DropDownField<CategoryModel>(
                      displayValue: (item) => item.name!,
                      items: controller.categories,
                      hint: 'Category'.tr,
                      selectedValue: controller.selectedCategory,
                      onChanged: (value) {
                        // controller.setSelectedCategory(value);
                        UiUtilites.errorSnackbar(
                            'Error'.tr,
                            "Category can't be changed while editing product"
                                .tr);
                        controller.update();
                      },
                      errorText: '',
                    ),
                    if (![4, 7, 9, 1, 8]
                        .contains(controller.selectedCategoryId))
                      Column(
                        children: [
                          Gap(20),
                          DropDownField<BrandModel>(
                            displayValue: (item) => item.name,
                            items: controller.brands,
                            hint: 'Brands Name'.tr,
                            selectedValue: controller.selectedBrand,
                            onChanged: (value) {
                              controller.setSelectedBrands(value);
                              controller.update();
                            },
                            errorText: '',
                            // onAddPressed: () {
                            //   UiUtilites.AddProductDialog(
                            //     context,
                            //     controller.nameController,
                            //     () {
                            //       controller.addBrand();
                            //     },
                            //   );
                            // },
                          ),
                        ],
                      ),
                    controller.selectedCategoryId == 6
                        ? Column(
                            children: [
                              Gap(20),
                              DropDownField<BatteryProductTypeModel>(
                                displayValue: (item) => item.name!,
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
                                displayValue: (item) => item.origin!,
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
                                displayValue: (item) => item.ampere!,
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
                                displayValue: (item) => item.voltage!,
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
                    controller.selectedCategoryId == 3
                        ? Column(
                            children: [
                              Gap(20),
                              DropDownField<TyreWidthModel>(
                                displayValue: (item) => item.width!,
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
                                displayValue: (item) => item.height!,
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
                                displayValue: (item) => item.size!,
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
                                displayValue: (item) => item.speedrating!,
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
                                displayValue: (item) => item.pattern!,
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
                                displayValue: (item) => item.origin!,
                                items: controller.tyreorigins,
                                hint: 'Origin'.tr,
                                selectedValue: controller.selectedtyreorigin,
                                onChanged: (value) {
                                  controller.setSelectedTyreOrigin(value);
                                  controller.update();
                                },
                                errorText: '',
                              ),
                            ],
                          )
                        : Gap(0),
                    controller.selectedCategoryId == 2
                        ? Column(
                            children: [
                              Gap(20),
                              DropDownField<OilProductTTypeModel>(
                                displayValue: (item) => item.producttype!,
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
                                displayValue: (item) => item.volume!,
                                items: controller.oilVolumes,
                                hint: 'Liquid volume liter'.tr,
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
                    if (![7, 9, 4, 1, 8]
                        .contains(controller.selectedCategoryId))
                      Gap(20),
                    if (![4, 7, 9, 1, 8]
                        .contains(controller.selectedCategoryId))
                      Column(
                        children: [
                          AppInputField(
                            errorText: '',
                            hint: controller.selectedCategoryId == 2
                                ? 'Description'.tr
                                : 'Description (optional)'.tr,
                            controller: controller.descriptionController,
                            onchange: (val) {},
                          ),
                          Gap(20),
                        ],
                      ),
                    if (![4, 7, 9, 1, 8]
                        .contains(controller.selectedCategoryId))
                      AppInputField(
                        errorText: '',
                        hint: 'Price'.tr,
                        readOnly: true,
                        type: TextInputType.number,
                        controller: controller.priceController,
                        onchange: (val) {},
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
                    var extra;
                    switch (controller.product!.categoryId) {
                      case '2':
                        extra = controller.product!.oilextra![index];
                        break;

                      case '7':
                        extra = controller.product!.recoveryextra![index];
                        break;
                      case '9':
                        extra = controller.product!.fuelextra![index];
                        break;
                      case '4':
                        extra = controller.product!.roadextra![index];
                        break;
                      case '1':
                        extra = controller.product!.carwashextra![index];
                        break;
                      case '8':
                        extra = controller.product!.acextra![index];
                        break;
                      default:
                        break;
                    }
                    return Column(
                      children: [
                        if (![7, 9, 4, 1]
                                .contains(controller.selectedCategoryId) ||
                            index != 0)
                          if (controller.selectedCategoryId != 8)
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
                            controller: controller.extraDescriptions[extra.id],
                            hint: controller.selectedCategoryId == 8
                                ? 'Description'.tr
                                : 'Description (optional)'.tr,
                            onchange: (p0) {
                              extra.description = p0;
                              controller.update();
                            },
                            errorText: '',
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
                                controller: controller.extraprices[extra.id],
                                errorText: '',
                                onchange: (val) {
                                  extra.price = val;
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
                                  controller: controller.extratimes[extra.id],
                                  errorText: '',
                                  hint: 'Time'.tr,
                                  type: TextInputType.number,
                                  onchange: (val) {
                                    extra.time = val;
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
              Gap(40),
              AppButton(
                buttonWidth: 0.8,
                title: 'Edit product'.tr,
                buttonColor: AppColors.primary_color,
                ontap: () {
                  controller.editProduct();
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
