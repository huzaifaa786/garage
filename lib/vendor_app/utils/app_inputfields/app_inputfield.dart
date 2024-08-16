// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilegarage/user_app/utils/decorations/box_decoration.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/utils/borders/borders.dart';

class AppInputField extends StatelessWidget {
  const AppInputField({
    super.key,
    this.controller,
    this.hint,
    this.obscure = false,
    this.maxlines = 1,
    this.readOnly = false,
    this.lable,
    this.validator,
    this.autovalidateMode,
    this.errorText,
    this.type = TextInputType.text,
    this.onchange,
    this.height = 40.0,
    this.width,
    this.ontap,
    this.btnTitle,
    this.btnColor,
    this.suffixWidget,
    this.hasSuffix = false,
    this.prefixWidget,
    this.hasPrefix = false,
  });
  final double height;
  final width;
  final controller;
  final validator;
  final obscure;
  final hint;
  final type;
  final lable;
  final autovalidateMode;
  final maxlines;
  final readOnly;
  final ontap;
  final String? errorText;
  final onchange;
  final btnTitle;
  final btnColor;
  final Widget? suffixWidget;
  final bool? hasSuffix;
  final Widget? prefixWidget;
  final bool? hasPrefix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          decoration: errorText!.isNotEmpty
              ? circularErrorInputDecoration
              : circularInputDecoration,
          child: TextFormField(
            onChanged: onchange,
            onSaved: onchange,
            onFieldSubmitted: onchange,
            readOnly: readOnly,
            maxLines: maxlines,
            obscureText: obscure,
            controller: controller,
            validator: validator,
            style: GoogleFonts.inter(fontSize: 14),
            autovalidateMode: autovalidateMode ??
                (validator == true.obs
                    ? AutovalidateMode.always
                    : AutovalidateMode.onUserInteraction),
            keyboardType: type,
            decoration: InputDecoration(
              suffixIcon: hasSuffix == true ? suffixWidget : null,
              prefixIcon: hasPrefix == true ? prefixWidget : null,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              fillColor: AppColors.input_bg_color,
              filled: true,
              border: inputborder,
              errorBorder: inputborder,
              errorStyle: TextStyle(fontSize: 0),
              hintText: hint,
              hintStyle: GoogleFonts.inter(
                color: AppColors.hint_text_color,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        if (errorText!.isNotEmpty)
          Container(
            width: width,
            padding: EdgeInsets.only(top: 4, left: 16, right: 16),
            child: AppText(
              title: errorText!,
              color: AppColors.primary_color,
              size: 10,
            ),
          ),
      ],
    );
  }
}
