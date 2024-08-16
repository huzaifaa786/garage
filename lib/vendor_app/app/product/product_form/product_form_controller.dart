import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/services/validation_services.dart';
import 'package:mobilegarage/vendor_app/utils/image_picker/image_picker.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class ProductFormController extends GetxController {
  static ProductFormController instance = Get.find();
  GetStorage box = GetStorage();
  List<File> images = [];

  //TODO: SERVICE TYPE VARIABLE AND FUNCTION
  List<Map<String, dynamic>> serviceTypeList = [];
  TextEditingController serviceTypeName = TextEditingController();
  TextEditingController serviceTypePrice = TextEditingController();
  TextEditingController timeController = TextEditingController();

  //* ADD Servie Type In list
  addExtras() {
    final serviceTypeNameErrorString =
        validateFields("Service Type", serviceTypeName.text);
    final serviceTypePriceErrorString =
        validateFields("Service Type Price", serviceTypePrice.text);

    if (serviceTypeNameErrorString.isEmpty &&
        serviceTypePriceErrorString.isEmpty) {
      serviceTypeList.add({
        'service_type_name': serviceTypeName.text,
        'service_type_price': serviceTypePrice.text,
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

  //TODO: InputFields Controllers
  TextEditingController serviceNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  //TODO: DropDown Varible
  String? selectedValue;

  //TODO: Error Variables
  String serviceNameError = '';
  String categoryError = '';
  String priceError = '';
  String descriptionError = '';
  String serviceTypeError = '';
  String serviceTypePriceError = '';
  String timeError = '';

  //TODO: DropDown ListItem
  final List<String> items = [
    "Car washing",
    "Maintenance",
    "Oil change",
    "Road service"
  ];

  //TODO: INPUT VALIDATIONS
  String validateFields(String fieldName, value) {
    switch (fieldName) {
      case 'Service Name':
        serviceNameError =
            Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return serviceNameError;
      case 'Category':
        categoryError = Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return categoryError;
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
    final serviceNameErrorString =
        validateFields('Service Name', serviceNameController.text);
    final categoryErrorString = validateFields('Category', selectedValue);
    final priceErrorString = validateFields('Price', priceController.text);
    final descriptionErrorString =
        validateFields('Description', descriptionController.text);
    final timeErrorString =
        validateFields('Time needed for service', timeController.text);
    return serviceNameErrorString.isEmpty &&
        categoryErrorString.isEmpty &&
        priceErrorString.isEmpty &&
        descriptionErrorString.isEmpty &&
        timeErrorString.isEmpty;
  }

  //TODO: Forgot Function
  addProduct() async {
    if (await validateForm()) {
      Get.offAllNamed(AppRoutes.signin);
    }
  }
}
