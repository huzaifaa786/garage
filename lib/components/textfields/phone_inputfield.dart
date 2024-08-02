// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class PhoneInputField extends StatelessWidget {
  PhoneInputField({super.key, this.onChanged, this.controller});
  final TextEditingController? controller;
  final ValueChanged<PhoneNumber>? onChanged;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: true),
      textInputAction: TextInputAction.done,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.only(top: 5),
        filled: true,
        fillColor: AppColors.borderlightgrey,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.circular(30)),
        border: OutlineInputBorder(
            // borderSide: BorderSide.none,
            borderSide: BorderSide(color: AppColors.borderlightgrey),
            borderRadius: BorderRadius.circular(30)),
        counterStyle: TextStyle(fontSize: 0),
      ),
      initialCountryCode: 'AE',
      showDropdownIcon: false,
      flagsButtonPadding: EdgeInsets.only(left: 20),
      dropdownIcon: Icon(
        Icons.arrow_drop_down,
      ),
      languageCode: "en",
      onChanged: onChanged,
    );
  }
}
