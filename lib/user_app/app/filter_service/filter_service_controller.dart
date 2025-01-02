// ignore_for_file: avoid_print, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilegarage/apis/user_apis/categories/user_get_categories_api.dart';
import 'package:mobilegarage/apis/user_apis/order_apis/accepted_order_api.dart';
import 'package:mobilegarage/apis/user_apis/order_vehicles_apis/filter_order_api.dart';
import 'package:mobilegarage/apis/user_apis/order_vehicles_apis/order_vehicles_api.dart';
import 'package:mobilegarage/apis/user_apis/store_vehicle_api/store_vehicle_api.dart';
import 'package:mobilegarage/apis/user_apis/order_vehicles_apis/send_allGarages_api.dart';
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
  double end = 1000.0;
  String? categoryId;
  String? path;

  @override
  void onInit() async {
    super.onInit();
    categoryId = Get.parameters['categoryId'] ?? '0';
    path = Get.parameters['path'] ?? '';
    if (path == 'filter') {
      await getvehicles();
      await getUserCategories();
    }
    if (path != 'filter') {
      await getAcceptedOrder();
    }
    update();
  }

  getAcceptedOrder() async {
    var response = await AcceptedOrderApi.getOrder();
    if (response.isNotEmpty) {
      // print('object');
      if (response.isNotEmpty) {
        garages = (response['garages'] as List<dynamic>)
            .map((item) => GarageModel.fromJson(item as Map<String, dynamic>))
            .toList();

        await fetchGarageAddresses();
      }
    }
  }
//////////////
  /// ///

  int selectedIndexPrice = 0;
  int selectedIndexClosest = 0;
  int selectedIndexRating = 0;
  int selectedIndexResults = 0;
  String selecetedPrice = '';
  String selecetedPlace = '';
  String selecetedRating = '';
  void ResetSelections() {
    selecetedPrice = '';
    selecetedPlace = '';
    selecetedRating = '';
    selectIndexPrice(0);
    selectIndexClosest(0);
    selectIndexRating(0);
    update();
  }

  void selectIndexPrice(int index) {
    selectedIndexPrice = index;
    update();
  }

  void selectIndexClosest(int index) {
    selectedIndexClosest = index;
    update();
  }

  void selectIndexRating(int index) {
    selectedIndexRating = index;

    update();
  }

  void selectIndexResults(int index) {
    selectedIndexResults = index;
    update();
  }

  void updateApplySelections() async {
    selecetedPrice = selectedIndexPrice == 0
        ? ''
        : selectedIndexPrice == 1
            ? 'From low to high'
            : 'From high to low';
    /////////
    selecetedPlace = selectedIndexClosest == 0
        ? ''
        : selectedIndexClosest == 1
            ? 'From the closest to the furthest'
            : 'Random';
    ////////////
    selecetedRating = selectedIndexRating == 0
        ? ''
        : selectedIndexRating == 1
            ? 'From high to low'
            : 'From low to high';

    update();

    // filter  with rating
    if (selectedIndexRating == 2) {
      garages.sort((a, b) => (double.tryParse(a.rating ?? '0') ?? 0)
          .compareTo(double.tryParse(b.rating ?? '0') ?? 0));
    } else if (selectedIndexRating == 1) {
      garages.sort((a, b) => (double.tryParse(b.rating ?? '0') ?? 0)
          .compareTo(double.tryParse(a.rating ?? '0') ?? 0));
    }

    // filter  with price

    if (selectedIndexPrice == 1 && path == 'filter') {
      garages.sort((a, b) => (double.tryParse(a.products![0].price ?? '0') ?? 0)
          .compareTo(double.tryParse(b.products![0].price ?? '0') ?? 0));
    } else if (selectedIndexPrice == 2 && path == 'filter') {
      garages.sort((a, b) => (double.tryParse(b.products![0].price ?? '0') ?? 0)
          .compareTo(double.tryParse(a.products![0].price ?? '0') ?? 0));
    }

// filter price of accepted orders
    if (selectedIndexPrice == 1 && path != 'filter') {
      print('object');
      garages.sort((a, b) =>
          (double.tryParse(a.order!.orderItems![0].products!.price ?? '0') ?? 0)
              .compareTo(double.tryParse(
                      b.order!.orderItems![0].products!.price ?? '0') ??
                  0));
    } else if (selectedIndexPrice == 2 && path != 'filter') {
      garages.sort((a, b) =>
          (double.tryParse(b.order!.orderItems![0].products!.price ?? '0') ?? 0)
              .compareTo(double.tryParse(
                      a.order!.orderItems![0].products!.price ?? '0') ??
                  0));
    }

    if ([
      4,
      7,
      9,
      8,
      1,
      2
    ].contains(int.parse(categoryId.toString()))) if (selectedIndexPrice == 1) {
      // Sort from low to high

      garages.sort((a, b) =>
          (double.tryParse(a.products![0].oilextra![0].price ?? '0') ?? 0)
              .compareTo(
                  double.tryParse(b.products![0].oilextra![0].price ?? '0') ??
                      0));
    } else if (selectedIndexPrice == 2) {
      // Sort from high to low
      garages.sort((a, b) =>
          (double.tryParse(b.products![0].oilextra![0].price ?? '0') ?? 0)
              .compareTo(
                  double.tryParse(a.products![0].oilextra![0].price ?? '0') ??
                      0));
    }
// filter price of accepted orders

    if ([
      4,
      7,
      9,
      8,
      1,
      2
    ].contains(int.parse(categoryId.toString()))) if (selectedIndexPrice == 1) {
      // Sort from low to high

      garages.sort((a, b) => (double.tryParse(
                  a.order!.orderItems![0].productsExtra!.price ?? '0') ??
              0)
          .compareTo(double.tryParse(
                  b.order!.orderItems![0].productsExtra!.price ?? '0') ??
              0));
    } else if (selectedIndexPrice == 2) {
      // Sort from high to low
      garages.sort((a, b) => (double.tryParse(
                  b.order!.orderItems![0].productsExtra!.price ?? '0') ??
              0)
          .compareTo(double.tryParse(
                  a.order!.orderItems![0].productsExtra!.price ?? '0') ??
              0));
    }
// filter with location

    if (selectedIndexClosest == 1) {
      Position position = await _getCurrentLocation();

      double userLat = position.latitude;
      double userLng = position.longitude;
      garages.sort((a, b) {
        double distanceA = calculateDistance(
            userLat,
            userLng,
            double.tryParse(a.lat ?? '0') ?? 0,
            double.tryParse(a.lng ?? '0') ?? 0);
        double distanceB = calculateDistance(
            userLat,
            userLng,
            double.tryParse(b.lat ?? '0') ?? 0,
            double.tryParse(b.lng ?? '0') ?? 0);
        return distanceA.compareTo(distanceB);
      });
    } else if (selectedIndexClosest == 2) {
      garages.shuffle();
    }
    update();
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      UiUtilites.errorSnackbar('Error!',
          'Enable Your mobile location service to select your location');
           return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    // Get the current position of the user
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  double calculateDistance(
      double userLat, double userLng, double garageLat, double garageLng) {
    var latDistance = (userLat - garageLat).abs();
    var lngDistance = (userLng - garageLng).abs();
    return latDistance + lngDistance;
  }

  ///
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

  List<UserVehicles> vehiclesList = [];
  final ordervehiclesapi = OrderVehiclesApi();
  getvehicles() async {
    var response = await ordervehiclesapi.getvehicles();
    if (response.isNotEmpty) {
      vehiclesList = (response['user_vehicles'] as List<dynamic>)
          .map((item) => UserVehicles.fromJson(item as Map<String, dynamic>))
          .toList();
      if (vehiclesList.isNotEmpty) {
        selectedCarid = vehiclesList.first.id.toString();
        // box.write('selectedvehicleid', selectedCarid.toString());
        selectedCarName = vehiclesList.first.vehicle_info.toString();
        box.write('selectedvehicleName', selectedCarName.toString());
        print(selectedCarName);
        print('  bgghhg${box.read('selectedvehicleid')}');
      }
      update();
    }
  }

  String selectedCarid = '';
  String selectedCarName = '';
  String newCarid = '';

  //! Method to select a car
  void selectCar(
    String carid,
    String carName,
  ) async {
    // selectedCarid = carid;
    // selectedCarName = carName;
    print(newCarid);

    newCarid = carid;
    print(newCarid);
    var response = await StoreVehicleApi.storevehicleid(newCarid);
    if (response.isNotEmpty) {
      selectedCarid = carid;
      selectedCarName = carName;
      box.write('selectedvehicleid', selectedCarid.toString());
    }
    // box.write('selectedvehicleid', selectedCarid.toString());
    box.write('selectedvehicleName', selectedCarName.toString());
    print(selectedCarid);
    print(selectedCarName);

    update();
  }

  String selectedgarageName = 'Select garage'.tr;
  //! Method to select a garage
  void selectGarage(String garageName) {
    selectedgarageName = garageName;
    update();
  }

//! List for garage names
  final List<String> garageNames = [
    'Select garage'.tr,
    'Send to all garages'.tr,
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

  filterorder() async {
    var response;

    switch (categoryId) {
      case '6':
        response = await FilterOrderApi.filterBatteryOrder(
          startprice: start.toString(),
          endprice: end.toString(),
          brandid: selectedBrandId != null ? selectedBrandId.toString() : null,
          categoryid: categoryId.toString(),
          originid: selectedbatteryOriginId != null
              ? selectedbatteryOriginId.toString()
              : null,
          ampereid:
              selectedampereId != null ? selectedampereId.toString() : null,
          productid: selectedProducttypeId != null
              ? selectedProducttypeId.toString()
              : null,
          voltageid:
              selectedvoltageId != null ? selectedvoltageId.toString() : null,
        );
        update();
        break;
      case '3':
        response = await FilterOrderApi.filterTyreOrder(
          startprice: start.toString(),
          endprice: end.toString(),
          brandid: selectedBrandId != null ? selectedBrandId.toString() : null,
          categoryid: categoryId.toString(),
          widthid: selectedwidthId != null ? selectedwidthId.toString() : null,
          heightid:
              selectedheightId != null ? selectedheightId.toString() : null,
          sizeid: selectedsizeId != null ? selectedsizeId.toString() : null,
          originid: selectedtyreoriginId != null
              ? selectedtyreoriginId.toString()
              : null,
          patterenid:
              selectedpatterenId != null ? selectedpatterenId.toString() : null,
          speedratingid: selectedSpeedRatingId != null
              ? selectedSpeedRatingId.toString()
              : null,
        );
        // }
        update();

        break;
      case '2':
        response = await FilterOrderApi.filterOilOrder(
          startprice: start.toString(),
          endprice: end.toString(),
          brandid: selectedBrandId != null ? selectedBrandId.toString() : null,
          categoryid: categoryId.toString(),
          productid: selectedoilproductTypeId != null
              ? selectedoilproductTypeId.toString()
              : null,
          voilumeid:
              selectedVolumeId != null ? selectedVolumeId.toString() : null,
          extraid: selectedExtraId != null ? selectedExtraId.toString() : null,
        );
        // }
        update();
        break;

      case '1':
      case '4':
      case '7':
      case '8':
      case '9':
        response = await FilterOrderApi.filterextraOrder(
          startprice: start.toString(),
          endprice: end.toString(),
          categoryextraid:
              selectedExtraId != null ? selectedExtraId.toString() : null,
          categoryid: categoryId.toString(),
        );
        // }

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
    }
  }

  void sendtoAllGarages() async {
    var response;

    switch (categoryId) {
      case '6':
        response = await SendAllgaragesApi.sendAllGarages(
          lowprice: start.toString(),
          highprice: end.toString(),
          brandid: selectedBrandId.toString(),
          id: categoryId.toString(),
          originid: selectedbatteryOriginId.toString(),
          ampereid: selectedampereId.toString(),
          productid: selectedProducttypeId.toString(),
          voltageid: selectedvoltageId.toString(),
          vehicleId: selectedCarid,
        );
        update();
        break;
      case '3':
        response = await SendAllgaragesApi.sendAllGarages(
          lowprice: start.toString(),
          highprice: end.toString(),
          brandid: selectedBrandId.toString(),
          id: categoryId.toString(),
          widthid: selectedwidthId.toString(),
          heightid: selectedheightId.toString(),
          sizeid: selectedsizeId.toString(),
          tyreoriginid: selectedtyreoriginId.toString(),
          patterenid: selectedpatterenId.toString(),
          speedratingid: selectedSpeedRatingId.toString(),
          vehicleId: selectedCarid,
        );
        update();

        break;
      case '2':
        response = await SendAllgaragesApi.sendAllGarages(
          lowprice: start.toString(),
          highprice: end.toString(),
          brandid: selectedBrandId.toString(),
          id: categoryId.toString(),
          oilproductid: selectedoilproductTypeId.toString(),
          voilumeid: selectedVolumeId.toString(),
          categoryextraId: selectedExtraId.toString(),
          vehicleId: selectedCarid,
        );
        update();
        break;

      case '1':
      case '4':
      case '7':
      case '8':
      case '9':
        response = await SendAllgaragesApi.sendAllGarages(
          id: categoryId,
          vehicleId: selectedCarid,
          lowprice: start.toString(),
          highprice: end.toString(),
          categoryextraId: selectedExtraId.toString(),
        );
        update();
        break;
      default:
        print('Unknown category id');
        break;
    }

    if (response.isNotEmpty) {
      UiUtilites.successAlertDialog(
          context: Get.context,
          onTap: () {
            Get.offAllNamed(AppRoutes.main);
          },
          title: 'Thank you!'.tr,
          buttontitle: 'Back to home'.tr,
          description:
              'A garage will accept your order from within 3-5 min.'.tr);
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

  // double ratings = 0.0;
  // void updateRating(double rating) {
  //   ratings = rating;
  //   update();
  // }

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
