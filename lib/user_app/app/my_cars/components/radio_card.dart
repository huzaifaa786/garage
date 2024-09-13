// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/models/user_vehicles.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/ui_utils/ui_utils.dart';

class RadioCard extends StatelessWidget {
   RadioCard({
    super.key,
    this.addCars,
    this.groupValue,
    this.onChanged,
    this.value,
    this.isSelected,this.userVehicles,
  });
  final addCars;
  final value;
  final groupValue;
  final onChanged;
  final isSelected;
  UserVehicles? userVehicles;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => onChanged(value),
          child: Container(
            margin: EdgeInsets.only(top: 8, bottom: 8),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: Get.height * 0.1 / 1.3,
            width: Get.width * 0.66,
            decoration: BoxDecoration(
                color:
                    isSelected ? AppColors.lightPink : AppColors.grey.shade200,
                borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(imageUrl: userVehicles!.image.toString()),
                ),
                AppText(
                  title: addCars["radioTitle"],
                  color: isSelected ? AppColors.primary : AppColors.darkprimary,
                  size: 10,
                  fontWeight: FontWeight.w500,
                ),
                Radio<String>(
                  fillColor: WidgetStatePropertyAll(AppColors.primary),
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            UiUtilites.DeleteAlert(
                context, "White mercedes 2022", addCars["deleteOnTap"], () {
              Navigator.of(context).pop();
            });
          },
          child: SvgPicture.asset("assets/icons/trash.svg"),
        )
      ],
    );
  }
}
