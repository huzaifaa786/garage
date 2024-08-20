import 'package:flutter/material.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';


class BottomsheetContainer extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const BottomsheetContainer({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 31,
        width: 103,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white, // Toggle colors
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.primary),
        ),
        child: Center(
          child: AppText(
            title: 'From low to high',
            size: 10,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black, // Toggle text color
          ),
        ),
      ),
    );
  }
}
