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
import 'package:permission_handler/permission_handler.dart';

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

  void setSelectedEmirate(EmirateModel? Brand) {
    selectedEmirate = Brand;
    selectedEmirateId = Brand?.id;
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
      case 'Name ':
        nameError = Validators.emptyStringValidator(value, fieldName.tr) ?? '';
        update();
        return nameError;
      case 'Garage name ':
        garageNameError =
            Validators.emptyStringValidator(value, fieldName.tr) ?? '';
        update();
        return garageNameError;
      case 'Garage description ':
        garageDescriptionError =
            Validators.emptyStringValidator(value, fieldName.tr) ?? '';
        update();
        return garageDescriptionError;
      case 'Emirate ':
        emirateError =
            Validators.emptyStringValidator(value, fieldName.tr) ?? '';
        update();
        return emirateError;
      case 'Garage address detail ':
        garageAddressDetailError =
            Validators.emptyStringValidator(value, fieldName.tr) ?? '';
        update();
        return garageAddressDetailError;
      case 'Email ':
        emailError = Validators.emailValidator(value) ?? '';
        update();
        return emailError;
      case 'password ':
        passwordError = Validators.passwordValidator(value) ?? '';
        update();
        return passwordError;
      case 'confirm password ':
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
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        Validators.emailValidator(emailController.text) != null ||
        garageNameController.text.isEmpty ||
        garageDescriptionController.text.isEmpty ||
        passwordController.text.isEmpty ||
        Validators.passwordValidator(passwordController.text) != null ||
        confirmPasswordController.text.isEmpty ||
        Validators.confrimPasswordValidator(
                passwordController.text, confirmPasswordController.text) !=
            null ||
        selectedEmirateId == null ||
        checkphoneController == null ||
        logo == null ||
        cover == null ||
        idCardFrontSide == null ||
        idCardBackSide == null ||
        uploadLicense == null ||
        lat == null ||
        lng == null) {
      UiUtilites.pendingApprovalAlertDialog(
        context: Get.context!,
        imageAssetPath: 'assets/icons/warning.svg',
        onTap: () {},
        description: 'Fill out all details required!'.tr,
      );

      return false;
    }

    return true;
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
      phoneNumberError = 'Use Numeric Variables'.tr;
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
            uiSetting(androidTitle: 'Crop Image'.tr, iosTitle: 'Crop Image'.tr),
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
Future<void> pickImageFromCamera(String imageName) async {
  final imageSelectorApi = ImageSelectorApi();

  // Use the camera to capture an image
  final pickedImage = await imageSelectorApi.selectCameraImage(); 

  if (pickedImage != null) {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: pickedImage.path,
      uiSettings:
          uiSetting(androidTitle: 'Crop Image'.tr, iosTitle: 'Crop Image'.tr),
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
          break;
        case 'id_card_frontSide':
          idCardFrontSide = File(croppedImage.path);
          base64IdCardFrontSide = base64Image;
          update();
          break;
        case 'id_card_backSide':
          idCardBackSide = File(croppedImage.path);
          base64IdCardBackSide = base64Image;
          update();
          break;
        case 'upload_license':
          uploadLicense = File(croppedImage.path);
          base64UploadLicense = base64Image;
          update();
          break;
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
        // box.write('api_token', response['garage']['token']);
        // box.write('user_type', 'vendor');
        // print(response['garage']['token']);
        UiUtilites.successRegisterAlertDialog(
            context: Get.context,
            onTap: () {
              Get.toNamed(AppRoutes.vsignin);
            },
            title: 'Thank you!'.tr,
            verificationnumber:response['garage']['garage']['id'] ,
            description:
                'You have submitted your application successfully and it’s pending approval.'
                    .tr,
            buttontitle: 'Ok');

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

Future<bool> getLocationPermission() async {
  // Check if location services are enabled
  if (!await Geolocator.isLocationServiceEnabled()) {
    // Prompt user to enable location services
    await Geolocator.openLocationSettings();
    return false; // Return false if location service is not enabled
  }

  // Request location permissions
  PermissionStatus status = await Permission.locationWhenInUse.request();
  if (status.isGranted) {
    return true; // Permission granted
  } else if (status.isDenied || status.isPermanentlyDenied) {
    // Handle denied permissions
    await openAppSettings();
  }

  return false; // Permission not granted
}
}
