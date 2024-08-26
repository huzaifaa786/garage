import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/decorations/box_decoration.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';

class DropdownItem {
  final String title;
  final String? icon; // Explicitly make the icon nullable

  DropdownItem({required this.title, this.icon});
}

class MainInputDropdown extends StatefulWidget {
  const MainInputDropdown({
    super.key,
    required this.hint,
    required this.controller,
    this.errorText,
    this.onchange,
    required this.items,
    this.show,
  });

  final String hint;
  final TextEditingController controller;
  final String? errorText; // Nullable String
  final Function(String)? onchange;
  final List<DropdownItem> items;
  final bool? show;

  @override
  State<MainInputDropdown> createState() => _MainInputDropdownState();
}

class _MainInputDropdownState extends State<MainInputDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = null;
    _ensureUniqueItems();
  }

  void _ensureUniqueItems() {
    Set<String> uniqueTitles = {};
    for (var item in widget.items) {
      if (!uniqueTitles.add(item.title)) {
        throw FlutterError(
            'Duplicate items detected in DropdownButton: ${item.title}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
             padding: EdgeInsets.only(left: 10),
            width: Get.width,
            decoration: (widget.errorText?.isNotEmpty ?? false)
                ? circularErrorInputDecoration
                : circularInputDecoration,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                
                hint: AppText(
                  title: widget.hint,
                  size: 13,
                  fontWeight: FontWeight.w400,
                    color: AppColors.black.withOpacity(0.4),
                ),
                items: widget.items.map((DropdownItem item) {
                  return DropdownMenuItem<String>(
                    value: item.title,
                    child: Row(
                      children: [
                        if (item.icon != null)
                          SvgPicture.asset(
                            item.icon!,
                            color: item.title == selectedValue
                                ? AppColors.white_color
                                : AppColors.black,
                          ),
                        Gap(8),
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: item.title == selectedValue
                                ? AppColors.white_color
                                : AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                // value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                  if (widget.onchange != null) {
                    widget.onchange!(value!);
                  }
                },
                selectedItemBuilder: (BuildContext context) {
                  return widget.items.map((item) {
                    return Center(
                      child: Row(
                        children: [
                          AppText(
                            title: item.title,
                            size: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
                menuItemStyleData: MenuItemStyleData(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  selectedMenuItemBuilder: (context, child) =>
                      Container(color: AppColors.primary_color, child: child),
                ),
                iconStyleData: IconStyleData(
                  icon: SvgPicture.asset(ImageConst.drop_down_icon),
                ),
                buttonStyleData: ButtonStyleData(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
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
          if (widget.errorText?.isNotEmpty ?? false)
            Padding(
              padding: EdgeInsets.only(top: 4, left: 16, right: 16),
              child: AppText(
                title: widget.errorText!,
                color: AppColors.primary_color,
                size: 10,
              ),
            ),
        ],
      ),
    );
  }
}
