// ignore_for_file: unused_local_variable
import 'package:get/get.dart';

class Validators {
  Validators._();

  /// Validates if the given string is empty
  static String? emptyStringValidator(String? value, String valueType) {
    if (value == null) {
      return null;
    } else if (value.isEmpty) {
      return "${'$valueType'}${'can\'t be empty'.tr}";
    } else {
      return null;
    }
  }

  /// Validates if a dropdown selection is empty
  static String? dropdownValidator(String? value, String valueType) {
    if (value == null) {
      return "${'$valueType'} ${'can\'t be empty'.tr}";
    } else {
      return null;
    }
  }

  /// Validates the Email for User Authentication
  static String? emailValidator(String? email) {
    print(email);
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );

    if (email == null) {
      return null;
    } else if (email.isEmpty) {
      return "Email can't be empty".tr;
    } else if (!emailRegExp.hasMatch(email)) {
      return "Invalid Email Address".tr;
    } else {
      return null;
    }
  }

  /// Validates the Phone Number for User Authentication

  static String? phoneNumberValidator(String? phoneNumber) {
    print(phoneNumber);
    final RegExp phoneRegExp = RegExp(
      r'^\+?[1-9]\d{1,14}$',
    );
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Phone number is required'.tr;
    } else if (!phoneRegExp.hasMatch(phoneNumber)) {
      return 'Invalid phone number'.tr;
    }
    return null;
  }

  /// Validates the Password for User Authentication
  static String? passwordValidator(String? password) {
    // ignore: unnecessary_raw_strings
    final digitRegExp =
        RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{1,}$');

    if (password == null) {
      return null;
    } else if (password.isEmpty) {
      return "Password can't be empty".tr;
    } else if (password.length < 6) {
      return "Password must be 6 characters long".tr;
    } else {
      return null;
    }
  }

  /// Validates the confirm Password for User Authentication
  static String? confrimPasswordValidator(
      String? newpassword, String? confirmPassword) {
    if (confirmPassword!.isEmpty) {
      return "Password can't be empty".tr;
    } else if (newpassword == confirmPassword) {
      return null;
    } else {
      return "Password and confirm password are not same!".tr;
    }
  }

  /// Validates the Date Of Birth for Account Creation
  static String? dobValidator({required String? dob, required int age}) {
    if (dob == null) {
      return null;
    } else if (dob.isEmpty) {
      return "Date can't be empty".tr;
    } else if (age <= 16) {
      return "You must be over 16 to create a seller account".tr;
    } else {
      return null;
    }
  }

  static String? userNameValidator({
    required String? username,
    required bool alreadyExists,
  }) {
    if (username == null) {
      return null;
    } else if (username.isEmpty) {
      return "Username can't be empty".tr;
    } else if (alreadyExists) {
      return "Username already exists".tr;
    } else {
      return null;
    }
  }

  static String? price({
    required String? price,
  }) {
    if (price == null) {
      return null;
    } else if (price.isEmpty) {
      return "Price can't be empty".tr;
    } else
      return null;
  }

  static String? description({
    required String? description,
  }) {
    if (description == null) {
      return null;
    } else if (description.isEmpty) {
      return "description can't be empty".tr;
    } else
      return null;
  }

  static String? projectArea({
    required String? projectArea,
  }) {
    if (projectArea == null) {
      return null;
    } else if (projectArea.isEmpty) {
      return "projectArea can't be empty".tr;
    } else
      return null;
  }

  static String? assetValue({
    required String? assetValue,
  }) {
    if (assetValue == null) {
      return null;
    } else if (assetValue.isEmpty) {
      return "assetValue can't be empty".tr;
    } else
      return null;
  }

  static String? include({
    required String? include,
  }) {
    if (include == null) {
      return null;
    } else if (include.isEmpty) {
      return "include can't be empty".tr;
    } else
      return null;
  }

  static String? exitshare({
    required String? exitshare,
  }) {
    if (exitshare == null) {
      return null;
    } else if (exitshare.isEmpty) {
      return "exitshare can't be empty".tr;
    } else
      return null;
  }

  static String? establishment({
    required String? establishment,
  }) {
    if (establishment == null) {
      return null;
    } else if (establishment.isEmpty) {
      return "establishment can't be empty".tr;
    } else
      return null;
  }

  static String? name({
    required String? name,
  }) {
    if (name == null) {
      return null;
    } else if (name.isEmpty) {
      return "name can't be empty".tr;
    } else
      return null;
  }
}
