import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobilegarage/user_app/app/search/search_controller.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

Widget SelectedFilterCard(
    {String? text, required SearchScreenController controller, required VoidCallback onCancel,}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: AppColors.lightPink,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Center(
      child: Row(mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            title: text.toString(),
            color: AppColors.primarybg,
            size: 12,
          ),
          Gap(5),
          GestureDetector(
            onTap: onCancel,
            child: Icon(
              Icons.cancel_outlined,
              size: 13,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    ),
  );
}
