import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/vender_apis/add_product_apis/add_product_api.dart';
import 'package:mobilegarage/apis/vender_apis/add_product_apis/brands/get_brands_api.dart';
import 'package:mobilegarage/apis/vender_apis/add_product_apis/categories/get_categories_api.dart';
import 'package:mobilegarage/models/brand_model.dart';
import 'package:mobilegarage/models/category_model.dart';
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
  addExtras() {
    final serviceTypeNameErrorString =
        validateFields("Service Type", serviceTypeName.text);
    final serviceTypePriceErrorString =
        validateFields("Service Type Price", serviceTypePrice.text);

    if (serviceTypeNameErrorString.isEmpty &&
        serviceTypePriceErrorString.isEmpty) {
      serviceTypeList.add({
        'type': serviceTypeName.text,
        'price': serviceTypePrice.text,
      });
      serviceTypeName.clear();
      serviceTypePrice.clear();
      update();
    }
    FocusScope.of(Get.context!).unfocus();
    update();
  }

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
  String priceError = '';
  String descriptionError = '';
  String serviceTypeError = '';
  String serviceTypePriceError = '';
  String timeError = '';

  // @override
  // void onInit() async {
  //   // TODO: implement onInit
  //   super.onInit();
  //   await getCategories();
  // }

// categories dropdown
  String categorysError = '';
  CategoryModel? selectedCategory;
  List<CategoryModel> categories = [];
  int? selectedCategoryId;

  getCategories() async {
    var response = await VGetCategoriesApi.getCategories();
    if (response.isNotEmpty) {
      categories = (response['category'] as List<dynamic>)
          .map((item) => CategoryModel.from(item as Map<String, dynamic>))
          .toList();
      brands.clear();
      update();
    }
  }

  void setSelectedCategory(CategoryModel? brands) async {
    selectedCategory = brands;
    selectedCategoryId = brands?.id;
    selectedBrand = null;
    selectedBrandId = null;
    priceController.clear();
    descriptionController.clear();
    await getBrands();
    update();
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
    priceController.text = brands!.price.toString();
    descriptionController.text = brands.description.toString();
    update();
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
      case 'Description':
        descriptionError =
            Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return descriptionError;

      case 'Service Type':
        serviceTypeError =
            Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return serviceTypeError;

      case 'Service Type Price':
        serviceTypePriceError =
            Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return serviceTypePriceError;
      case 'Time needed for service':
        timeError = Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return timeError;

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
    if (selectedBrandId == null) {
      brandError = 'Please select an brand';
      update();
    } else {
      brandError = '';
      update();
    }

    final priceErrorString = validateFields('Price', priceController.text);
    final descriptionErrorString =
        validateFields('Description', descriptionController.text);
    final timeErrorString =
        validateFields('Time needed for service', timeController.text);
    if (images.isEmpty) {
      UiUtilites.errorSnackbar('Error', "Images can't be empty");
      return false;
    }
    return categoryError.isEmpty &&
        brandError.isEmpty &&
        priceErrorString.isEmpty &&
        descriptionErrorString.isEmpty &&
        timeErrorString.isEmpty;
  }

  //TODO: Forgot Function
  addProduct() async {
    if (await validateForm()) {
      base64Images = [];
      update();
      if (images.isNotEmpty) {
        for (File imageFile in images) {
          List<int> imageBytes = await imageFile.readAsBytes();
          String base64Image = base64Encode(imageBytes);
          base64Images.add(base64Image);
        }
      }
      var response = await VAddProductApi.addProduct(
        categoryid: selectedCategoryId.toString(),
        brandid: selectedBrandId.toString(),
        time: timeController.text.toString(),
        images: base64Images,
        options: serviceTypeList,
      );
      update();
      UiUtilites.successSnackbar('Product added successfully', 'Congrats');
      Get.back();
    }
  }
}
