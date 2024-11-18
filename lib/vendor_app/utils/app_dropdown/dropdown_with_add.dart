// ignore_for_file: prefer_const_constructors

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/decorations/box_decoration.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';

class DropDownWithAdd<T> extends StatelessWidget {
  DropDownWithAdd({
    super.key,
    required this.items,
    this.hint,
    this.selectedValue,
    this.onChanged,
    this.errorText,
    this.displayValue,
    this.onAddPressed, // Add a callback for "Add" button
  });

  final List<T> items;
  final String? hint;
  T? selectedValue;
  final ValueChanged<T?>? onChanged;
  final String Function(T)? displayValue;
  final String? errorText;
  final VoidCallback? onAddPressed; // Add this for "Add" button functionality

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: Get.width,
          decoration: errorText!.isNotEmpty
              ? circularErrorInputDecoration
              : circularInputDecoration,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              hint: AppText(
                title: hint!,
                size: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.black.withOpacity(0.4),
              ),
              items: [
                ...items
                    .map((item) => DropdownMenuItem<T>(
                          value: item,
                          child: Text(
                            displayValue!(item),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: item == selectedValue
                                  ? AppColors.white_color
                                  : AppColors.black_color,
                            ),
                          ),
                        ))
                    .toList(),
                DropdownMenuItem<T>(
                  value: null,
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    child:
                        Icon(Icons.add_circle_outline_sharp, color: Colors.red),
                  ),
                ),
              ],
              value: selectedValue,
              onChanged: (value) {
                // Check if the Add button was clicked
                if (value == null && onAddPressed != null) {
                  onAddPressed!(); // Trigger "Add" button action
                } else if (onChanged != null) {
                  onChanged!(value);
                }
              },
              selectedItemBuilder: (BuildContext context) {
                return items.map((item) {
                  return Center(
                    child: AppText(
                      title: displayValue!(item),
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  );
                }).toList();
              },
              menuItemStyleData: MenuItemStyleData(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                selectedMenuItemBuilder: (context, child) =>
                    Container(color: AppColors.primary_color, child: child),
              ),
              iconStyleData: IconStyleData(
                icon: SvgPicture.asset(ImageConst.drop_down_icon),
              ),
              buttonStyleData: ButtonStyleData(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColors.input_bg_color,
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                direction: DropdownDirection.left,
                maxHeight: Get.height * 0.4,
                width: 160,
                padding: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 16, right: 16),
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
