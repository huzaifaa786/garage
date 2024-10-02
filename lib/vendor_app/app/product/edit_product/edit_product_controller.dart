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

//   //TODO: Error Variables
//   String brandError = '';
//   String categoryError = '';
//   String priceError = '';
//   String descriptionError = '';
//   String imagesError = '';

//   // battery errors
//   String producttypeError = '';
//   String originError = '';
//   String ampereError = '';
//   String voltageError = '';

// // tyre errors
//   String widthError = '';
//   String heightError = '';
//   String sizeError = '';
//   String speedratingError = '';
//   String tyreoriginError = '';
//   String patterenError = '';

// // oil errors
//   String oilproductTypeError = '';
//   String volumeError = '';

  ProductModel? product;
  @override
  void onInit() async {
    super.onInit();
    await getCategories();

    if (Get.arguments != null) {
      product = Get.arguments as ProductModel;
      await setSelectedCategory(categories.firstWhere((category) =>
          category.id == int.parse(product!.categoryId.toString())));
      update();
    }
    print('${product!.id}dddddddddddddddddddd');
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
    if (![7].contains(selectedCategoryId)) {
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
                brand.id == int.parse(product!.tyrepatterenId.toString())));
          }
          update();

          break;
        case '2':
          await storeProductImagesToImagesList(product!);
          descriptionController.text = product!.description.toString();
          priceController.text = product!.price.toString();

          // Map oil product types
          if (response['productDetails']['oil_product_type'] != null) {
            oilproductTypes = (response['productDetails']['oil_p  roduct_type']
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
          // Map road assistance  extras
          if (response['productDetails']['service_extra'] != null) {
            roadAssistanceExtras =
                (response['productDetails']['service_extra'] as List<dynamic>)
                    .map((item) => RoadAssistanceExtraModel.from(item))
                    .toList();
          }
          break;
        case '7':

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
    // if (await validateForm()) {
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
            Get.offAllNamed(AppRoutes.vproductlist);
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
        return oilextras.length;
      case 4:
        return roadAssistanceExtras.length;
      case 7:
        return recoveryExtras.length;
      case 9:
        return fuelExtras.length;
      case 1:
        return carwashExtras.length;
      case 8:
        return acExtras.length;
      default:
        return 0;
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
      case 1:
        return carwashExtras[index].name.toString();
      case 8:
        return acExtras[index].name.toString();
      default:
        return '';
    }
  }

  // String getPriceError(int index) {
  //   switch (selectedCategoryId) {
  //     case 2:
  //       return oilextrapriceErrors[index] ?? '';
  //     case 4:
  //       return roadextrapriceErrors[index] ?? '';
  //     case 7:
  //       return recoveryextrapriceErrors[index] ?? '';
  //     case 9:
  //       return fuelextrapriceErrors[index] ?? '';
  //     case 1:
  //       return carWashextrapriceErrors[index] ?? '';
  //     default:
  //       return '';
  //   }
  // }

  // String getTimeError(int index) {
  //   switch (selectedCategoryId) {
  //     case 4:
  //       return roadextratimeErrors[index] ?? '';
  //     case 7:
  //       return recoveryextratimeErrors[index] ?? '';
  //     case 9:
  //       return fuelextratimeErrors[index] ?? '';
  //     case 1:
  //       return carWashextratimeErrors[index] ?? '';
  //     default:
  //       return '';
  //   }
  // }
  // //TODO: INPUT VALIDATIONS
  // String validateFields(String fieldName, value) {
  //   switch (fieldName) {
  //     case 'Category':
  //       categoryError = Validators.emptyStringValidator(value, fieldName) ?? '';
  //       update();
  //       return categoryError;
  //     case 'Brand':
  //       brandError = Validators.emptyStringValidator(value, fieldName) ?? '';
  //       update();
  //       return brandError;
  //     case 'Price':
  //       priceError = Validators.emptyStringValidator(value, fieldName) ?? '';
  //       update();
  //       return priceError;
  //     case 'description':
  //       descriptionError =
  //           Validators.emptyStringValidator(value, fieldName) ?? '';
  //       update();
  //       return descriptionError;
  //     case 'producttype':
  //       producttypeError =
  //           Validators.emptyStringValidator(value, fieldName) ?? '';
  //       update();
  //       return producttypeError;

  //     case 'origin':
  //       originError = Validators.emptyStringValidator(value, fieldName) ?? '';
  //       update();
  //       return originError;

  //     case 'ampere':
  //       ampereError = Validators.emptyStringValidator(value, fieldName) ?? '';
  //       update();
  //       return ampereError;
  //     case 'voltage':
  //       voltageError = Validators.emptyStringValidator(value, fieldName) ?? '';
  //       update();
  //       return voltageError;
  //     case 'width':
  //       widthError = Validators.emptyStringValidator(value, fieldName) ?? '';
  //       update();
  //       return widthError;
  //     case 'height':
  //       heightError = Validators.emptyStringValidator(value, fieldName) ?? '';
  //       update();
  //       return heightError;
  //     case 'size':
  //       sizeError = Validators.emptyStringValidator(value, fieldName) ?? '';
  //       update();
  //       return sizeError;
  //     case 'speed rating':
  //       speedratingError =
  //           Validators.emptyStringValidator(value, fieldName) ?? '';
  //       update();
  //       return speedratingError;
  //     case 'tyre origin':
  //       tyreoriginError =
  //           Validators.emptyStringValidator(value, fieldName) ?? '';
  //       update();
  //       return tyreoriginError;
  //     case 'patteren':
  //       patterenError = Validators.emptyStringValidator(value, fieldName) ?? '';
  //       update();
  //       return patterenError;

  //     default:
  //       return '';
  //   }
  // }

  //TODO: FORGOT VALIDATION
  // Future<bool> validateForm() async {
  //   bool imagesValid = await validateImages();
  //   if (!imagesValid) {
  //     return false; // Stop if image validation fails
  //   }

  //   switch (selectedCategoryId.toString()) {
  //     case '6': // Battery brand validation
  //       return validateBatteryForm();
  //     case '3': // Tyre brand validation
  //       return validateTyreForm();
  //     case '2': // oil brand validation
  //       return validateOilForm();
  //     case '4': // raod assistance brand validation
  //       return validateRoadAssistanceForm();
  //     case '7': // recovery brand validation
  //       return validateRecoveryForm();
  //     case '9': // fuel brand validation
  //       return validateFuelForm();
  //     case '1': // car wash brand validation
  //       return validateCarWashForm();
  //     case '8': // car wash brand validation
  //       return validateAcForm();
  //     default:
  //       categoryError = 'Please select a valid brand';
  //       update();
  //       return false;
  //   }
  // }

  // Future<bool> validateImages() async {
  //   if (images.isEmpty) {
  //     imagesError = 'Please select an images';
  //     UiUtilites.errorSnackbar('Error', 'Please select an images');
  //     update();
  //     return false;
  //   } else {
  //     imagesError = '';
  //     update();
  //     return true;
  //   }
  // }

  // Future<bool> validateBatteryForm() async {
  //   if (selectedCategoryId == null) {
  //     categoryError = 'Please select an brand';
  //     update();
  //   } else {
  //     categoryError = '';
  //     update();
  //   }
  //   //
  //   if (selectedBrandId == null) {
  //     brandError = 'Please select an brand';
  //     update();
  //   } else {
  //     brandError = '';
  //     update();
  //   }
  //   //
  //   if (selectedProducttypeId == null) {
  //     producttypeError = 'Please select an product tpye';
  //     update();
  //   } else {
  //     producttypeError = '';
  //     update();
  //   }

  //   //
  //   if (selectedbatteryOriginId == null) {
  //     originError = 'Please select an battery origin';
  //     update();
  //   } else {
  //     originError = '';
  //     update();
  //   }
  //   //
  //   if (selectedampereId == null) {
  //     ampereError = 'Please select an battery ampere';
  //     update();
  //   } else {
  //     ampereError = '';
  //     update();
  //   } //
  //   if (selectedvoltageId == null) {
  //     voltageError = 'Please select an battery voltage';
  //     update();
  //   } else {
  //     voltageError = '';
  //     update();
  //   }

  //   final priceErrorString = validateFields('Price', priceController.text);

  //   return categoryError.isEmpty &&
  //       brandError.isEmpty &&
  //       priceErrorString.isEmpty &&
  //       producttypeError.isEmpty &&
  //       ampereError.isEmpty &&
  //       voltageError.isEmpty &&
  //       originError.isEmpty;
  // }

  // Future<bool> validateTyreForm() async {
  //   if (selectedCategoryId == null) {
  //     categoryError = 'Please select brand';
  //     update();
  //   } else {
  //     categoryError = '';
  //     update();
  //   }
  //   //
  //   if (selectedBrandId == null) {
  //     brandError = 'Please select brand';
  //     update();
  //   } else {
  //     brandError = '';
  //     update();
  //   }
  //   //
  //   if (selectedwidth == null) {
  //     widthError = 'Please select tyre width';
  //     update();
  //   } else {
  //     widthError = '';
  //     update();
  //   }

  //   //
  //   if (selectedheightId == null) {
  //     heightError = 'Please select tyre height';
  //     update();
  //   } else {
  //     heightError = '';
  //     update();
  //   }
  //   //
  //   if (selectedsizeId == null) {
  //     sizeError = 'Please select tyre size';
  //     update();
  //   } else {
  //     sizeError = '';
  //     update();
  //   } //
  //   if (selectedSpeedRatingId == null) {
  //     speedratingError = 'Please select an tyre speed rating';
  //     update();
  //   } else {
  //     speedratingError = '';
  //     update();
  //   }
  //   if (selectedtyreoriginId == null) {
  //     tyreoriginError = 'Please select an tyre origin';
  //     update();
  //   } else {
  //     tyreoriginError = '';
  //     update();
  //   }
  //   if (selectedpatterenId == null) {
  //     patterenError = 'Please select an tyre patteren';
  //     update();
  //   } else {
  //     patterenError = '';
  //     update();
  //   }
  //   final priceErrorString = validateFields('Price', priceController.text);

  //   return categoryError.isEmpty &&
  //       brandError.isEmpty &&
  //       priceErrorString.isEmpty &&
  //       widthError.isEmpty &&
  //       heightError.isEmpty &&
  //       sizeError.isEmpty &&
  //       tyreoriginError.isEmpty &&
  //       patterenError.isEmpty &&
  //       speedratingError.isEmpty;
  // }

  // Map<int, String> oilextrapriceErrors = {};

  // Future<bool> validateOilForm() async {
  //   if (selectedCategoryId == null) {
  //     categoryError = 'Please select brand';
  //     update();
  //   } else {
  //     categoryError = '';
  //     update();
  //   }
  //   //
  //   if (selectedBrandId == null) {
  //     brandError = 'Please select brand';
  //     update();
  //   } else {
  //     brandError = '';
  //     update();
  //   }
  //   //
  //   if (selectedoilproductType == null) {
  //     oilproductTypeError = 'Please select oil product type';
  //     update();
  //   } else {
  //     oilproductTypeError = '';
  //     update();
  //   }

  //   //
  //   if (selectedVolumeId == null) {
  //     volumeError = 'Please select oil volume';
  //     update();
  //   } else {
  //     volumeError = '';
  //     update();
  //   }
  //   //
  //   oilextrapriceErrors.clear();
  //   final priceErrorString = validateFields('Price', priceController.text);
  //   final descriptionErrorString =
  //       validateFields('description', descriptionController.text);
  //   // Validate Oil Extras
  //   for (int i = 0; i < oilextras.length; i++) {
  //     var extra = oilextras[i];
  //     if (extra.price == null || extra.price!.isEmpty) {
  //       oilextrapriceErrors[i] = 'Extra Price is required';
  //     } else {
  //       oilextrapriceErrors.remove(i);
  //     }
  //   }
  //   return categoryError.isEmpty &&
  //       brandError.isEmpty &&
  //       priceErrorString.isEmpty &&
  //       descriptionErrorString.isEmpty &&
  //       widthError.isEmpty &&
  //       heightError.isEmpty &&
  //       sizeError.isEmpty &&
  //       tyreoriginError.isEmpty &&
  //       patterenError.isEmpty &&
  //       oilextrapriceErrors.isEmpty &&
  //       speedratingError.isEmpty;
  // }

  // Map<int, String> roadextrapriceErrors = {};
  // Map<int, String> roadextratimeErrors = {};
  // Future<bool> validateRoadAssistanceForm() async {
  //   if (selectedCategoryId == null) {
  //     categoryError = 'Please select brand';
  //     update();
  //   } else {
  //     categoryError = '';
  //     update();
  //   }

  //   //
  //   roadextrapriceErrors.clear();
  //   for (int i = 0; i < roadAssistanceExtras.length; i++) {
  //     var extra = roadAssistanceExtras[i];
  //     if (extra.price == null || extra.price!.isEmpty) {
  //       roadextrapriceErrors[i] = 'Extra Price is required';
  //     } else {
  //       roadextrapriceErrors.remove(i);
  //     }
  //   }
  //   //
  //   roadextratimeErrors.clear();

  //   for (int i = 0; i < roadAssistanceExtras.length; i++) {
  //     var extra = roadAssistanceExtras[i];
  //     if (extra.time == null || extra.time!.isEmpty) {
  //       roadextratimeErrors[i] = 'Extra Time is required';
  //     } else {
  //       roadextratimeErrors.remove(i);
  //     }
  //   }
  //   return categoryError.isEmpty &&
  //       roadextrapriceErrors.isEmpty &&
  //       roadextratimeErrors.isEmpty;
  // }

  // Map<int, String> recoveryextrapriceErrors = {};
  // Map<int, String> recoveryextratimeErrors = {};
  // Future<bool> validateRecoveryForm() async {
  //   if (selectedCategoryId == null) {
  //     categoryError = 'Please select brand';
  //     update();
  //   } else {
  //     categoryError = '';
  //     update();
  //   }

  //   //
  //   recoveryextrapriceErrors.clear();

  //   for (int i = 0; i < recoveryExtras.length; i++) {
  //     var extra = recoveryExtras[i];
  //     if (extra.price == null || extra.price!.isEmpty) {
  //       recoveryextrapriceErrors[i] = 'Extra Price is required';
  //     } else {
  //       recoveryextrapriceErrors.remove(i);
  //     }
  //   }
  //   //
  //   recoveryextratimeErrors.clear();

  //   for (int i = 0; i < recoveryExtras.length; i++) {
  //     var extra = recoveryExtras[i];
  //     if (extra.time == null || extra.time!.isEmpty) {
  //       recoveryextratimeErrors[i] = 'Extra Time is required';
  //     } else {
  //       recoveryextratimeErrors.remove(i);
  //     }
  //   }
  //   return categoryError.isEmpty &&
  //       recoveryextrapriceErrors.isEmpty &&
  //       recoveryextratimeErrors.isEmpty;
  // }

  // Map<int, String> fuelextrapriceErrors = {};
  // Map<int, String> fuelextratimeErrors = {};
  // Future<bool> validateFuelForm() async {
  //   if (selectedCategoryId == null) {
  //     categoryError = 'Please select brand';
  //     update();
  //   } else {
  //     categoryError = '';
  //     update();
  //   }

  //   //
  //   fuelextrapriceErrors.clear();

  //   for (int i = 0; i < fuelExtras.length; i++) {
  //     var extra = fuelExtras[i];
  //     if (extra.price == null || extra.price!.isEmpty) {
  //       fuelextrapriceErrors[i] = 'Extra Price is required';
  //     } else {
  //       fuelextrapriceErrors.remove(i);
  //     }
  //   }
  //   //
  //   fuelextratimeErrors.clear();

  //   for (int i = 0; i < fuelExtras.length; i++) {
  //     var extra = fuelExtras[i];
  //     if (extra.time == null || extra.time!.isEmpty) {
  //       fuelextratimeErrors[i] = 'Extra Time is required';
  //     } else {
  //       fuelextratimeErrors.remove(i);
  //     }
  //   }
  //   return categoryError.isEmpty &&
  //       fuelextrapriceErrors.isEmpty &&
  //       fuelextratimeErrors.isEmpty;
  // }

  // Map<int, String> carWashextrapriceErrors = {};
  // Map<int, String> carWashextratimeErrors = {};
  // Future<bool> validateCarWashForm() async {
  //   if (selectedCategoryId == null) {
  //     categoryError = 'Please select brand';
  //     update();
  //   } else {
  //     categoryError = '';
  //     update();
  //   }

  //   //
  //   carWashextrapriceErrors.clear();

  //   for (int i = 0; i < carwashExtras.length; i++) {
  //     var extra = carwashExtras[i];
  //     if (extra.price == null || extra.price!.isEmpty) {
  //       carWashextrapriceErrors[i] = 'Extra Price is required';
  //     } else {
  //       carWashextrapriceErrors.remove(i);
  //     }
  //   }
  //   //
  //   carWashextratimeErrors.clear();

  //   for (int i = 0; i < carwashExtras.length; i++) {
  //     var extra = carwashExtras[i];
  //     if (extra.time == null || extra.time!.isEmpty) {
  //       carWashextratimeErrors[i] = 'Extra Time is required';
  //     } else {
  //       carWashextratimeErrors.remove(i);
  //     }
  //   }
  //   return categoryError.isEmpty &&
  //       carWashextrapriceErrors.isEmpty &&
  //       carWashextratimeErrors.isEmpty;
  // }

  // Map<int, String> acextradescriptionErrors = {};
  // Future<bool> validateAcForm() async {
  //   if (selectedCategoryId == null) {
  //     categoryError = 'Please select brand';
  //     update();
  //   } else {
  //     categoryError = '';
  //     update();
  //   }
  //   final priceErrorString = validateFields('Price', priceController.text);

  //   //
  //   acextradescriptionErrors.clear();

  //   for (int i = 0; i < acExtras.length; i++) {
  //     var extra = acExtras[i];
  //     if (extra.description == null) {
  //       acextradescriptionErrors[i] = 'Extra description is required';
  //     } else {
  //       acextradescriptionErrors.remove(i);
  //     }
  //   }
  //   //

  //   return categoryError.isEmpty &&
  //       acextradescriptionErrors.isEmpty &&
  //       priceErrorString.isEmpty;
  // }
//

  // case '3':
  //   response = await VAddProductApi.addTyreProduct(
  //     categoryid: selectedCategoryId.toString(),
  //     brandid: selectedBrandId.toString(),
  //     widthid: selectedwidthId.toString(),
  //     heightid: selectedheightId.toString(),
  //     sizeid: selectedsizeId.toString(),
  //     speedratingid: selectedSpeedRatingId.toString(),
  //     price: priceController.text,
  //     originid: selectedtyreoriginId.toString(),
  //     patterenid: selectedpatterenId.toString(),
  //     images: base64Images,
  //   );
  //   update();

  //   break;
  // case '2':
  //   List<Map<String, dynamic>> includes = oilextras.where((extra) {
  //     return extra.price != null && extra.description != null;
  //   }).map((extra) {
  //     return {
  //       "category_extra_id": extra.id,
  //       "description": extra.description ?? '',
  //       "price": extra.price ?? '',
  //     };
  //   }).toList();
  //   response = await VAddProductApi.addOilProduct(
  //     categoryid: selectedCategoryId.toString(),
  //     brandid: selectedBrandId.toString(),
  //     price: priceController.text,
  //     description: descriptionController.text,
  //     producttypeid: selectedoilproductTypeId.toString(),
  //     volumeid: selectedVolumeId.toString(),
  //     includes: includes,
  //     images: base64Images,
  //   );
  //   update();

  //   break;
  // case '4':
  //   List<Map<String, dynamic>> includes =
  //       roadAssistanceExtras.where((extra) {
  //     return extra.price != null &&
  //         extra.description != null &&
  //         extra.time != null;
  //   }).map((extra) {
  //     return {
  //       "category_extra_id": extra.id,
  //       "description": extra.description ?? '',
  //       "time": extra.time ?? '',
  //       "price": extra.price ?? '',
  //     };
  //   }).toList();
  //   response = await VAddProductApi.addRoadAssistanceProduct(
  //     categoryid: selectedCategoryId.toString(),
  //     includes: includes,
  //     images: base64Images,
  //   );
  //   update();

  //   break;
  // case '7':
  //   List<Map<String, dynamic>> includes = recoveryExtras.where((extra) {
  //     return extra.price != null &&
  //         extra.description != null &&
  //         extra.time != null;
  //   }).map((extra) {
  //     return {
  //       "category_extra_id": extra.id,
  //       "description": extra.description ?? '',
  //       "time": extra.time ?? '',
  //       "price": extra.price ?? '',
  //     };
  //   }).toList();
  //   response = await VAddProductApi.addRecoveryProduct(
  //     categoryid: selectedCategoryId.toString(),
  //     includes: includes,
  //     images: base64Images,
  //   );
  //   update();
  //   break;

  // case '9':
  //   List<Map<String, dynamic>> includes = fuelExtras.where((extra) {
  //     return extra.price != null &&
  //         extra.description != null &&
  //         extra.time != null;
  //   }).map((extra) {
  //     return {
  //       "category_extra_id": extra.id,
  //       "description": extra.description ?? '',
  //       "time": extra.time ?? '',
  //       "price": extra.price ?? '',
  //     };
  //   }).toList();
  //   response = await VAddProductApi.addRecoveryProduct(
  //     categoryid: selectedCategoryId.toString(),
  //     includes: includes,
  //     images: base64Images,
  //   );
  //   update();
  //   break;
  // case '1':
  //   List<Map<String, dynamic>> includes = carwashExtras.where((extra) {
  //     return extra.price != null &&
  //         extra.description != null &&
  //         extra.time != null;
  //   }).map((extra) {
  //     return {
  //       "category_extra_id": extra.id,
  //       "description": extra.description ?? '',
  //       "time": extra.time ?? '',
  //       "price": extra.price ?? '',
  //     };
  //   }).toList();
  //   response = await VAddProductApi.addCarWashProduct(
  //     categoryid: selectedCategoryId.toString(),
  //     includes: includes,
  //     images: base64Images,
  //   );
  //   update();
  //   break;

  // case '8':
  //   List<Map<String, dynamic>> includes = acExtras.where((extra) {
  //     return extra.description != null;
  //   }).map((extra) {
  //     return {
  //       "category_extra_id": extra.id,
  //       "description": extra.description ?? '',
  //     };
  //   }).toList();
  //   response = await VAddProductApi.addAcProduct(
  //     categoryid: selectedCategoryId.toString(),
  //     includes: includes,
  //     images: base64Images,
  //   );
  //   update();
  //   break;
}
