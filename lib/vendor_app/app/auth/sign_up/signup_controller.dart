import 'dart:io';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobilegarage/user_app/helper/validators.dart';
import 'package:mobilegarage/vendor_app/utils/image_picker/image_picker.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class VSignUpController extends GetxController {
  static VSignUpController instance = Get.find();
  GetStorage box = GetStorage();

  //TODO:  File Variables
  File? logo;
  File? cover;
  File? idCardFrontSide;
  File? idCardBackSide;
  File? uploadLicense;

  //TODO: Phone Number Fields Variable's
  TextEditingController phoneNumberController = TextEditingController();
  PhoneNumber? checkphoneController;
  String? completePhoneNumber;
  Country? selectedCountry =
      countries.firstWhere((country) => country.fullCountryCode == "971");

  //TODO: DropDown Varible
  String? selectedValue;

  //TODO: Toggle Varible
  bool obscurePassword = true;
  bool cobscurePassword = true;

  //TODO: InputFields Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController garageNameController = TextEditingController();
  TextEditingController garageAddressDetailController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController garageDescriptionController = TextEditingController();

  //TODO: Error Variables
  String nameError = '';
  String garageNameError = '';
  String emirateError = '';
  String garageAddressDetailError = '';
  String phoneNumberError = '';
  String emailError = '';
  String passwordError = '';
  String confirmPasswordError = '';
  String garageDescriptionError = '';

  //TODO: DropDown ListItem
  final List<String> items = [
    "Dubai",
    "Abu Dhabi",
    "Fujairah",
    "Ras Al Khaimah",
    "Sharjah",
    "Umm Al Quwain",
    "Ajman",
    "Western Region",
  ];

  //TODO: Pasword Toggle
  void passwordToggle() {
    obscurePassword = !obscurePassword;
    update();
  }

  //TODO: Confirm Pasword Toggle
  void confirmPasswordToggle() {
    cobscurePassword = !cobscurePassword;
    update();
  }

  //TODO: INPUT VALIDATIONS
  String validateFields(String fieldName, value) {
    switch (fieldName) {
      case 'Name':
        nameError = Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return nameError;
      case 'Garage name':
        garageNameError =
            Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return garageNameError;
      case 'Garage description':
        garageDescriptionError =
            Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return garageDescriptionError;
      case 'Emirate':
        emirateError = Validators.emptyStringValidator(value ?? '', fieldName) ?? '';
        update();
        return emirateError;
      case 'Garage address detail':
        garageAddressDetailError =
            Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return garageAddressDetailError;
      case 'Email':
        emailError = Validators.emailValidator(value) ?? '';
        update();
        return emailError;
      case 'password':
        passwordError = Validators.passwordValidator(value) ?? '';
        update();
        return passwordError;
      case 'confirm_password':
        confirmPasswordError = Validators.confrimPasswordValidator(
                passwordController.text, value) ??
            '';
        update();
        return confirmPasswordError;
      default:
        return '';
    }
  }

  //TODO: BUTTON VALIDATION
  Future<bool> validateForm() async {
    final nameErrorString = validateFields('Name', nameController.text);
    final emailErrorString = validateFields('Email', emailController.text);
    final garageNameErrorString =
        validateFields('Garage name', garageNameController.text);
    final garageDescriptionErrorString =
        validateFields('Garage description', garageDescriptionController.text);
    final emirateErrorString = validateFields('Emirate', selectedValue);
    print('$emirateErrorString 12222222222222222222222222222222222222222');
    final garageAddressDetailErrorString = validateFields(
        'Garage address detail', garageDescriptionController.text);

    final passwordErrorString =
        validateFields('password', passwordController.text);
    final confirmPasswordErrorString =
        validateFields('confirm_password', confirmPasswordController.text);
    if (checkphoneController != null) {
      phoneValidation(checkphoneController);
    } else {
      phoneNumberError = "Phone number can't be empty.";
      update();
    }

    if (logo == null || logo!.path.isEmpty) {
      UiUtilites.errorSnackbar('Error', 'message');
      return false;
    }
    if (cover == null || cover!.path.isEmpty) {
      UiUtilites.errorSnackbar('Error', 'message');
      return false;
    }
    if (idCardBackSide == null || idCardBackSide!.path.isEmpty) {
      UiUtilites.errorSnackbar('Error', 'message');
      return false;
    }
    if (idCardFrontSide == null || idCardFrontSide!.path.isEmpty) {
      UiUtilites.errorSnackbar('Error', 'message');
      return false;
    }
    if (uploadLicense == null && uploadLicense!.path.isEmpty) {
      UiUtilites.errorSnackbar('Error', 'message');
      return false;
    }
    return nameErrorString.isEmpty &&
        emailErrorString.isEmpty &&
        emirateErrorString.isEmpty &&
        garageNameErrorString.isEmpty &&
        phoneNumberError.isEmpty &&
        garageDescriptionErrorString.isEmpty &&
        garageAddressDetailErrorString.isEmpty &&
        passwordErrorString.isEmpty &&
        confirmPasswordErrorString.isEmpty;
  }

  //TODO: Start Phone Validation
  onCountryChanged(Country value) {
    selectedCountry = value;
    phoneNumberController.clear();
    update();
    if (checkphoneController != null) phoneValidation(checkphoneController);
  }

  phoneValidation(phone) {
    if (!isNumeric(phone.number)) {
      phoneNumberError = 'Use Numeric Variables';
      update();
      return phoneNumberError;
    } else if (phone.number.length < selectedCountry!.minLength ||
        phone.number.length > selectedCountry!.maxLength) {
      phoneNumberError = 'Invalid Phone Number'.tr;
      update();
      return phoneNumberError;
    } else {
      phoneNumberError = '';
    }
    checkphoneController = phone;
    update();
    if (countries
            .firstWhere((element) => element.code == phone!.countryISOCode)
            .maxLength ==
        phone!.number.length) {
      completePhoneNumber = phone.completeNumber;
      update();
    } else {
      completePhoneNumber = null;
    }
    return phoneNumberError;
  }
  //TODO: End Phone Validation

  //TODO: IMAGE PICKER
  pickImageFromGallery(String imageName) async {
    final imageSelectorApi = ImageSelectorApi();

    final pickedImage = await imageSelectorApi.selectImageForCropper();
    if (pickedImage != null) {
      CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        uiSettings:
            uiSetting(androidTitle: 'Crop Image', iosTitle: 'Crop Image'),
      );
      if (croppedImage != null || croppedImage!.path.isNotEmpty) {
        switch (imageName) {
          case 'logo':
            logo = File(croppedImage.path);
            // logoError = '';
            update();
            break;
          case 'cover':
            cover = File(croppedImage.path);
            // coverError = '';
            update();
          case 'id_card_frontSide':
            idCardFrontSide = File(croppedImage.path);
            // coverError = '';
            update();
          case 'id_card_backSide':
            idCardBackSide = File(croppedImage.path);
            // coverError = '';
            update();
          case 'upload_license':
            uploadLicense = File(croppedImage.path);
            // coverError = '';
            update();
          default:
            break;
        }
      } else {
        return null;
      }
    }
  }

  //TODO: Register Function
  register() async{
    if(await validateForm()){}
  }
}
