import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/vender_apis/products/add_product_apis/add_product_api.dart';
import 'package:mobilegarage/apis/vender_apis/products/add_product_apis/product_detail_apis/product_detail_api.dart';
import 'package:mobilegarage/apis/vender_apis/products/add_product_apis/brands/add_brand_api.dart';
import 'package:mobilegarage/apis/vender_apis/products/add_product_apis/brands/get_brands_api.dart';
import 'package:mobilegarage/apis/vender_apis/products/add_product_apis/categories/get_categories_api.dart';
import 'package:mobilegarage/models/battery_models/ampere_model.dart';
import 'package:mobilegarage/models/battery_models/origin_model.dart';
import 'package:mobilegarage/models/battery_models/product_type_model.dart';
import 'package:mobilegarage/models/battery_models/voltage_model.dart';
import 'package:mobilegarage/models/product_detail_model.dart';
import 'package:mobilegarage/models/brand_model.dart';
import 'package:mobilegarage/models/category_model.dart';
import 'package:mobilegarage/models/product_model.dart';
import 'package:mobilegarage/models/tyre_models/height_model.dart';
import 'package:mobilegarage/models/tyre_models/origin_model.dart';
import 'package:mobilegarage/models/tyre_models/pattern_model.dart';
import 'package:mobilegarage/models/tyre_models/size_model.dart';
import 'package:mobilegarage/models/tyre_models/speed_rating_model.dart';
import 'package:mobilegarage/models/tyre_models/width_model.dart';
import 'package:mobilegarage/vendor_app/services/validation_services.dart';
import 'package:mobilegarage/vendor_app/utils/image_picker/image_picker.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class ProductFormController extends GetxController {
  static ProductFormController instance = Get.find();
  GetStorage box = GetStorage();
  List<File> images = [];
  List<String> base64Images = [];
  //TODO: SERVICE TYPE VARIABLE AND FUNCTION
  List<Map<String, dynamic>> serviceTypeList = [];
  TextEditingController serviceTypeName = TextEditingController();
  TextEditingController serviceTypePrice = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<Map<String, String>> options = [];

  //* ADD Servie Type In list
  // addExtras() {
  //   final serviceTypeNameErrorString =
  //       validateFields("Service Type", serviceTypeName.text);
  //   final serviceTypePriceErrorString =
  //       validateFields("Service Type Price", serviceTypePrice.text);

  //   if (serviceTypeNameErrorString.isEmpty &&
  //       serviceTypePriceErrorString.isEmpty) {
  //     serviceTypeList.add({
  //       'type': serviceTypeName.text,
  //       'price': serviceTypePrice.text,
  //     });
  //     serviceTypeName.clear();
  //     serviceTypePrice.clear();
  //     update();
  //   }
  //   FocusScope.of(Get.context!).unfocus();
  //   update();
  // }

  //* Remove Service Type Item From list
  void removeExtra(int index) {
    UiUtilites.confirmAlertDialog(
      title: 'Are you sure you want to delete this Service Type?',
      context: Get.context,
      onCancelTap: () {
        Get.back();
      },
      onConfirmTap: () {
        serviceTypeList.removeAt(index);
        Get.back();
        update();
      },
      cancelText: 'No'.tr,
      confirmText: 'Yes'.tr,
    );
  }

  //TODO: On Multi Image Select
  onMultipleImagePick() async {
    List<File> selectedImages = await ImageSelectorApi().selectMultipleImages();
    if (selectedImages.isNotEmpty) {
      images.addAll(selectedImages);
      update();
    }
  }

  removeSelectedImages(int index) {
    images.removeAt(index);
    Get.back();
    update();
  }

  //TODO: Error Variables
  String brandError = '';
  String categoryError = '';
  String producttypeError = '';
  String originError = '';
  String ampereError = '';
  String voltageError = '';
  String priceError = '';

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getCategories();
  }

  ProductModel? product;

// categories dropdown
  String categorysError = '';
  CategoryModel? selectedCategory;
  List<CategoryModel> categories = [];
  int? selectedCategoryId;

  getCategories() async {
    var response = await VGetCategoriesApi.getCategories();
    if (response.isNotEmpty) {
      categories = (response['allservices'] as List<dynamic>)
          .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
          .toList();

      clearbatterycomponents();
      update();
    }
  }

  void setSelectedCategory(CategoryModel? category) async {
    selectedCategory = category;
    selectedCategoryId = category?.id;

    clearbatterymodels();

    await getBrands();

    await getProductDetails();

    update();
  }

  clearbatterycomponents() {
    brands.clear();
    producttypes.clear();
    batteryOrigins.clear();
    batteryAmperes.clear();
    batteryVoltages.clear();
  }

  clearbatterymodels() {
    selectedBrand = null;
    selectedBrandId = null;
    selectedproducttype = null;
    selectedProducttypeId = null;
    selectedbatteryOrigin = null;
    selectedbatteryOriginId = null;
    selectedampere = null;
    selectedampereId = null;
    selectedvoltage = null;
    selectedvoltageId = null;
  }

// brands dropdown
  BrandModel? selectedBrand;
  List<BrandModel> brands = [];
  int? selectedBrandId;

  getBrands() async {
    var response =
        await VGetBrandsApi.getBrands(id: selectedCategoryId.toString());
    if (response.isNotEmpty) {
      brands = (response['brands'] as List<dynamic>)
          .map((item) => BrandModel.from(item as Map<String, dynamic>))
          .toList();
      update();
    }
  }

  void setSelectedBrands(BrandModel? brands) async {
    selectedBrand = brands;
    selectedBrandId = brands?.id;

    update();
  }

  ProductDetailModel? productdetails;
//
  List<BatteryProductTypeModel> producttypes = [];
  BatteryProductTypeModel? selectedproducttype;
  int? selectedProducttypeId;

  void setSelectedproducttype(BatteryProductTypeModel? producttype) async {
    selectedproducttype = producttype;
    selectedProducttypeId = producttype?.id;
    update();
  }

//
  List<BatteryOriginModel> batteryOrigins = [];
  BatteryOriginModel? selectedbatteryOrigin;
  int? selectedbatteryOriginId;

  void setSelectedBatteryOrigin(BatteryOriginModel? origin) async {
    selectedbatteryOrigin = origin;
    selectedbatteryOriginId = origin?.id;
    update();
  }

  //
  List<BatteryAmpereModel> batteryAmperes = [];
  BatteryAmpereModel? selectedampere;
  int? selectedampereId;

  void setSelectedBatteryAmpere(BatteryAmpereModel? ampere) async {
    selectedampere = ampere;
    selectedampereId = ampere?.id;
    update();
  }

  //
  List<BatteryVoltageModel> batteryVoltages = [];
  BatteryVoltageModel? selectedvoltage;
  int? selectedvoltageId;
  void setSelectedBatteryvoltage(BatteryVoltageModel? voltage) async {
    selectedvoltage = voltage;
    selectedvoltageId = voltage?.id;
    update();
  }
  ///////////////////////////                                        ////////////////////////////////////
  ///////////////////////////            Tyre data                   ////////////////////////////////////
  ///////////////////////////                                        ////////////////////////////////////

  List<TyreWidthModel> tyrewidths = [];
  TyreWidthModel? selectedwidth;
  int? selectedwidthId;
  void setSelectedWidth(TyreWidthModel? width) async {
    selectedwidth = width;
    selectedwidthId = width?.id;
    update();
  }

  //
  List<TyreHeightModel> tyreheights = [];
  TyreHeightModel? selectedheight;
  int? selectedheightId;
  void setSelectedheight(TyreHeightModel? height) async {
    selectedheight = height;
    selectedheightId = height?.id;
    update();
  }

  //
  List<TyreSizeModel> tyresizes = [];
  TyreSizeModel? selectedsize;
  int? selectedsizeId;
  void setSelectedSize(TyreSizeModel? size) async {
    selectedsize = size;
    selectedsizeId = size?.id;
    update();
  }

  //
  List<TyreOriginModel> tyreorigins = [];
  TyreOriginModel? selectedtyreorigin;
  int? selectedtyreoriginId;
  void setSelectedTyreOrigin(TyreOriginModel? origin) async {
    selectedtyreorigin = origin;
    selectedtyreoriginId = origin?.id;
    update();
  } //

  List<TyreSpeedRatingModel> tyreSpeedRatings = [];
  TyreSpeedRatingModel? selectedSpeedRating;
  int? selectedSpeedRatingId;
  void setSelectedSpeedRating(TyreSpeedRatingModel? rating) async {
    selectedSpeedRating = rating;
    selectedSpeedRatingId = rating?.id;
    update();
  } //

  List<TyrePatternModel> tyrepattterens = [];
  TyrePatternModel? selectedpatteren;
  int? selectedpatterenId;
  void setSelectedPatteren(TyrePatternModel? patteren) async {
    selectedpatteren = patteren;
    selectedpatterenId = patteren?.id;
    update();
  }

  // battery detail
  getProductDetails() async {
    var response = await VProductDetailApi.getProductDetails(
        id: selectedCategoryId.toString());
    if (response.isNotEmpty) {
      productdetails = ProductDetailModel.from(response['productDetails']);
      String categoryId = selectedCategoryId.toString();
      switch (categoryId) {
        case '5':
          // Map battery product types
          if (response['productDetails']['battery_product_type'] != null) {
            producttypes = (response['productDetails']['battery_product_type']
                    as List<dynamic>)
                .map((item) => BatteryProductTypeModel.from(item))
                .toList();
          }
          // Map battery origins
          if (response['productDetails']['battery_origin'] != null) {
            batteryOrigins =
                (response['productDetails']['battery_origin'] as List<dynamic>)
                    .map((item) => BatteryOriginModel.from(item))
                    .toList();
          }
          // Map battery amperes
          if (response['productDetails']['battery_ampere'] != null) {
            batteryAmperes =
                (response['productDetails']['battery_ampere'] as List<dynamic>)
                    .map((item) => BatteryAmpereModel.from(item))
                    .toList();
          }
          // Map battery voltages
          if (response['productDetails']['battery_voltage'] != null) {
            batteryVoltages =
                (response['productDetails']['battery_voltage'] as List<dynamic>)
                    .map((item) => BatteryVoltageModel.from(item))
                    .toList();
          }
          update();
          break;
        case '6':
          // Map tyre widths types
          if (response['productDetails']['tyer_width'] != null) {
            tyrewidths =
                (response['productDetails']['tyer_width'] as List<dynamic>)
                    .map((item) => TyreWidthModel.from(item))
                    .toList();
          }
          // Map tyre height
          if (response['productDetails']['tyer_height'] != null) {
            tyreheights =
                (response['productDetails']['tyer_height'] as List<dynamic>)
                    .map((item) => TyreHeightModel.from(item))
                    .toList();
          }
          // Map tyres sizes
          if (response['productDetails']['tyer_size'] != null) {
            tyresizes =
                (response['productDetails']['tyer_size'] as List<dynamic>)
                    .map((item) => TyreSizeModel.from(item))
                    .toList();
          }
          // Map tyre speed ratings
          if (response['productDetails']['tyer_speed_rating'] != null) {
            tyreSpeedRatings = (response['productDetails']['tyer_speed_rating']
                    as List<dynamic>)
                .map((item) => TyreSpeedRatingModel.from(item))
                .toList();
          }
          // Map tyre origins
          if (response['productDetails']['tyer_origin'] != null) {
            tyreorigins =
                (response['productDetails']['tyer_origin'] as List<dynamic>)
                    .map((item) => TyreOriginModel.from(item))
                    .toList();
          } // Map tyre patterens
          if (response['productDetails']['tyer_pattren'] != null) {
            tyrepattterens =
                (response['productDetails']['tyer_pattren'] as List<dynamic>)
                    .map((item) => TyrePatternModel.from(item))
                    .toList();
          }
          update();

          break;
        default:
          print('Unknown category id');
          break;
      }
    }
  }

  //TODO: INPUT VALIDATIONS
  String validateFields(String fieldName, value) {
    switch (fieldName) {
      case 'Category':
        categoryError = Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return categoryError;
      case 'Brand':
        brandError = Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return brandError;
      case 'Price':
        priceError = Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return priceError;

      case 'producttype':
        producttypeError =
            Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return producttypeError;

      case 'origin':
        originError = Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return originError;

      case 'ampere':
        ampereError = Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return ampereError;
      case 'voltage':
        voltageError = Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return voltageError;

      default:
        return '';
    }
  }

  //TODO: FORGOT VALIDATION
  Future<bool> validateForm() async {
    if (selectedCategoryId == null) {
      categoryError = 'Please select an category';
      update();
    } else {
      categoryError = '';
      update();
    }
    //
    if (selectedBrandId == null) {
      brandError = 'Please select an brand';
      update();
    } else {
      brandError = '';
      update();
    }
    //
    if (selectedProducttypeId == null) {
      producttypeError = 'Please select an product tpye';
      update();
    } else {
      producttypeError = '';
      update();
    }

    //
    if (selectedbatteryOriginId == null) {
      originError = 'Please select an battery origin';
      update();
    } else {
      originError = '';
      update();
    }
    //
    if (selectedampereId == null) {
      ampereError = 'Please select an battery ampere';
      update();
    } else {
      ampereError = '';
      update();
    } //
    if (selectedvoltageId == null) {
      voltageError = 'Please select an battery voltage';
      update();
    } else {
      voltageError = '';
      update();
    }

    final priceErrorString = validateFields('Price', priceController.text);

    return categoryError.isEmpty &&
        brandError.isEmpty &&
        priceErrorString.isEmpty &&
        producttypeError.isEmpty &&
        ampereError.isEmpty &&
        voltageError.isEmpty &&
        originError.isEmpty;
  }

  //TODO: Forgot Function
  addProduct() async {
    // if (await validateForm()) {
    base64Images = [];
    update();
    if (images.isNotEmpty) {
      for (File imageFile in images) {
        List<int> imageBytes = await imageFile.readAsBytes();
        String base64Image = base64Encode(imageBytes);
        base64Images.add(base64Image);
      }
    }
    String categoryId = selectedCategoryId.toString();
    var response;

    switch (categoryId) {
      case '5':
        response = await VAddProductApi.addBatteryProduct(
          categoryid: selectedCategoryId.toString(),
          brandid: selectedBrandId.toString(),
          producttypeid: selectedProducttypeId.toString(),
          originid: selectedbatteryOriginId.toString(),
          ampereid: selectedampereId.toString(),
          voltageid: selectedvoltageId.toString(),
          price: priceController.text,
          description: descriptionController.text,
          images: base64Images,
        );
        update();
        break;
      case '6':
        response = await VAddProductApi.addTyreProduct(
          categoryid: selectedCategoryId.toString(),
          brandid: selectedBrandId.toString(),
          widthid: selectedwidthId.toString(),
          heightid: selectedheightId.toString(),
          sizeid: selectedsizeId.toString(),
          speedratingid: selectedSpeedRatingId.toString(),
          price: priceController.text,
          originid: selectedtyreoriginId.toString(),
          patterenid: selectedpatterenId.toString(),
          images: base64Images,

        );
        update();

        break;
      default:
        print('Unknown category id');
        break;
    }

    if (response.isNotEmpty) {
      update();
      UiUtilites.successSnackbar('Product added successfully', 'Congrats');
      Get.back();
    }
    // }
  }

  // add brand
  TextEditingController nameController = TextEditingController();

  addBrand() async {
    var response = await VAddBrandsApi.addBrands(
        id: selectedCategoryId.toString(), name: nameController.text);
    if (response.isNotEmpty) {
      getBrands();
      nameController.clear();
      selectedBrand = null;
      selectedBrandId = null;
      update();
      Get.back();
      UiUtilites.ProductPendingDialog(Get.context!);
    }
  }
}
