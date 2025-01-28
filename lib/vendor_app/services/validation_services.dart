// ignore_for_file: unused_local_variable
import 'package:get/get.dart';

class Validators {
  Validators._();

  /// Validates if the given string is empty
  static String? emptyStringValidator(String? value, String valueType) {
    if (value == null) {
      return null;
    } else if (value.isEmpty) {
      return "$valueType ".tr + "can't be empty".tr;
    } else {
      return null;
    }
  }

  static String? manufactureYearValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Manufacture year can't be empty".tr;
    }
    if (!RegExp(r'^\d{4}$').hasMatch(value)) {
      return "Manufacture year must be a valid 4-digit year".tr;
    }
    int year = int.parse(value.toString());
    int currentYear = DateTime.now().year;
    if (year < 1949 || year >= currentYear) {
      return "${"Manufacture year must be between 1950 and".tr} $currentYear"
          .tr;
    }
    return null;
  }

  static String? emailValidator(String? email) {
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
    // ignore: unnecessary_raw_strings
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
}
