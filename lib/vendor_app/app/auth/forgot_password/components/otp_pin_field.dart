import 'package:flutter/material.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class AppOtpPinField extends StatelessWidget {
  const AppOtpPinField(
      {super.key, this.controller, this.onComplete, this.onChange});
  final TextEditingController? controller;
  final Function(String)? onComplete;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      autoDisposeControllers: false,
      animationType: AnimationType.fade,
      textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
      pinTheme: PinTheme(
          fieldHeight: 45,
          fieldWidth: 45,
          shape: PinCodeFieldShape.box,
          borderWidth: 1,
          activeColor: AppColors.input_bg_color,
          inactiveColor: AppColors.input_bg_color,
          inactiveFillColor: Colors.transparent,
          activeFillColor: Colors.transparent,
          selectedFillColor: Colors.transparent,
          selectedColor: AppColors.primary_color,
          disabledColor: AppColors.input_bg_color,
          borderRadius: BorderRadius.circular(10),
          fieldOuterPadding: EdgeInsets.only(right: 4)),
      cursorColor: AppColors.primary_color,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      controller: controller,
      onCompleted: onComplete,
      onChanged: onChange,
    );
  }
}
