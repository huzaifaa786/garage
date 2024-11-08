// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobilegarage/app/cart/cart_bindings.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class AppPhoneInput extends StatelessWidget {
  const AppPhoneInput({
    super.key,
    required this.onChanged,
    required this.onCountryChanged,
    this.errorText,
    this.controller,
    this.initialCountryCode = 'AE',
  });

  final ValueChanged<PhoneNumber?> onChanged;
  final String? errorText;
  final TextEditingController? controller;
  final ValueChanged<Country> onCountryChanged;
  final String? initialCountryCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntlPhoneField(
          searchText: "Select Country/Region".tr,
          dropdownIconPosition: IconPosition.trailing,
          controller: controller,
          initialCountryCode: initialCountryCode,
          languageCode: "en",
          dropdownIcon: Icon(
            Icons.arrow_drop_down,
            size: 24,
            color: AppColors.primary_color,
          ),
          pickerDialogStyle: PickerDialogStyle(backgroundColor: Colors.white),
          flagsButtonPadding: const EdgeInsets.only(left: 10),
          onCountryChanged: onCountryChanged,
          dropdownTextStyle: GoogleFonts.inter(fontSize: 14),
          style: GoogleFonts.inter(fontSize: 14),
          decoration: InputDecoration(
            hintText: "phone number".tr,
            hintStyle: GoogleFonts.inter(color: AppColors.hint_text_color),
            fillColor: AppColors.input_bg_color,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(45),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 0.5),
              borderRadius: BorderRadius.circular(45),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 0.5),
              borderRadius: BorderRadius.circular(45),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(45),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(45),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(45),
            ),
            errorStyle: const TextStyle(fontSize: 0),
            counterStyle: const TextStyle(fontSize: 0),
          ),
          onChanged: onChanged,
        ),
        if (errorText!.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: 4, left: 16, right: 16),
            child: AppText(
              title: errorText!.tr,
              color: AppColors.red,
              size: 10,
            ),
          ),
      ],
    );
  }
}
