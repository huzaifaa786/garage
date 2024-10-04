// ignore_for_file: avoid_print, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilegarage/apis/user_apis/categories/user_get_categories_api.dart';
import 'package:mobilegarage/apis/user_apis/order_vehicles_apis/filter_order_api.dart';
import 'package:mobilegarage/apis/user_apis/order_vehicles_apis/order_vehicles_api.dart';
import 'package:mobilegarage/apis/user_apis/order_vehicles_apis/product_vehicles.dart';
import 'package:mobilegarage/apis/vender_apis/products/add_product_apis/add_product_api.dart';
import 'package:mobilegarage/apis/vender_apis/products/add_product_apis/brands/add_brand_api.dart';
import 'package:mobilegarage/apis/vender_apis/products/add_product_apis/brands/get_brands_api.dart';
import 'package:mobilegarage/apis/vender_apis/products/add_product_apis/categories/get_categories_api.dart';
import 'package:mobilegarage/apis/vender_apis/products/add_product_apis/product_detail_apis/product_detail_api.dart';
import 'package:mobilegarage/models/battery_models/ampere_model.dart';
import 'package:mobilegarage/models/battery_models/origin_model.dart';
import 'package:mobilegarage/models/battery_models/product_type_model.dart';
import 'package:mobilegarage/models/battery_models/voltage_model.dart';
import 'package:mobilegarage/models/brand_model.dart';
import 'package:mobilegarage/models/category_model.dart';
import 'package:mobilegarage/models/fuel_models/fuel_extra_model.dart';
import 'package:mobilegarage/models/oil_models/extra_model.dart';
import 'package:mobilegarage/models/oil_models/product_type_model.dart';
import 'package:mobilegarage/models/oil_models/volume_model.dart';
import 'package:mobilegarage/models/product_detail_model.dart';
import 'package:mobilegarage/models/recovery_models/recovery_extra_model.dart';
import 'package:mobilegarage/models/road_assistance_models/road_extra_model.dart';
import 'package:mobilegarage/models/tyre_models/height_model.dart';
import 'package:mobilegarage/models/tyre_models/origin_model.dart';
import 'package:mobilegarage/models/tyre_models/pattern_model.dart';
import 'package:mobilegarage/models/tyre_models/size_model.dart';
import 'package:mobilegarage/models/tyre_models/speed_rating_model.dart';
import 'package:mobilegarage/models/tyre_models/width_model.dart';
import 'package:mobilegarage/models/user_vehicles.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  // TextEditingController priceController = TextEditingController();
  // TextEditingController serviceController = TextEditingController();
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

  double start = 0.0;
  double end = 50.0;
  String? categoryId;
  int? selectedCategoryId;
  String categorysError = '';
  CategoryModel? selectedCategory;
  List<CategoryModel> categories = [];
  String brandError = '';
  String categoryError = '';
  String priceError = '';
  String descriptionError = '';

  // battery errors
  String producttypeError = '';
  String originError = '';
  String ampereError = '';
  String voltageError = '';

// tyre errors
  String widthError = '';
  String heightError = '';
  String sizeError = '';
  String speedratingError = '';
  String tyreoriginError = '';
  String patterenError = '';

// oil errors
  String oilproductTypeError = '';
  String volumeError = '';

  @override
  getUserCategories() async {
    var response = await UserGetCategoriesApi.getUserCategories(id: categoryId);
    if (response.isNotEmpty) {
      categories = (response['servicedetail'] as List<dynamic>)
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
    if (selectedCategoryId != 7) {
      await getBrands();
    }

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

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    categoryId = Get.parameters['categoryId'] ?? '';
    await getUserCategories();
    // await productDetails();
    // await getBrands();

    update();
    // getvehicles();
  }

  List<UserVehicles> vehiclesList = [];
  final ordervehiclesapi = OrderVehiclesApi();
  getvehicles() async {
    var response = await ordervehiclesapi.getvehicles();
    if (response.isNotEmpty) {
      vehiclesList = (response['user_vehicles'] as List<dynamic>)
          .map((item) => UserVehicles.fromJson(item as Map<String, dynamic>))
          .toList();

      update();
    }
  }

  String selectedCarName = '';
  //! Method to select a car
  void selectCar(String carName) {
    selectedCarName = carName;
    update();
  }

  //! List for car names
  final List<String> carNames = [
    'Mercedes-Benz',
    'Mercedes-Benz SL-Class',
  ];
  String selectedgarageName = 'Select garage';
  //! Method to select a garage
  void selectGarage(String garageName) {
    selectedgarageName = garageName;
    update();
  }

//! List for garage names
  final List<String> garageNames = [
    'Select garage',
    'Send to all garages',
  ];

  final picker = ImagePicker();
  String? vehicleImage;
  String? vehicleImageBase64;

  // Check if Image is Selected
  bool isImageSelected() {
    return vehicleImage != null;
  }

  // Convert Image to Base64
  String? convertImageToBase64(String imagePath) {
    File imageFile = File(imagePath);
    List<int> imageBytes = imageFile.readAsBytesSync();
    return base64Encode(imageBytes);
  }

  // Select Image
  Future<void> selectVehicleImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      vehicleImage = pickedFile.path;
      vehicleImageBase64 = convertImageToBase64(vehicleImage!);
      update();
    } else {
      print('No image selected.');
    }
  }

  void removeVehicleImage() {
    vehicleImage = null;
    vehicleImageBase64 = null;
    update(); // This will trigger a UI update to reflect the changes
  }

  // filter api

  filterorder() async {
    var response = await FilterOrderApi.filterOrder(
      startprice: start.toString(),
      endprice: end.toString(),
    );
    if (response.isNotEmpty) {
      print('object');

      Get.toNamed(AppRoutes.acceptedorder);
      UiUtilites.successAlertDialog(
          context: Get.context,
          onTap: () {
            Get.toNamed(AppRoutes.main);
          },
          title: 'Thank you!',
          buttontitle: 'Back to home',
          description: 'A garage will accept your order from within 3-5 min.');
    }
  }

  productDetails() async {
    var response =
        await productDetailsApi.productDetails(id: categoryId.toString());
    if (response.isNotEmpty) {
      productdetails = ProductDetailModel.from(response['productDetails']);
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
    }
  }

// brands dropdown
  BrandModel? selectedBrand;
  List<BrandModel> brands = [];
  int? selectedBrandId;

  getBrands() async {
    var response = await VGetBrandsApi.getBrands(id: categoryId.toString());
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

  List<TyreWidthModel> tyrewidths = [];
  TyreWidthModel? selectedwidth;
  int? selectedwidthId;
  void setSelectedWidth(TyreWidthModel? width) async {
    selectedwidth = width;
    selectedwidthId = width?.id;
    update();
  }

  List<TyreHeightModel> tyreheights = [];
  TyreHeightModel? selectedheight;
  int? selectedheightId;
  void setSelectedheight(TyreHeightModel? height) async {
    selectedheight = height;
    selectedheightId = height?.id;
    update();
  }

  List<TyreSizeModel> tyresizes = [];
  TyreSizeModel? selectedsize;
  int? selectedsizeId;
  void setSelectedSize(TyreSizeModel? size) async {
    selectedsize = size;
    selectedsizeId = size?.id;
    update();
  }

  List<TyreOriginModel> tyreorigins = [];
  TyreOriginModel? selectedtyreorigin;
  int? selectedtyreoriginId;
  void setSelectedTyreOrigin(TyreOriginModel? origin) async {
    selectedtyreorigin = origin;
    selectedtyreoriginId = origin?.id;
    update();
  }

  //
  List<TyreSpeedRatingModel> tyreSpeedRatings = [];
  TyreSpeedRatingModel? selectedSpeedRating;
  int? selectedSpeedRatingId;
  void setSelectedSpeedRating(TyreSpeedRatingModel? rating) async {
    selectedSpeedRating = rating;
    selectedSpeedRatingId = rating?.id;
    update();
  }

  List<TyrePatternModel> tyrepattterens = [];
  TyrePatternModel? selectedpatteren;
  int? selectedpatterenId;
  void setSelectedPatteren(TyrePatternModel? patteren) async {
    selectedpatteren = patteren;
    selectedpatterenId = patteren?.id;
    update();
  }
  /////////////////////////////                                        ////////////////////////////////////
  ///////////////////////////            Oil data                   ////////////////////////////////////
  ///////////////////////////                                        ////////////////////////////////////

  List<OilProductTTypeModel> oilproductTypes = [];
  OilProductTTypeModel? selectedoilproductType;
  int? selectedoilproductTypeId;
  void setSelectedOilproducttype(OilProductTTypeModel? productType) async {
    selectedoilproductType = productType;
    selectedoilproductTypeId = productType?.id;
    update();
  }

  List<OilVolumeModel> oilVolumes = [];
  OilVolumeModel? selectedvolume;
  int? selectedVolumeId;
  void setSelectedVolume(OilVolumeModel? volume) async {
    selectedvolume = volume;
    selectedVolumeId = volume?.id;
    update();
  }

  List<OilExtraModel> oilextras = [];

  /////////////////////////////                                        ////////////////////////////////////
  ///////////////////////////            Road Assistance  data                   ////////////////////////////////////
  ///////////////////////////                                        ////////////////////////////////////

  List<RoadAssistanceExtraModel> roadAssistanceExtras = [];

/////////////////////////////                                        ////////////////////////////////////
  ///////////////////////////            Recovery  data                   ////////////////////////////////////
  ///////////////////////////                                        ////////////////////////////////////

  List<RecoveryExtraModel> recoveryExtras = [];

/////////////////////////////                                        ////////////////////////////////////
  ///////////////////////////            fuel  data                   ////////////////////////////////////
  ///////////////////////////                                        ////////////////////////////////////

  List<FuelExtraModel> fuelExtras = [];
  // product detail
  getProductDetails() async {
    var response = await VProductDetailApi.getProductDetails(
        id: selectedCategoryId.toString());
    if (response.isNotEmpty) {
      productdetails = ProductDetailModel.from(response['productDetails']);
      String categoryId = selectedCategoryId.toString();
      switch (categoryId) {
        case '6':
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
        case '3':
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
          }
          if (response['productDetails']['tyer_pattren'] != null) {
            tyrepattterens =
                (response['productDetails']['tyer_pattren'] as List<dynamic>)
                    .map((item) => TyrePatternModel.from(item))
                    .toList();
          }
          update();

          break;
        case '2':
          // Map oil product types
          if (response['productDetails']['oil_product_type'] != null) {
            oilproductTypes = (response['productDetails']['oil_product_type']
                    as List<dynamic>)
                .map((item) => OilProductTTypeModel.from(item))
                .toList();
          }
          // Map oil volumes
          if (response['productDetails']['oil_volume'] != null) {
            oilVolumes =
                (response['productDetails']['oil_volume'] as List<dynamic>)
                    .map((item) => OilVolumeModel.from(item))
                    .toList();
          }
          // Map oil extras
          if (response['productDetails']['service_extra'] != null) {
            oilextras =
                (response['productDetails']['service_extra'] as List<dynamic>)
                    .map((item) => OilExtraModel.from(item))
                    .toList();
          }
          break;
        case '4':
          // Map road assistance  extras
          if (response['productDetails']['service_extra'] != null) {
            roadAssistanceExtras =
                (response['productDetails']['service_extra'] as List<dynamic>)
                    .map((item) => RoadAssistanceExtraModel.from(item))
                    .toList();
          }
          break;
        case '7':
          // Map road assistance  extras
          if (response['productDetails']['service_extra'] != null) {
            recoveryExtras =
                (response['productDetails']['service_extra'] as List<dynamic>)
                    .map((item) => RecoveryExtraModel.from(item))
                    .toList();
            update();
          }
          break;
        case '9':
          // Map fuel  extras
          if (response['productDetails']['service_extra'] != null) {
            fuelExtras =
                (response['productDetails']['service_extra'] as List<dynamic>)
                    .map((item) => FuelExtraModel.from(item))
                    .toList();
            update();
          }
          break;
        default:
          print('Unknown category ids');
          break;
      }
    }
  }
  //

  Map<int, String> roadextrapriceErrors = {};
  Map<int, String> roadextratimeErrors = {};
  Future<bool> validateRoadAssistanceForm() async {
    if (selectedCategoryId == null) {
      categoryError = 'Please select category';
      update();
    } else {
      categoryError = '';
      update();
    }

    //
    roadextrapriceErrors.clear();
    for (int i = 0; i < roadAssistanceExtras.length; i++) {
      var extra = roadAssistanceExtras[i];
      if (extra.price == null || extra.price!.isEmpty) {
        roadextrapriceErrors[i] = 'Extra Price is required';
      } else {
        roadextrapriceErrors.remove(i);
      }
    }
    //
    roadextratimeErrors.clear();

    for (int i = 0; i < roadAssistanceExtras.length; i++) {
      var extra = roadAssistanceExtras[i];
      if (extra.time == null || extra.time!.isEmpty) {
        roadextratimeErrors[i] = 'Extra Time is required';
      } else {
        roadextratimeErrors.remove(i);
      }
    }
    return categoryError.isEmpty &&
        roadextrapriceErrors.isEmpty &&
        roadextratimeErrors.isEmpty;
  }

  Map<int, String> recoveryextrapriceErrors = {};
  Map<int, String> recoveryextratimeErrors = {};
  Future<bool> validateRecoveryForm() async {
    if (selectedCategoryId == null) {
      categoryError = 'Please select category';
      update();
    } else {
      categoryError = '';
      update();
    }

    //
    recoveryextrapriceErrors.clear();

    for (int i = 0; i < recoveryExtras.length; i++) {
      var extra = recoveryExtras[i];
      if (extra.price == null || extra.price!.isEmpty) {
        recoveryextrapriceErrors[i] = 'Extra Price is required';
      } else {
        recoveryextrapriceErrors.remove(i);
      }
    }
    //
    recoveryextratimeErrors.clear();

    for (int i = 0; i < recoveryExtras.length; i++) {
      var extra = recoveryExtras[i];
      if (extra.time == null || extra.time!.isEmpty) {
        recoveryextratimeErrors[i] = 'Extra Time is required';
      } else {
        recoveryextratimeErrors.remove(i);
      }
    }
    return categoryError.isEmpty &&
        recoveryextrapriceErrors.isEmpty &&
        recoveryextratimeErrors.isEmpty;
  }

  Map<int, String> fuelextrapriceErrors = {};
  Map<int, String> fuelextratimeErrors = {};
  Future<bool> validateFuelForm() async {
    if (selectedCategoryId == null) {
      categoryError = 'Please select category';
      update();
    } else {
      categoryError = '';
      update();
    }

    //
    fuelextrapriceErrors.clear();

    for (int i = 0; i < fuelExtras.length; i++) {
      var extra = fuelExtras[i];
      if (extra.price == null || extra.price!.isEmpty) {
        fuelextrapriceErrors[i] = 'Extra Price is required';
      } else {
        fuelextrapriceErrors.remove(i);
      }
    }
    //
    fuelextratimeErrors.clear();

    for (int i = 0; i < fuelExtras.length; i++) {
      var extra = fuelExtras[i];
      if (extra.time == null || extra.time!.isEmpty) {
        fuelextratimeErrors[i] = 'Extra Time is required';
      } else {
        fuelextratimeErrors.remove(i);
      }
    }
    return categoryError.isEmpty &&
        fuelextrapriceErrors.isEmpty &&
        fuelextratimeErrors.isEmpty;
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
      case '6':
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
      case '3':
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
      case '2':
        List<Map<String, dynamic>> includes = oilextras.where((extra) {
          return extra.price != null && extra.description != null;
        }).map((extra) {
          return {
            "category_extra_id": extra.id,
            "description": extra.description ?? '',
            "price": extra.price ?? '',
          };
        }).toList();
        response = await VAddProductApi.addOilProduct(
          categoryid: selectedCategoryId.toString(),
          brandid: selectedBrandId.toString(),
          price: priceController.text,
          description: descriptionController.text,
          producttypeid: selectedoilproductTypeId.toString(),
          volumeid: selectedVolumeId.toString(),
          includes: includes,
          images: base64Images,
        );
        update();

        break;
      case '4':
        List<Map<String, dynamic>> includes =
            roadAssistanceExtras.where((extra) {
          return extra.price != null &&
              extra.description != null &&
              extra.time != null;
        }).map((extra) {
          return {
            "category_extra_id": extra.id,
            "description": extra.description ?? '',
            "time": extra.time ?? '',
            "price": extra.price ?? '',
          };
        }).toList();
        response = await VAddProductApi.addRoadAssistanceProduct(
          categoryid: selectedCategoryId.toString(),
          includes: includes,
          images: base64Images,
        );
        update();

        break;
      case '7':
        List<Map<String, dynamic>> includes = recoveryExtras.where((extra) {
          return extra.price != null &&
              extra.description != null &&
              extra.time != null;
        }).map((extra) {
          return {
            "category_extra_id": extra.id,
            "description": extra.description ?? '',
            "time": extra.time ?? '',
            "price": extra.price ?? '',
          };
        }).toList();
        response = await VAddProductApi.addRecoveryProduct(
          categoryid: selectedCategoryId.toString(),
          includes: includes,
          images: base64Images,
        );
        update();
        break;

      case '9':
        List<Map<String, dynamic>> includes = fuelExtras.where((extra) {
          return extra.price != null &&
              extra.description != null &&
              extra.time != null;
        }).map((extra) {
          return {
            "category_extra_id": extra.id,
            "description": extra.description ?? '',
            "time": extra.time ?? '',
            "price": extra.price ?? '',
          };
        }).toList();
        response = await VAddProductApi.addRecoveryProduct(
          categoryid: selectedCategoryId.toString(),
          includes: includes,
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

  int get itemCount {
    switch (selectedCategoryId) {
      case 2:
        return oilextras.length;
      case 4:
        return roadAssistanceExtras.length;
      case 7:
        return recoveryExtras.length;
      case 9:
        return fuelExtras.length;
      default:
        return 0;
    }
  }

  Map<int, String> oilextrapriceErrors = {};

  String getPriceError(int index) {
    switch (selectedCategoryId) {
      case 2:
        return oilextrapriceErrors[index] ?? '';
      case 4:
        return roadextrapriceErrors[index] ?? '';
      case 7:
        return recoveryextrapriceErrors[index] ?? '';
      case 9:
        return fuelextrapriceErrors[index] ?? '';
      default:
        return '';
    }
  }

  String getTimeError(int index) {
    switch (selectedCategoryId) {
      case 4:
        return roadextratimeErrors[index] ?? '';
      case 7:
        return recoveryextratimeErrors[index] ?? '';
      case 9:
        return fuelextratimeErrors[index] ?? '';
      default:
        return '';
    }
  }

  String getTitle(int index) {
    switch (selectedCategoryId) {
      case 2:
        return oilextras[index].name.toString();
      case 4:
        return roadAssistanceExtras[index].name.toString();
      case 7:
        return recoveryExtras[index].name.toString();
      case 9:
        return fuelExtras[index].name.toString();
      default:
        return '';
    }
  }
}
