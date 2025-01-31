import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/decorations/box_decoration.dart';

import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class DropDownField<T> extends StatelessWidget {
  DropDownField({
    super.key,
    required this.items,
    this.hint,
    this.selectedValue,
    this.onChanged,
    this.errorText,
    this.displayValue,
    this.isRTL = false,
  });

  final List<T> items;
  final String? hint;
  T? selectedValue;
  final ValueChanged<T?>? onChanged;
  final String Function(T)? displayValue;
  final String? errorText;
  final bool isRTL;

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Directionality(
          textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: Container(
            height: 55,
            width: Get.width,
            decoration: (errorText?.isNotEmpty ?? false)
                ? circularErrorInputDecoration
                : circularInputDecoration,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                hint: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      title: hint ?? '',
                      size: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black.withOpacity(0.4),
                    ),
                  ],
                ),
                items: items
                    .map((item) => DropdownMenuItem<T>(
                          value: item,
                          child: Align(
                            alignment: Alignment.centerRight,
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
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  if (onChanged != null) {
                    onChanged!(value as T?);
                  }
                },
                selectedItemBuilder: (BuildContext context) {
                  return items.map((item) {
                    return Center(
                      child: AppText(
                        title: displayValue!(item),
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black_color,
                      ),
                    );
                  }).toList();
                },
                dropdownSearchData: DropdownSearchData(
                  searchController: searchController,
                  searchInnerWidget: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Search'.tr,
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: AppColors.black.withOpacity(0.4),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchInnerWidgetHeight: 50,
                  searchMatchFn: (item, searchValue) {
                    return displayValue != null &&
                        displayValue!(item.value as T)
                            .toLowerCase()
                            .contains(searchValue.toLowerCase());
                  },
                ),
                menuItemStyleData: MenuItemStyleData(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  selectedMenuItemBuilder: (context, child) =>
                      Container(color: AppColors.primary_color, child: child),
                ),
                iconStyleData: IconStyleData(
                  icon: SvgPicture.asset(
                    ImageConst.drop_down_icon,
                  ),
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
        ),
        if (errorText?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 16, right: 16),
            child: AppText(
              title: errorText!,
              color: AppColors.red,
              size: 10,
            ),
          ),
      ],
    );
  }
}
