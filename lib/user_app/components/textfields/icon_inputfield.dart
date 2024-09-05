// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class IconInputField extends StatelessWidget {
  const IconInputField({
    super.key,
    this.controller,
    this.hint,
    this.obscure = false,
    this.maxlines = 1,
    this.readOnly = false,
    this.hasprefix = true,
    this.prefixIcon = 'assets/icons/search.svg',
    this.lable,
    this.validator,
    this.autovalidateMode,
    this.errorText,
    this.type = TextInputType.text,
    this.onChange,
    this.ontap,
    this.width,
    this.height = 55,
  });
  final ValueChanged<String>? onChange;
  final VoidCallback? ontap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool hasprefix;
  final String? prefixIcon;
  final String? hint;
  final TextInputType type;
  final String? lable;
  final AutovalidateMode? autovalidateMode;
  final maxlines;
  final bool readOnly;
  final String? errorText;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange;
      },
      child: Container(
        height: Get.height * 0.06,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.grey.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(60),
        ),
        child: TextFormField(
          readOnly: readOnly,
          maxLines: maxlines,
          obscureText: obscure,
          controller: controller,
          onChanged: onChange,
          validator: validator,
          onTap: ontap,
          autovalidateMode: autovalidateMode ??
              (validator == null
                  ? AutovalidateMode.disabled
                  : AutovalidateMode.onUserInteraction),
          keyboardType: type,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            fillColor: AppColors.borderlightgrey,
            filled: true,
            prefixIcon: hasprefix
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 20.0, top: 14.0, bottom: 14.0),
                    child: SvgPicture.asset(
                      prefixIcon ?? 'assets/icons/search.svg',
                      height: 16,
                      width: 16,
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),
              borderSide: BorderSide.none,
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
