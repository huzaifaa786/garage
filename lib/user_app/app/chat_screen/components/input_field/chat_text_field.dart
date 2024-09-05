import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

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
          fillColor: AppColors.borderlightgrey,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 12),

          suffixIcon: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              suffiximage.toString(),
              height: 20,
              width: 20,
              fit: BoxFit.scaleDown,
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
          // Center the text vertically
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
