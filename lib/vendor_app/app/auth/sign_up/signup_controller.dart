import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobilegarage/apis/vender_apis/auth/signup_apis/get_emirates_apis/get_emirates_api.dart';
import 'package:mobilegarage/apis/vender_apis/auth/signup_apis/signup_api.dart';
import 'package:mobilegarage/models/emirate_model.dart';
import 'package:mobilegarage/routes/app_routes.dart';
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

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getEmirates();
  }

  //TODO: DropDown Varible
  EmirateModel? selectedEmirate;
  List<EmirateModel> emirates = [];
  int? selectedEmirateId;
  getEmirates() async {
    var response = await VGetEmirates.getEmirats();
    if (response.isNotEmpty) {
      emirates = (response['emirates'] as List<dynamic>)
          .map((item) => EmirateModel.from(item as Map<String, dynamic>))
          .toList();

      update();
    }
  }

  void setSelectedEmirate(EmirateModel? emirate) {
    selectedEmirate = emirate;
    selectedEmirateId = emirate?.id;
    update();
  }

//  Map  LatLng
  String currentAddress = '';
  double? lat;
  double? lng;
  Position? currentPosition;
  bool locationselected = false;

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
        emirateError =
            Validators.emptyStringValidator(value ?? '', fieldName) ?? '';
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
    final emirateErrorString =
        validateFields('Emirate', selectedEmirateId.toString());
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
      UiUtilites.errorSnackbar('Error', "logo can't be empty");
      return false;
    }
    if (cover == null || cover!.path.isEmpty) {
      UiUtilites.errorSnackbar('Error', "banner can't be empty");
      return false;
    }
    if (idCardBackSide == null || idCardBackSide!.path.isEmpty) {
      UiUtilites.errorSnackbar('Error', "id backside can't be empty");
      return false;
    }
    if (idCardFrontSide == null || idCardFrontSide!.path.isEmpty) {
      UiUtilites.errorSnackbar('Error', "id front side can't be empty");
      return false;
    }
    if (uploadLicense == null && uploadLicense!.path.isEmpty) {
      UiUtilites.errorSnackbar('Error', "license can't be empty");
      return false;
    }
    if (lat == null && lng == null) {
      UiUtilites.errorSnackbar('Error', "location can't be empty");
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
  String? base64Logo;
  String? base64Cover;
  String? base64IdCardFrontSide;
  String? base64IdCardBackSide;
  String? base64UploadLicense;
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
        String base64Image = base64Encode(await croppedImage.readAsBytes());
        switch (imageName) {
          case 'logo':
            logo = File(croppedImage.path);
            base64Logo = base64Image;
            update();
            break;
          case 'cover':
            cover = File(croppedImage.path);
            base64Cover = base64Image;
            update();
          case 'id_card_frontSide':
            idCardFrontSide = File(croppedImage.path);
            base64IdCardFrontSide = base64Image;
            update();
          case 'id_card_backSide':
            idCardBackSide = File(croppedImage.path);
            base64IdCardBackSide = base64Image;
            update();
          case 'upload_license':
            uploadLicense = File(croppedImage.path);
            base64UploadLicense = base64Image;
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
  register() async {
    if (await validateForm()) {
      var response = await VSignupApi.registerapi(
        name: garageNameController.text,
        ownername: nameController.text,
        phone: completePhoneNumber,
        description: garageDescriptionController.text,
        lat: lat.toString(),
        lng: lng.toString(),
        emirateid: selectedEmirateId.toString(),
        addressdetail: garageAddressDetailController.text,
        email: emailController.text,
        password: passwordController.text,
        banner: base64Cover,
        logo: base64Logo,
        license: base64UploadLicense,
        idbackside: base64IdCardBackSide,
        idfrontside: base64IdCardFrontSide,
      );
      if (response.isNotEmpty) {
        box.write('api_token', response['garage']['token']);
        resetfields();
      }
    }
  }

  resetfields() {
    garageNameController.clear();
    nameController.clear();
    garageAddressDetailController.clear();
    garageDescriptionController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    phoneNumberController.clear();
    selectedEmirate = null;
    
    logo = null;
    cover = null;
    idCardFrontSide = null;
    idCardBackSide = null;
    uploadLicense = null;

    lat = null;
    lng = null;
    currentAddress = '';
    locationselected = false;

    // clear errors also
    emailError = '';
    nameError = '';
    garageNameError = '';
    emirateError = '';
    garageAddressDetailError = '';
    phoneNumberError = '';
    passwordError = '';
    confirmPasswordError = '';
    garageDescriptionError = '';
    update();
  }
}
