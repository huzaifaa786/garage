// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_view.dart';
import 'package:mobilegarage/user_app/utils/borders/border.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/decorations/box_decoration.dart';

class MainInput extends StatelessWidget {
  const MainInput({
    super.key,
    this.controller,
    this.hint,
    this.obscure = false,
    this.maxlines = 1,
    this.readOnly = false,
    this.label,
    this.validator,
    this.autovalidateMode,
    this.errorText,
    this.type = TextInputType.text,
    this.onchange,
    this.height = 55.0,
    this.width,
    this.keyboardAppearance,
  });

  final double height;
  final width;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final keyboardAppearance;
  final String? hint;
  final TextInputType type;
  final String? label;
  final AutovalidateMode? autovalidateMode;
  final int maxlines;
  final bool readOnly;
  final String? errorText;
  final Function(String)? onchange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Directionality(
          textDirection: box.read('locale') != 'ar'
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Container(
            padding: EdgeInsets.only(left: 15),
            height: height,
            decoration: errorText!.isNotEmpty
                ? circularErrorInputDecoration
                : circularInputDecoration,
            child: TextFormField(

           
              onChanged: onchange,
              readOnly: readOnly,
              maxLines: maxlines,
              obscureText: obscure,
              controller: controller,
              validator: validator,
              autovalidateMode: autovalidateMode ??
                  (validator != null
                      ? AutovalidateMode.always
                      : AutovalidateMode.onUserInteraction),
              keyboardType: type,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                fillColor: Colors.transparent,
                filled: true,
                border: inputborder,
                errorBorder: errorInputBorder,
                errorStyle: TextStyle(fontSize: 0),
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                hintText: hint,
                hintStyle: TextStyle(
                    color: AppColors.black.withOpacity(0.4),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
        if (errorText != null && errorText!.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: 4, left: 16, right: 16),
            child: Text(
              errorText!,
              style: TextStyle(color: AppColors.red, fontSize: 10),
            ),
          ),
      ],
    );
  }
}
