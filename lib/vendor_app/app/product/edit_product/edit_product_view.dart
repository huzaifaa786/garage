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
import 'package:mobilegarage/vendor_app/utils/app_dropdown/dropdown_with_add.dart';
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
        appBarTitle: 'Edit product',
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
                        title: 'Edit info.',
                        size: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: AppText(
                        title:
                            '(Note : prices will not be edited unless approved from the owner.)',
                        size: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ),
                    Gap(17),
                    DropDownField<CategoryModel>(
                      displayValue: (item) => item.name!,
                      items: controller.categories,
                      hint: 'Category',
                      selectedValue: controller.selectedCategory,
                      onChanged: (value) {
                        controller.setSelectedCategory(value);
                        // controller.validateFields("Category",
                        //     controller.selectedCategoryId.toString());
                        controller.update();
                      },
                      // errorText: controller.categorysError,
                      errorText: '',
                    ),
                    if (![4, 7, 9, 1, 8]
                        .contains(controller.selectedCategoryId))
                      Column(
                        children: [
                          Gap(20),
                          DropDownWithAdd<BrandModel>(
                            displayValue: (item) => item.name!,
                            items: controller.brands,
                            hint: 'Brands Name',
                            selectedValue: controller.selectedBrand,
                            onChanged: (value) {
                              controller.setSelectedBrands(value);
                              // controller.validateFields("Brand",
                              //     controller.selectedBrandId.toString());
                              controller.update();
                            },
                            // errorText: controller.brandError,
                            errorText: '',
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
                        ],
                      ),
                    controller.selectedCategoryId == 6
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
                                  // controller.validateFields(
                                  //     "producttype",
                                  //     controller.selectedProducttypeId
                                  //         .toString());
                                  controller.update();
                                },
                                // errorText: controller.producttypeError,
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
                                  // controller.validateFields(
                                  //     "origin",
                                  //     controller.selectedbatteryOriginId
                                  //         .toString());
                                  controller.update();
                                },
                                // errorText: controller.originError,
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
                                  // controller.validateFields("ampere",
                                  //     controller.selectedampereId.toString());
                                  controller.update();
                                },
                                // errorText: controller.ampereError,
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
                                  // controller.validateFields("voltage",
                                  //     controller.selectedvoltageId.toString());
                                  controller.update();
                                },
                                // errorText: controller.voltageError,
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
                                hint: 'Tyer width',
                                selectedValue: controller.selectedwidth,
                                onChanged: (value) {
                                  controller.setSelectedWidth(value);
                                  // controller.validateFields("width",
                                  //     controller.selectedwidthId.toString());
                                  controller.update();
                                },
                                // errorText: controller.widthError,
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
                                  // controller.validateFields("height",
                                  //     controller.selectedheightId.toString());
                                  controller.update();
                                },
                                // errorText: controller.heightError,
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
                                  // controller.validateFields("size",
                                  //     controller.selectedsizeId.toString());
                                  controller.update();
                                },
                                // errorText: controller.sizeError,
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
                                  // controller.validateFields(
                                  //     "speed rating",
                                  //     controller.selectedSpeedRatingId
                                  //         .toString());
                                  controller.update();
                                },
                                // errorText: controller.speedratingError,
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
                                  // controller.validateFields("patteren",
                                  //     controller.selectedpatterenId.toString());
                                  controller.update();
                                },
                                // errorText: controller.patterenError,
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
                                  // controller.validateFields(
                                  //     "tyre origin",
                                  //     controller.selectedtyreoriginId
                                  //         .toString());
                                  controller.update();
                                },
                                // errorText: controller.tyreoriginError,
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
                                hint: 'Product type',
                                selectedValue:
                                    controller.selectedoilproductType,
                                onChanged: (value) {
                                  controller.setSelectedOilproducttype(value);
                                  // controller.validateFields(
                                  //     "product type",
                                  //     controller.selectedoilproductTypeId
                                  //         .toString());
                                  controller.update();
                                },
                                // errorText: controller.oilproductTypeError,
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
                                  // controller.validateFields("volume",
                                  //     controller.selectedVolumeId.toString());
                                  controller.update();
                                },
                                // errorText: controller.volumeError,
                                errorText: '',
                              ),
                            ],
                          )
                        : Gap(0),
                    if (![7, 9, 4, 1, 8]
                        .contains(controller.selectedCategoryId))
                      Gap(20),
                    if (![3, 4, 7, 9, 1, 8]
                        .contains(controller.selectedCategoryId))
                      Column(
                        children: [
                          AppInputField(
                            // errorText: controller.selectedCategoryId != 6
                            //     ? controller.descriptionError
                            //     : '',
                            errorText: '',
                            hint: controller.selectedCategoryId == 2
                                ? 'Description'
                                : 'Description (optional)',
                            controller: controller.descriptionController,
                            onchange: (val) {
                              // controller.selectedCategoryId != 6
                              //     ? controller.validateFields("Price", val)
                              //     : print('no validation needed');
                            },
                          ),
                          Gap(20),
                        ],
                      ),
                    if (![4, 7, 9, 1, 8]
                        .contains(controller.selectedCategoryId))
                      AppInputField(
                        // errorText: controller.priceError,
                        errorText: '',
                        hint: 'Price',
                        type: TextInputType.number,
                        controller: controller.priceController,
                        onchange: (val) {
                          // controller.validateFields("Price", val);
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
                  ],
                ),
              ),
              if ([2, 4, 7, 9, 1, 8].contains(controller.selectedCategoryId))
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.itemCount,
                  itemBuilder: (context, index) {
                    // var priceError = controller.getPriceError(index);
                    // var timeError = controller.getTimeError(index);
                    // var descriptionError =
                    //     controller.acextradescriptionErrors[index] ?? '';
                    TextEditingController descriptionController =
                        TextEditingController();

                    switch (controller.selectedCategoryId) {
                      // case 2:
                      //   descriptionController.text = controller.oilextras[index].description ?? '';
                      //   break;
                      // case 4:
                      //   descriptionController.text = controller.roadAssistanceExtras[index].description ?? '';
                      //   break;
                      case 7:
                        descriptionController.text =
                            controller.recoveryExtras[index].description ?? '';
                        break;
                      // case 9:
                      //   descriptionController.text = controller.fuelExtras[index].description ?? '';
                      //   break;
                      // case 1:
                      //   descriptionController.text = controller.carwashExtras[index].description ?? '';
                      //   break;
                      // case 8:
                      //   descriptionController.text = controller.acExtras[index].description ?? '';
                      //   break;
                      default:
                        descriptionController.text = '';
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
                            controller: descriptionController,
                            hint: controller.selectedCategoryId == 8
                                ? 'Description'
                                : 'Description (optional)',
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
                            // errorText: controller.selectedCategoryId == 8
                            //     ? descriptionError
                            //     : '',
                            errorText: '',
                          ),
                        ),
                        if (controller.selectedCategoryId != 8)
                          Column(
                            children: [
                              Gap(20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 22),
                                child: AppInputField(
                                  hint: 'Price',
                                  type: TextInputType.number,
                                  // errorText: priceError,
                                  errorText: '',
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
                                        controller.fuelExtras[index].price =
                                            val;
                                        break;
                                      case '1':
                                        controller.carwashExtras[index].price =
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
                                      title: 'AED',
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
                                  // errorText: timeError,
                                  errorText: '',
                                  hint: 'Time',
                                  type: TextInputType.number,
                                  onchange: (val) {
                                    switch (controller.selectedCategoryId
                                        .toString()) {
                                      case '4':
                                        controller.roadAssistanceExtras[index]
                                            .time = val;
                                        break;
                                      case '7':
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
                                      title: 'Min',
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
              if (controller.selectedCategoryId == 8)
                Column(
                  children: [
                    Divider(
                      thickness: 7,
                      color: AppColors.grey.shade100,
                    ),
                    Gap(25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: AppInputField(
                        // errorText: controller.priceError,
                        errorText: '',
                        hint: 'Price',
                        type: TextInputType.number,
                        controller: controller.priceController,
                        onchange: (val) {
                          // controller.validateFields("Price", val);
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
                    ),
                    Gap(20)
                  ],
                ),
              Gap(40),
              AppButton(
                buttonWidth: 0.8,
                title: 'Edit product',
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