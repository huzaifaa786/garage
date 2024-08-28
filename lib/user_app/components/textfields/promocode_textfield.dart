// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/borders/border.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/decorations/box_decoration.dart';
class PromocodeTextfield extends StatelessWidget {
  const PromocodeTextfield({
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
    this.isApplied = false,
    required this.onTap,
  });

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
  final void Function(String)? onchange;
  final bool isApplied;
  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: circularInputDecoration,
      child: Row(
        children: [
          Flexible(
            child: SizedBox(
              width: Get.width * 0.6,
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
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 15),
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
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: ElevatedButton(
              
              
              style: ElevatedButton.styleFrom(
               
                backgroundColor:
                    isApplied ? AppColors.white : AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                minimumSize: Size(35,35)
              ),
              onPressed: onTap,
              child: Text(
                isApplied ? 'Applied' : 'Apply',
                style: TextStyle(
                  color: isApplied ? AppColors.lightgreen : AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
