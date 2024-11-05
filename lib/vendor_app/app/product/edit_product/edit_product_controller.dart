import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/vender_apis/products/add_product_apis/product_detail_apis/product_detail_api.dart';
import 'package:mobilegarage/apis/vender_apis/products/add_product_apis/brands/add_brand_api.dart';
import 'package:mobilegarage/apis/vender_apis/products/add_product_apis/brands/get_brands_api.dart';
import 'package:mobilegarage/apis/vender_apis/products/add_product_apis/categories/get_categories_api.dart';
import 'package:mobilegarage/apis/vender_apis/products/delete_product_image/delete_product_image.dart';
import 'package:mobilegarage/apis/vender_apis/products/edit_products_apis/edit_products_api.dart';
import 'package:mobilegarage/models/ac_models/ac_extra_model.dart';
import 'package:mobilegarage/models/battery_models/ampere_model.dart';
import 'package:mobilegarage/models/battery_models/origin_model.dart';
import 'package:mobilegarage/models/battery_models/product_type_model.dart';
import 'package:mobilegarage/models/battery_models/voltage_model.dart';
import 'package:mobilegarage/models/car_wash_models/car_wash_extra_model.dart';
import 'package:mobilegarage/models/fuel_models/fuel_extra_model.dart';
import 'package:mobilegarage/models/oil_models/extra_model.dart';
import 'package:mobilegarage/models/oil_models/product_type_model.dart';
import 'package:mobilegarage/models/oil_models/volume_model.dart';
import 'package:mobilegarage/models/brand_model.dart';
import 'package:mobilegarage/models/category_model.dart';
import 'package:mobilegarage/models/product_image.dart';
import 'package:mobilegarage/models/product_model.dart';
import 'package:mobilegarage/models/recovery_models/recovery_extra_model.dart';
import 'package:mobilegarage/models/road_assistance_models/road_extra_model.dart';
import 'package:mobilegarage/models/tyre_models/height_model.dart';
import 'package:mobilegarage/models/tyre_models/origin_model.dart';
import 'package:mobilegarage/models/tyre_models/pattern_model.dart';
import 'package:mobilegarage/models/tyre_models/size_model.dart';
import 'package:mobilegarage/models/tyre_models/speed_rating_model.dart';
import 'package:mobilegarage/models/tyre_models/width_model.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/utils/image_picker/image_picker.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class EditProductController extends GetxController {
  static EditProductController instance = Get.find();
  GetStorage box = GetStorage();
  List<File> newimages = [];
  List<String> images = [];

  List<String> base64Images = [];
  //TODO: SERVICE TYPE VARIABLE AND FUNCTION
  List<Map<String, dynamic>> serviceTypeList = [];
  TextEditingController serviceTypeName = TextEditingController();
  TextEditingController serviceTypePrice = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
      newimages.addAll(selectedImages);
      update();
    }
  }

  removeSelectedImages(int index) {
    images.removeAt(index);
    Get.back();
    update();
  }

  removeSelectedNewImages(int index) {
    newimages.removeAt(index);
    Get.back();
    update();
  }

  deleteimage(imageId, productId) async {
    var response = await VDeleteProductImageApi.deleteImage(
        productid: productId, imageid: imageId);
    if (response.isNotEmpty) {
      update();
      Get.offAllNamed(AppRoutes.vhome);
      UiUtilites.successSnackbar('Image deleted Successfully', 'Success');
    } else {
      update();
      Get.back();
    }
  }

  storeProductImagesToImagesList(ProductModel product) {
    if (product.images != null && product.images!.isNotEmpty) {
      images.clear();
      for (ProductImage productImage in product.images!) {
        String? imageUrl = productImage.imageUrl;
        if (imageUrl != '') {
          images.add(imageUrl);
        }
      }
      update();
    }
  }

  Map<int, TextEditingController> extraIds = {};
  Map<int, TextEditingController> extraDescriptions = {};
  Map<int, TextEditingController> extraprices = {};
  Map<int, TextEditingController> extratimes = {};

  ProductModel? product;
  @override
  void onInit() async {
    super.onInit();
    await getCategories();

    if (Get.arguments != null) {
      product = Get.arguments as ProductModel;
      await setSelectedCategory(categories.firstWhere((category) =>
          category.id == int.parse(product!.categoryId.toString())));
    }
    await storeExtras();
    update();
  }

  storeExtras() {
    switch (product!.categoryId) {
      case '2':
        for (var extra in product!.oilextra ?? []) {
          extraDescriptions[extra.id!] =
              TextEditingController(text: extra.description ?? '');
          extraprices[extra.id!] =
              TextEditingController(text: extra.price ?? '');
          extraIds[extra.id!] =
              TextEditingController(text: extra.categoryId.toString());
        }
        break;

      case '7':
        for (var extra in product!.recoveryextra ?? []) {
          extraDescriptions[extra.id!] =
              TextEditingController(text: extra.description ?? '');
          print('object${extraDescriptions.length}');
          extraprices[extra.id!] =
              TextEditingController(text: extra.price ?? '');
          extraIds[extra.id!] =
              TextEditingController(text: extra.categoryId.toString());
          extratimes[extra.id!] =
              TextEditingController(text: extra.time.toString());
        }
        break;
      case '9':
        for (var extra in product!.fuelextra ?? []) {
          extraDescriptions[extra.id!] =
              TextEditingController(text: extra.description ?? '');
          extraprices[extra.id!] =
              TextEditingController(text: extra.price ?? '');
          extraIds[extra.id!] =
              TextEditingController(text: extra.categoryId.toString());
          extratimes[extra.id!] =
              TextEditingController(text: extra.time.toString());
        }
        break;
      case '4':
        for (var extra in product!.roadextra ?? []) {
          extraDescriptions[extra.id!] =
              TextEditingController(text: extra.description ?? '');
          extraprices[extra.id!] =
              TextEditingController(text: extra.price ?? '');
          extraIds[extra.id!] =
              TextEditingController(text: extra.categoryId.toString());
          extratimes[extra.id!] =
              TextEditingController(text: extra.time.toString());
        }
        break;
      case '1':
        for (var extra in product!.carwashextra ?? []) {
          extraDescriptions[extra.id!] =
              TextEditingController(text: extra.description ?? '');
          extraprices[extra.id!] =
              TextEditingController(text: extra.price ?? '');
          extraIds[extra.id!] =
              TextEditingController(text: extra.categoryId.toString());
          extratimes[extra.id!] =
              TextEditingController(text: extra.time.toString());
        }
        break;
      case '8':
        for (var extra in product!.acextra ?? []) {
          extraDescriptions[extra.ixd!] =
              TextEditingController(text: extra.description ?? '');
          extraprices[extra.id!] =
              TextEditingController(text: extra.price ?? '');
          extraIds[extra.id!] =
              TextEditingController(text: extra.categoryId.toString());
        }
        break;
      default: // Handle unknown or undefined categories
        print('Unknown category: ${product!.categoryId}');
        break;
    }
  }

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

      update();
    }
  }

  setSelectedCategory(CategoryModel? brand) async {
    selectedCategory = brand;
    selectedCategoryId = brand?.id;
    clearbatterymodels();
    clearbatterycomponents();
    if (![7, 9, 4, 1, 8].contains(selectedCategoryId)) {
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

      await setSelectedBrands(brands.firstWhere(
          (brand) => brand.id == int.parse(product!.brandId.toString())));

      update();
    }
  }

  setSelectedBrands(BrandModel? brands) async {
    selectedBrand = brands;
    selectedBrandId = brands?.id;

    update();
  }

  // ProductDetailModel? productdetails;
//
  List<BatteryProductTypeModel> producttypes = [];
  BatteryProductTypeModel? selectedproducttype;
  int? selectedProducttypeId;

  setSelectedproducttype(BatteryProductTypeModel? producttype) async {
    selectedproducttype = producttype;
    selectedProducttypeId = producttype?.id;
    update();
  }

//
  List<BatteryOriginModel> batteryOrigins = [];
  BatteryOriginModel? selectedbatteryOrigin;
  int? selectedbatteryOriginId;

  setSelectedBatteryOrigin(BatteryOriginModel? origin) async {
    selectedbatteryOrigin = origin;
    selectedbatteryOriginId = origin?.id;
    update();
  }

  //
  List<BatteryAmpereModel> batteryAmperes = [];
  BatteryAmpereModel? selectedampere;
  int? selectedampereId;

  setSelectedBatteryAmpere(BatteryAmpereModel? ampere) async {
    selectedampere = ampere;
    selectedampereId = ampere?.id;
    update();
  }

  //
  List<BatteryVoltageModel> batteryVoltages = [];
  BatteryVoltageModel? selectedvoltage;
  int? selectedvoltageId;
  setSelectedBatteryvoltage(BatteryVoltageModel? voltage) async {
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
  setSelectedWidth(TyreWidthModel? width) async {
    selectedwidth = width;
    selectedwidthId = width?.id;
    update();
  }

  //
  List<TyreHeightModel> tyreheights = [];
  TyreHeightModel? selectedheight;
  int? selectedheightId;
  setSelectedheight(TyreHeightModel? height) async {
    selectedheight = height;
    selectedheightId = height?.id;
    update();
  }

  //
  List<TyreSizeModel> tyresizes = [];
  TyreSizeModel? selectedsize;
  int? selectedsizeId;
  setSelectedSize(TyreSizeModel? size) async {
    selectedsize = size;
    selectedsizeId = size?.id;
    update();
  }

  //
  List<TyreOriginModel> tyreorigins = [];
  TyreOriginModel? selectedtyreorigin;
  int? selectedtyreoriginId;
  setSelectedTyreOrigin(TyreOriginModel? origin) async {
    selectedtyreorigin = origin;
    selectedtyreoriginId = origin?.id;
    update();
  } //

  List<TyreSpeedRatingModel> tyreSpeedRatings = [];
  TyreSpeedRatingModel? selectedSpeedRating;
  int? selectedSpeedRatingId;
  setSelectedSpeedRating(TyreSpeedRatingModel? rating) async {
    selectedSpeedRating = rating;
    selectedSpeedRatingId = rating?.id;
    update();
  }
  //

  List<TyrePatternModel> tyrepattterens = [];
  TyrePatternModel? selectedpatteren;
  int? selectedpatterenId;
  setSelectedPatteren(TyrePatternModel? patteren) async {
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
  setSelectedOilproducttype(OilProductTTypeModel? productType) async {
    selectedoilproductType = productType;
    selectedoilproductTypeId = productType?.id;
    update();
  }

  //
  List<OilVolumeModel> oilVolumes = [];
  OilVolumeModel? selectedvolume;
  int? selectedVolumeId;
  setSelectedVolume(OilVolumeModel? volume) async {
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

  /////////////////////////////                                        ////////////////////////////////////
  ///////////////////////////            car wash  data                   ////////////////////////////////////
  ///////////////////////////                                        ////////////////////////////////////

  List<CarWashExtraModel> carwashExtras = [];

/////////////////////////////                                        ////////////////////////////////////
  ///////////////////////////            ac  data                   ////////////////////////////////////
  ///////////////////////////                                        ////////////////////////////////////

  List<AcExtraModel> acExtras = [];

  // product detail
  getProductDetails() async {
    var response = await VProductDetailApi.getProductDetails(
        id: selectedCategoryId.toString());
    if (response.isNotEmpty) {
      // productdetails = ProductDetailModel.from(response['productDetails']);
      String categoryId = selectedCategoryId.toString();
      switch (categoryId) {
        case '6':
          await storeProductImagesToImagesList(product!);
          // Map battery product types
          if (response['productDetails']['battery_product_type'] != null) {
            producttypes = (response['productDetails']['battery_product_type']
                    as List<dynamic>)
                .map((item) => BatteryProductTypeModel.from(item))
                .toList();

            descriptionController.text = product!.description.toString();
            priceController.text = product!.price.toString();

            await setSelectedproducttype(producttypes.firstWhere((brand) =>
                brand.id == int.parse(product!.producttypeId.toString())));
          }

          // Map battery origins
          if (response['productDetails']['battery_origin'] != null) {
            batteryOrigins =
                (response['productDetails']['battery_origin'] as List<dynamic>)
                    .map((item) => BatteryOriginModel.from(item))
                    .toList();

            await setSelectedBatteryOrigin(batteryOrigins.firstWhere((brand) =>
                brand.id == int.parse(product!.originId.toString())));
          }
          // Map battery amperes
          if (response['productDetails']['battery_ampere'] != null) {
            batteryAmperes =
                (response['productDetails']['battery_ampere'] as List<dynamic>)
                    .map((item) => BatteryAmpereModel.from(item))
                    .toList();
            await setSelectedBatteryAmpere(batteryAmperes.firstWhere((brand) =>
                brand.id == int.parse(product!.ampereId.toString())));
          }
          // Map battery voltages
          if (response['productDetails']['battery_voltage'] != null) {
            batteryVoltages =
                (response['productDetails']['battery_voltage'] as List<dynamic>)
                    .map((item) => BatteryVoltageModel.from(item))
                    .toList();
            await setSelectedBatteryvoltage(batteryVoltages.firstWhere(
                (brand) =>
                    brand.id == int.parse(product!.voltageId.toString())));
          }
          update();
          break;
        case '3':
          await storeProductImagesToImagesList(product!);
          priceController.text = product!.price.toString();
          descriptionController.text = product!.description.toString();

          // Map tyre widths types
          if (response['productDetails']['tyer_width'] != null) {
            tyrewidths =
                (response['productDetails']['tyer_width'] as List<dynamic>)
                    .map((item) => TyreWidthModel.from(item))
                    .toList();

            await setSelectedWidth(tyrewidths.firstWhere((width) =>
                width.id == int.parse(product!.tyrewidthId.toString())));
          }
          // Map tyre height
          if (response['productDetails']['tyer_height'] != null) {
            tyreheights =
                (response['productDetails']['tyer_height'] as List<dynamic>)
                    .map((item) => TyreHeightModel.from(item))
                    .toList();
            await setSelectedheight(tyreheights.firstWhere((brand) =>
                brand.id == int.parse(product!.tyreheightId.toString())));
          }
          // Map tyres sizes
          if (response['productDetails']['tyer_size'] != null) {
            tyresizes =
                (response['productDetails']['tyer_size'] as List<dynamic>)
                    .map((item) => TyreSizeModel.from(item))
                    .toList();
            await setSelectedSize(tyresizes.firstWhere((brand) =>
                brand.id == int.parse(product!.tyresizeId.toString())));
            update();
          }
          // Map tyre speed ratings
          if (response['productDetails']['tyer_speed_rating'] != null) {
            tyreSpeedRatings = (response['productDetails']['tyer_speed_rating']
                    as List<dynamic>)
                .map((item) => TyreSpeedRatingModel.from(item))
                .toList();
            await setSelectedSpeedRating(tyreSpeedRatings.firstWhere((brand) =>
                brand.id == int.parse(product!.tyrespeedId.toString())));
          }
          // Map tyre origins
          if (response['productDetails']['tyer_origin'] != null) {
            tyreorigins =
                (response['productDetails']['tyer_origin'] as List<dynamic>)
                    .map((item) => TyreOriginModel.from(item))
                    .toList();
            await setSelectedTyreOrigin(tyreorigins.firstWhere((brand) =>
                brand.id == int.parse(product!.tyreoriginId.toString())));
          } // Map tyre patterens
          if (response['productDetails']['tyer_pattren'] != null) {
            tyrepattterens =
                (response['productDetails']['tyer_pattren'] as List<dynamic>)
                    .map((item) => TyrePatternModel.from(item))
                    .toList();
            await setSelectedPatteren(tyrepattterens.firstWhere((brand) =>
                brand.id == int.parse(product!.tyrepatternId.toString())));
          }
          update();

          break;
        case '2':
          await storeProductImagesToImagesList(product!);
          descriptionController.text = product!.description.toString();
          priceController.text = product!.price.toString();

          // Map oil product types
          if (response['productDetails']['oil_product_type'] != null) {
            oilproductTypes = (response['productDetails']['oil_product_type']
                    as List<dynamic>)
                .map((item) => OilProductTTypeModel.from(item))
                .toList();
            await setSelectedOilproducttype(oilproductTypes.firstWhere(
                (brand) =>
                    brand.id ==
                    int.parse(product!.oilproducttypeId.toString())));
          }
          // Map oil volumes
          if (response['productDetails']['oil_volume'] != null) {
            oilVolumes =
                (response['productDetails']['oil_volume'] as List<dynamic>)
                    .map((item) => OilVolumeModel.from(item))
                    .toList();
            await setSelectedVolume(oilVolumes.firstWhere((brand) =>
                brand.id == int.parse(product!.oilvolumeId.toString())));
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
          await storeProductImagesToImagesList(product!);

          // Map road assistance  extras
          if (response['productDetails']['service_extra'] != null) {
            roadAssistanceExtras =
                (response['productDetails']['service_extra'] as List<dynamic>)
                    .map((item) => RoadAssistanceExtraModel.from(item))
                    .toList();
          }
          break;
        case '7':
          await storeProductImagesToImagesList(product!);

          // Map recovery  extras
          if (response['productDetails']['service_extra'] != null) {
            recoveryExtras =
                (response['productDetails']['service_extra'] as List<dynamic>)
                    .map((item) => RecoveryExtraModel.from(item))
                    .toList();
            update();
          }
          break;
        case '9':
          await storeProductImagesToImagesList(product!);

          // Map fuel  extras
          if (response['productDetails']['service_extra'] != null) {
            fuelExtras =
                (response['productDetails']['service_extra'] as List<dynamic>)
                    .map((item) => FuelExtraModel.from(item))
                    .toList();
            update();
          }
          break;
        case '1':
          await storeProductImagesToImagesList(product!);

          // Map car wash  extras
          if (response['productDetails']['service_extra'] != null) {
            carwashExtras =
                (response['productDetails']['service_extra'] as List<dynamic>)
                    .map((item) => CarWashExtraModel.from(item))
                    .toList();
            update();
          }
          break;
        case '8':
          await storeProductImagesToImagesList(product!);

          // Map ac  extras
          if (response['productDetails']['service_extra'] != null) {
            acExtras =
                (response['productDetails']['service_extra'] as List<dynamic>)
                    .map((item) => AcExtraModel.from(item))
                    .toList();
            update();
          }
          break;
        default:
          print('Unknown brand ids to map data');
          break;
      }
    }
  }

  // TODO: edit product  Function
  editProduct() async {
    base64Images = [];
    update();
    if (newimages.isNotEmpty) {
      for (File imageFile in newimages) {
        List<int> imageBytes = await imageFile.readAsBytes();
        String base64Image = base64Encode(imageBytes);
        base64Images.add(base64Image);
      }
    }
    String categoryId = selectedCategoryId.toString();
    var response;

    switch (categoryId) {
      case '6':
        response = await VEditProductApi.editBatteryProduct(
          productid: product!.id.toString(),
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
        response = await VEditProductApi.editTyreProduct(
          productid: product!.id.toString(),
          brandid: selectedBrandId.toString(),
          heightid: selectedheightId.toString(),
          widthid: selectedwidthId.toString(),
          originid: selectedtyreoriginId.toString(),
          sizeid: selectedsizeId.toString(),
          patterenid: selectedpatterenId.toString(),
          speedratingid: selectedSpeedRatingId.toString(),
          price: priceController.text,
          description: descriptionController.text,
          images: base64Images,
        );
        update();
        break;
      case '2':
        List<Map<String, dynamic>> includes = extraDescriptions.keys
            .map((key) {
              final description = extraDescriptions[key]?.text ?? '';
              final price = extraprices[key]?.text ?? '';
              final categoryextraId = extraIds[key]?.text ?? '';

              if (description.isNotEmpty && price.isNotEmpty) {
                return {
                  "category_extra_id": categoryextraId,
                  "description": description,
                  "price": price,
                };
              } else {
                return null;
              }
            })
            .where((item) => item != null)
            .toList()
            .cast<Map<String, dynamic>>();

        response = await VEditProductApi.editOilProduct(
          categoryid: selectedCategoryId!.toString(),
          brandid: selectedBrandId.toString(),
          productid: product!.id.toString(),
          producttypeid: selectedoilproductTypeId.toString(),
          volumeid: selectedVolumeId.toString(),
          price: priceController.text,
          description: descriptionController.text,
          images: base64Images,
          includes: includes,
        );
        update();
        break;
      case '7':
        List<Map<String, dynamic>> includes = extraDescriptions.keys
            .map((key) {
              final description = extraDescriptions[key]?.text ?? '';
              final price = extraprices[key]?.text ?? '';
              final categoryextraId = extraIds[key]?.text ?? '';
              final time = extratimes[key]?.text ?? '';

              if (description.isNotEmpty && price.isNotEmpty) {
                return {
                  "category_extra_id": categoryextraId,
                  "description": description,
                  "time": time,
                  "price": price,
                };
              } else {
                return null;
              }
            })
            .where((item) => item != null)
            .toList()
            .cast<Map<String, dynamic>>();

        response = await VEditProductApi.editRecoveryProduct(
          productid: product!.id.toString(),
          images: base64Images,
          includes: includes,
        );
        update();
        break;
      case '9':
        List<Map<String, dynamic>> includes = extraDescriptions.keys
            .map((key) {
              final description = extraDescriptions[key]?.text ?? '';
              final price = extraprices[key]?.text ?? '';
              final categoryextraId = extraIds[key]?.text ?? '';
              final time = extratimes[key]?.text ?? '';

              if (description.isNotEmpty && price.isNotEmpty) {
                return {
                  "category_extra_id": categoryextraId,
                  "description": description,
                  "time": time,
                  "price": price,
                };
              } else {
                return null;
              }
            })
            .where((item) => item != null)
            .toList()
            .cast<Map<String, dynamic>>();

        response = await VEditProductApi.editFuelProduct(
          productid: product!.id.toString(),
          images: base64Images,
          includes: includes,
        );
        update();
        break;
      case '4':
        List<Map<String, dynamic>> includes = extraDescriptions.keys
            .map((key) {
              final description = extraDescriptions[key]?.text ?? '';
              final price = extraprices[key]?.text ?? '';
              final categoryextraId = extraIds[key]?.text ?? '';
              final time = extratimes[key]?.text ?? '';

              if (description.isNotEmpty && price.isNotEmpty) {
                return {
                  "category_extra_id": categoryextraId,
                  "description": description,
                  "time": time,
                  "price": price,
                };
              } else {
                return null;
              }
            })
            .where((item) => item != null)
            .toList()
            .cast<Map<String, dynamic>>();

        response = await VEditProductApi.editRoadAssistanceProduct(
          productid: product!.id.toString(),
          images: base64Images,
          includes: includes,
        );
        update();
        break;
      case '1':
        List<Map<String, dynamic>> includes = extraDescriptions.keys
            .map((key) {
              final description = extraDescriptions[key]?.text ?? '';
              final price = extraprices[key]?.text ?? '';
              final categoryextraId = extraIds[key]?.text ?? '';
              final time = extratimes[key]?.text ?? '';

              if (description.isNotEmpty && price.isNotEmpty) {
                return {
                  "category_extra_id": categoryextraId,
                  "description": description,
                  "time": time,
                  "price": price,
                };
              } else {
                return null;
              }
            })
            .where((item) => item != null)
            .toList()
            .cast<Map<String, dynamic>>();

        response = await VEditProductApi.editCarWashProduct(
          productid: product!.id.toString(),
          images: base64Images,
          includes: includes,
        );
        update();
        break;
      case '8':
        List<Map<String, dynamic>> includes = extraDescriptions.keys
            .map((key) {
              final description = extraDescriptions[key]?.text ?? '';
              final price = extraprices[key]?.text ?? '';
              final categoryextraId = extraIds[key]?.text ?? '';

              if (description.isNotEmpty && price.isNotEmpty) {
                return {
                  "category_extra_id": categoryextraId,
                  "description": description,
                  "price": price,
                };
              } else {
                return null;
              }
            })
            .where((item) => item != null)
            .toList()
            .cast<Map<String, dynamic>>();

        response = await VEditProductApi.editAcProduct(
          productid: product!.id.toString(),
          images: base64Images,
          includes: includes,
        );
        update();
        break;

      default:
        print('Unknown brand id');
        break;
    }

    if (response.isNotEmpty) {
      UiUtilites.successAlertDialog(
          buttontitle: 'Back to dashboard',
          context: Get.context,
          description: 'Your product / service has been\n added successfully!',
          onTap: () {
            Get.offAllNamed(AppRoutes.vhome);
          },
          title: 'Done!');
      update();
    }
    // }
  }

  // add brand apis
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
        return product!.oilextra!.length;
      case 4:
        return product!.roadextra!.length;
      case 7:
        return product!.recoveryextra!.length;
      case 9:
        return product!.fuelextra!.length;
      case 1:
        return product!.carwashextra!.length;
      case 8:
        return product!.acextra!.length;
      default:
        return 0;
    }
  }

  String getTitle(int index) {
    switch (selectedCategoryId) {
      case 2:
        return product!.oilextra![index].name.toString();
      case 4:
        return product!.roadextra![index].name.toString();
      case 7:
        return product!.recoveryextra![index].name.toString();
      case 9:
        return product!.fuelextra![index].name.toString();
      case 1:
        return product!.carwashextra![index].name.toString();
      case 8:
        return product!.acextra![index].name.toString();
      default:
        return '';
    }
  }
}
