// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/models/battery_models/ampere_model.dart';
import 'package:mobilegarage/models/battery_models/origin_model.dart';
import 'package:mobilegarage/models/battery_models/product_type_model.dart';
import 'package:mobilegarage/models/battery_models/voltage_model.dart';
import 'package:mobilegarage/models/product_detail_model.dart';
import 'package:mobilegarage/models/brand_model.dart';
import 'package:mobilegarage/models/category_model.dart';
import 'package:mobilegarage/models/tyre_models/height_model.dart';
import 'package:mobilegarage/models/tyre_models/origin_model.dart';
import 'package:mobilegarage/models/tyre_models/pattern_model.dart';
import 'package:mobilegarage/models/tyre_models/size_model.dart';
import 'package:mobilegarage/models/tyre_models/speed_rating_model.dart';
import 'package:mobilegarage/models/tyre_models/width_model.dart';
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
        appBarTitle: 'Add Product or Service',
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
                    const AppText(
                      title: 'Fill Info',
                      size: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    Gap(12),
                    DropDownField<CategoryModel>(
                      displayValue: (item) => item.name!,
                      items: controller.categories,
                      hint: 'Category',
                      selectedValue: controller.selectedCategory,
                      onChanged: (value) {
                        controller.setSelectedCategory(value);
                        controller.validateFields("Category",
                            controller.selectedCategoryId.toString());
                        controller.update();
                      },
                      errorText: controller.categorysError,
                    ),
                    Gap(20),
                    DropDownWithAdd<BrandModel>(
                      displayValue: (item) => item.name!,
                      items: controller.brands,
                      hint: 'Brands Name',
                      selectedValue: controller.selectedBrand,
                      onChanged: (value) {
                        controller.setSelectedBrands(value);
                        controller.validateFields(
                            "Brand", controller.selectedBrandId.toString());
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
                    ),
                    controller.selectedCategoryId != null &&
                            controller.brands.isNotEmpty &&
                            controller.selectedCategoryId == 5
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
                                  controller.validateFields("producttype",
                                      controller.selectedBrandId.toString());
                                  controller.update();
                                },
                                errorText: controller.producttypeError,
                              ),
                              Gap(20),
                              DropDownField<BatteryOriginModel>(
                                displayValue: (item) => item.origin!,
                                items: controller.batteryOrigins,
                                hint: 'Origin',
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
                                displayValue: (item) => item.ampere!,
                                items: controller.batteryAmperes,
                                hint: 'Battery Ampere',
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
                                displayValue: (item) => item.voltage!,
                                items: controller.batteryVoltages,
                                hint: 'Battery Voltage',
                                selectedValue: controller.selectedvoltage,
                                onChanged: (value) {
                                  controller.setSelectedBatteryvoltage(value);
                                  controller.validateFields("voltage",
                                      controller.selectedvoltageId.toString());
                                  controller.update();
                                },
                                errorText: controller.voltageError,
                              ),
                              Gap(20),
                              AppInputField(
                                errorText: '',
                                hint: 'Description (optional)',
                                controller: controller.descriptionController,
                              ),
                            ],
                          )
                        : Text(''),
                    controller.selectedCategoryId != null &&
                            controller.brands.isNotEmpty &&
                            controller.selectedCategoryId == 6
                        ? Column(
                            children: [
                              DropDownField<TyreWidthModel>(
                                displayValue: (item) => item.width!,
                                items: controller.tyrewidths,
                                hint: 'Tyer width',
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
                                displayValue: (item) => item.height!,
                                items: controller.tyreheights,
                                hint: 'Tyer height',
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
                                displayValue: (item) => item.size!,
                                items: controller.tyresizes,
                                hint: 'Wheel size',
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
                                displayValue: (item) => item.speedrating!,
                                items: controller.tyreSpeedRatings,
                                hint: 'Speed rating',
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
                                displayValue: (item) => item.pattern!,
                                items: controller.tyrepattterens,
                                hint: 'Pattern',
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
                                displayValue: (item) => item.origin!,
                                items: controller.tyreorigins,
                                hint: 'Origin',
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
                              Gap(20),
                            ],
                          )
                        : Text(''),
                    AppInputField(
                      errorText: controller.priceError,
                      hint: 'Price',
                      type: TextInputType.number,
                      controller: controller.priceController,
                      onchange: (val) {
                        controller.validateFields("Price", val);
                      },
                      hasSuffix: true,
                      suffixWidget: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: AppText(
                          title: 'AED',
                          size: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary_color,
                        ),
                      ),
                    ),
                    Gap(30),
                    AppButton(
                      title: 'Add product',
                      buttonColor: AppColors.primary_color,
                      ontap: () {
                        controller.addProduct();
                      },
                    ),
                    Gap(20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
