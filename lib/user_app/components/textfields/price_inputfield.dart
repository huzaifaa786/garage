// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/borders/border.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/decorations/box_decoration.dart';

class PriceInput extends StatelessWidget {
  const PriceInput({
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
    this.height = 60.0,
    this.width,
  });

  final double height;
  final double? width; // Ensure width is a double
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscure;
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
        Container(
          padding: EdgeInsets.only(left: 15),
          height: height,
          decoration: errorText != null && errorText!.isNotEmpty
              ? circularErrorInputDecoration
              : circularInputDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: AppText(
                    title: 'AED',
                    color: AppColors.primarybg,
                    size: 13,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        if (errorText != null && errorText!.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: 4, left: 4, right: 4),
            child: Text(
              errorText!,
              style: TextStyle(color: Colors.red, fontSize: 9),
            ),
          ),
      ],
    );
  }
}
