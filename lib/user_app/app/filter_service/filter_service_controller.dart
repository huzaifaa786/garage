// ignore_for_file: avoid_print, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilegarage/apis/user_apis/categories/user_get_categories_api.dart';
import 'package:mobilegarage/apis/user_apis/order_vehicles_apis/filter_order_api.dart';
import 'package:mobilegarage/apis/user_apis/order_vehicles_apis/order_vehicles_api.dart';
import 'package:mobilegarage/models/battery_models/ampere_model.dart';
import 'package:mobilegarage/models/battery_models/origin_model.dart';
import 'package:mobilegarage/models/battery_models/product_type_model.dart';
import 'package:mobilegarage/models/battery_models/voltage_model.dart';
import 'package:mobilegarage/models/brand_model.dart';
import 'package:mobilegarage/models/garage_model.dart';
import 'package:mobilegarage/models/oil_models/extra_model.dart';
import 'package:mobilegarage/models/oil_models/product_type_model.dart';
import 'package:mobilegarage/models/oil_models/volume_model.dart';
import 'package:mobilegarage/models/product_detail_model.dart';
import 'package:mobilegarage/models/tyre_models/height_model.dart';
import 'package:mobilegarage/models/tyre_models/origin_model.dart';
import 'package:mobilegarage/models/tyre_models/pattern_model.dart';
import 'package:mobilegarage/models/tyre_models/size_model.dart';
import 'package:mobilegarage/models/tyre_models/speed_rating_model.dart';
import 'package:mobilegarage/models/tyre_models/width_model.dart';
import 'package:mobilegarage/models/user_vehicles.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class FilterServiceController extends GetxController {
  static FilterServiceController instance = Get.find();

  GetStorage box = GetStorage();
  List<File> images = [];
  List<String> base64Images = [];

  List<Map<String, dynamic>> serviceTypeList = [];

  double start = 0.0;
  double end = 50.0;
  String? categoryId;

  @override
  void onInit() async {
    super.onInit();
    categoryId = Get.parameters['categoryId'] ?? '';
    await getvehicles();
    await getUserCategories();
    update();
  }

  getUserCategories() async {
    var response = await UserGetCategoriesApi.getUserCategories(id: categoryId);
    if (response.isNotEmpty) {
      productdetails = ProductDetailModel.from(response['servicedetail']);

      switch (categoryId) {
        case '6':
          if (response['servicedetail']['brands'] != null) {
            brands = (response['servicedetail']['brands'] as List<dynamic>)
                .map((item) => BrandModel.from(item as Map<String, dynamic>))
                .toList();
          }
          // Map battery product types
          if (response['servicedetail']['battery_product_type'] != null) {
            producttypes = (response['servicedetail']['battery_product_type']
                    as List<dynamic>)
                .map((item) => BatteryProductTypeModel.from(item))
                .toList();
          }
          // Map battery origins
          if (response['servicedetail']['battery_origin'] != null) {
            batteryOrigins =
                (response['servicedetail']['battery_origin'] as List<dynamic>)
                    .map((item) => BatteryOriginModel.from(item))
                    .toList();
          }
          // Map battery amperes
          if (response['servicedetail']['battery_ampere'] != null) {
            batteryAmperes =
                (response['servicedetail']['battery_ampere'] as List<dynamic>)
                    .map((item) => BatteryAmpereModel.from(item))
                    .toList();
          }
          // Map battery voltages
          if (response['servicedetail']['battery_voltage'] != null) {
            batteryVoltages =
                (response['servicedetail']['battery_voltage'] as List<dynamic>)
                    .map((item) => BatteryVoltageModel.from(item))
                    .toList();
          }
          update();
          break;
        case '3':
          if (response['servicedetail']['brands'] != null) {
            brands = (response['servicedetail']['brands'] as List<dynamic>)
                .map((item) => BrandModel.from(item as Map<String, dynamic>))
                .toList();
          }
          // Map tyre widths types
          if (response['servicedetail']['tyer_width'] != null) {
            tyrewidths =
                (response['servicedetail']['tyer_width'] as List<dynamic>)
                    .map((item) => TyreWidthModel.from(item))
                    .toList();
          }
          // Map tyre height
          if (response['servicedetail']['tyer_height'] != null) {
            tyreheights =
                (response['servicedetail']['tyer_height'] as List<dynamic>)
                    .map((item) => TyreHeightModel.from(item))
                    .toList();
          }
          // Map tyres sizes
          if (response['servicedetail']['tyer_size'] != null) {
            tyresizes =
                (response['servicedetail']['tyer_size'] as List<dynamic>)
                    .map((item) => TyreSizeModel.from(item))
                    .toList();
          }
          // Map tyre speed ratings
          if (response['servicedetail']['tyer_speed_rating'] != null) {
            tyreSpeedRatings = (response['servicedetail']['tyer_speed_rating']
                    as List<dynamic>)
                .map((item) => TyreSpeedRatingModel.from(item))
                .toList();
          }
          // Map tyre origins
          if (response['servicedetail']['tyer_origin'] != null) {
            tyreorigins =
                (response['servicedetail']['tyer_origin'] as List<dynamic>)
                    .map((item) => TyreOriginModel.from(item))
                    .toList();
          } // Map tyre patterens
          if (response['servicedetail']['tyer_pattren'] != null) {
            tyrepattterens =
                (response['servicedetail']['tyer_pattren'] as List<dynamic>)
                    .map((item) => TyrePatternModel.from(item))
                    .toList();
          }
          update();

          break;
        case '2':
          if (response['servicedetail']['brands'] != null) {
            brands = (response['servicedetail']['brands'] as List<dynamic>)
                .map((item) => BrandModel.from(item as Map<String, dynamic>))
                .toList();
          }
          // Map oil product types
          if (response['servicedetail']['oil_product_type'] != null) {
            oilproductTypes =
                (response['servicedetail']['oil_product_type'] as List<dynamic>)
                    .map((item) => OilProductTTypeModel.from(item))
                    .toList();
          }
          // Map oil volumes
          if (response['servicedetail']['oil_volume'] != null) {
            oilVolumes =
                (response['servicedetail']['oil_volume'] as List<dynamic>)
                    .map((item) => OilVolumeModel.from(item))
                    .toList();
          }
          // Map oil extras
          if (response['servicedetail']['service_extra'] != null) {
            oilextras =
                (response['servicedetail']['service_extra'] as List<dynamic>)
                    .map((item) => OilExtraModel.from(item))
                    .toList();
          }
          break;
        case '4':
          // Map road assistance  extras
          if (response['servicedetail']['service_extra'] != null) {
            oilextras =
                (response['servicedetail']['service_extra'] as List<dynamic>)
                    .map((item) => OilExtraModel.from(item))
                    .toList();
          }
          break;
        case '7':
          // Map road assistance  extras
          if (response['servicedetail']['service_extra'] != null) {
            oilextras =
                (response['servicedetail']['service_extra'] as List<dynamic>)
                    .map((item) => OilExtraModel.from(item))
                    .toList();
            update();
          }
          break;
        case '9':
          // Map fuel  extras
          if (response['servicedetail']['service_extra'] != null) {
            oilextras =
                (response['servicedetail']['service_extra'] as List<dynamic>)
                    .map((item) => OilExtraModel.from(item))
                    .toList();
            update();
          }
          break;
        case '1':
          // Map car wash  extras
          if (response['servicedetail']['service_extra'] != null) {
            oilextras =
                (response['servicedetail']['service_extra'] as List<dynamic>)
                    .map((item) => OilExtraModel.from(item))
                    .toList();
            update();
          }
          break;
        case '8':
          // Map ac  extras
          if (response['servicedetail']['service_extra'] != null) {
            oilextras =
                (response['servicedetail']['service_extra'] as List<dynamic>)
                    .map((item) => OilExtraModel.from(item))
                    .toList();
            update();
          }
          break;
        default:
          print('Unknown category ids to map data');
          break;
      }
      update();
    }
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
  }
  //

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

  //
  List<OilVolumeModel> oilVolumes = [];
  OilVolumeModel? selectedvolume;
  int? selectedVolumeId;
  void setSelectedVolume(OilVolumeModel? volume) async {
    selectedvolume = volume;
    selectedVolumeId = volume?.id;
    update();
  }

  //  all model have same data so i am passing all extra data in one oil extra model

  List<OilExtraModel> oilextras = [];
  OilExtraModel? selectedexra;
  int? selectedExtraId;
  void setSelectedExtra(OilExtraModel? volume) async {
    selectedexra = volume;
    selectedExtraId = volume?.id;
    update();
  }
  /////////////////////////////                                        ////////////////////////////////////
  ///////////////////////////            Road Assistance  data                   ////////////////////////////////////
  ///////////////////////////                                        ////////////////////////////////////

  // List<RoadAssistanceExtraModel> roadAssistanceExtras = [];

/////////////////////////////                                        ////////////////////////////////////
  ///////////////////////////            Recovery  data                   ////////////////////////////////////
  ///////////////////////////                                        ////////////////////////////////////

  // List<RecoveryExtraModel> recoveryExtras = [];

  /////////////////////////////                                        ////////////////////////////////////
  ///////////////////////////            fuel  data                   ////////////////////////////////////
  ///////////////////////////                                        ////////////////////////////////////

  // List<FuelExtraModel> fuelExtras = [];

  /////////////////////////////                                        ////////////////////////////////////
  ///////////////////////////            car wash  data                   ////////////////////////////////////
  ///////////////////////////                                        ////////////////////////////////////

  // List<CarWashExtraModel> carwashExtras = [];

/////////////////////////////                                        ////////////////////////////////////
  ///////////////////////////            ac  data                   ////////////////////////////////////
  ///////////////////////////                                        ////////////////////////////////////

  // List<AcExtraModel> acExtras = [];

  // void setSelectedCategory(CategoryModel? category) async {
  //   selectedCategory = category;
  //   selectedCategoryId = category?.id;

  //   clearbatterymodels();
  //   // if (selectedCategoryId != 7) {
  //   //   await getBrands();
  //   // }

  //   await getProductDetails();

  //   update();
  // }

  // clearbatterycomponents() {
  //   brands.clear();
  //   producttypes.clear();
  //   batteryOrigins.clear();
  //   batteryAmperes.clear();
  //   batteryVoltages.clear();
  // }

  // clearbatterymodels() {
  //   selectedBrand = null;
  //   selectedBrandId = null;
  //   selectedproducttype = null;
  //   selectedProducttypeId = null;
  //   selectedbatteryOrigin = null;
  //   selectedbatteryOriginId = null;
  //   selectedampere = null;
  //   selectedampereId = null;
  //   selectedvoltage = null;
  //   selectedvoltageId = null;
  // }

  List<UserVehicles> vehiclesList = [];
  final ordervehiclesapi = OrderVehiclesApi();
  getvehicles() async {
    var response = await ordervehiclesapi.getvehicles();
    if (response.isNotEmpty) {
      vehiclesList = (response['user_vehicles'] as List<dynamic>)
          .map((item) => UserVehicles.fromJson(item as Map<String, dynamic>))
          .toList();
      if (vehiclesList.isNotEmpty) {
        selectedCarName = vehiclesList.first.id.toString();
      }
      update();
    }
  }

  String selectedCarName = '';
  //! Method to select a car
  void selectCar(String carName) {
    selectedCarName = carName;
    update();
  }

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
    var response;

    switch (categoryId) {
      case '6':
        response = await FilterOrderApi.filterBatteryOrder(
          startprice: start.toString(),
          endprice: end.toString(),
          brandid: selectedBrandId.toString(),
          categoryid: categoryId.toString(),
          originid: selectedbatteryOriginId.toString(),
          ampereid: selectedampereId.toString(),
          productid: selectedProducttypeId.toString(),
          voltageid: selectedvoltageId.toString(),
        );
        update();
        break;
      case '3':
        response = await FilterOrderApi.filterTyreOrder(
          startprice: start.toString(),
          endprice: end.toString(),
          brandid: selectedBrandId.toString(),
          categoryid: categoryId.toString(),
          widthid: selectedwidthId.toString(),
          heightid: selectedheightId.toString(),
          sizeid: selectedsizeId.toString(),
          originid: selectedtyreoriginId.toString(),
          patterenid: selectedpatterenId.toString(),
          speedratingid: selectedSpeedRatingId.toString(),
        );
        update();

        break;
      case '2':
        response = await FilterOrderApi.filterOilOrder(
          startprice: start.toString(),
          endprice: end.toString(),
          brandid: selectedBrandId.toString(),
          categoryid: categoryId.toString(),
          productid: selectedoilproductTypeId.toString(),
          voilumeid: selectedVolumeId.toString(),
          extraid: selectedExtraId.toString(),
        );
        update();
        break;

      case '1':
      case '4':
      case '7':
      case '8':
      case '9':
        response = await FilterOrderApi.filterexraOrder(
          startprice: start.toString(),
          endprice: end.toString(),
          categoryextraid: selectedExtraId.toString(),
          categoryid: categoryId.toString(),
        );
        update();
        break;
      default:
        print('Unknown category id');
        break;
    }

    if (response.isNotEmpty) {
      garages = (response['garages'] as List<dynamic>)
          .map((item) => GarageModel.fromJson(item as Map<String, dynamic>))
          .toList();

      await fetchGarageAddresses();
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

// brands dropdown
  BrandModel? selectedBrand;
  List<BrandModel> brands = [];
  int? selectedBrandId;

  void setSelectedBrands(BrandModel? brands) async {
    selectedBrand = brands;
    selectedBrandId = brands?.id;

    update();
  }

//////////////////////////////////////////////
  ///

  bool isSelected = false;
  int? selectedGarageIndex;
  void toggleSelection(int index) {
    if (selectedGarageIndex == index) {
      selectedGarageIndex = null; 
    } else {
      selectedGarageIndex = index; 
    }
    update(); 
  }
  

  double ratings = 0.0;
  void updateRating(double rating) {
    ratings = rating;
    update();
  }

  List<GarageModel> garages = [];

  List<Map<String, String?>> garageAddresses = [];
  String? location;
  String? city;

  Future<Map<String, String?>> getAddress(int index) async {
    final latDouble = double.parse(garages[index].lat!);
    final lngDouble = double.parse(garages[index].lng!);
    final placemark = await placemarkFromCoordinates(latDouble, lngDouble);
    if (placemark.isNotEmpty) {
      final locationData = placemark.first;
      location =
          '${locationData.thoroughfare}${locationData.subLocality}, ${locationData.locality}, ${locationData.country}.';
      city = locationData.locality;
    }
    return {
      'location': location,
      'city': city,
    };
  }

  fetchGarageAddresses() async {
    for (int i = 0; i < garages.length; i++) {
      final address = await getAddress(i);
      print('aaaaaaaaaaaaav$address');
      garageAddresses.add(address);
      update();
    }
  }
}
