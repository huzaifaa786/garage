// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

import 'package:mobilegarage/vendor_app/utils/app_inputfields/app_inputfield.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class ServiceTypeFields extends StatelessWidget {
  final bool visible;
  final String nameLabel;
  final String priceLabel;
  final TextInputType priceInputType;
  final TextEditingController nameController;
  final TextEditingController priceController;
  final ontap;
  final String? nameError;
  final String? priceError;
  final onchange1;
  final onchange2;

  const ServiceTypeFields({
    super.key,
    required this.visible,
    required this.nameLabel,
    required this.priceLabel,
    required this.priceInputType,
    this.nameError,
    this.priceError,
    required this.nameController,
    required this.priceController,
    this.ontap,
    this.onchange1,
    this.onchange2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppInputField(
          width: Get.width * 0.35,
          errorText: nameError,
          hint: nameLabel,
          controller: nameController,
          onchange: onchange1,
        ),
        AppInputField(
          width: Get.width * 0.35,
          hint: priceLabel,
          errorText: priceError,
          type: priceInputType,
          controller: priceController,
          onchange: onchange2,
          hasSuffix: true,
          suffixWidget: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: AppText(
              title: 'AED'.tr,
              size: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: GestureDetector(
            onTap: ontap,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary_color,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.add,
                color: AppColors.white_color,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
