// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
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
    this.onChange,
    this.ontap,
    this.suffiximage,
  });
  final ValueChanged<String>? onChange;
  final VoidCallback? ontap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final String? hint;
  final TextInputType? type;
  final String? lable;
  final AutovalidateMode? autovalidateMode;
  final int? maxlines;
  final bool readOnly;
  final String? errorText;
  final suffiximage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 7,
      width: Get.width * 0.6,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.grey.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(30),
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
          color: AppColors.grey,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          fillColor: AppColors.borderlightgrey,
          filled: true,
          suffix: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              suffiximage.toString(),
              height: 25,
              width: 25,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: BorderSide.none,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: AppColors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}