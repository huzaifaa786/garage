// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class VehicleListTile extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String?>? onChanged;
  final String iconPath;
  final String text;
  final ontap;
  final dumnyImage;

  const VehicleListTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.iconPath,
    required this.text,
    this.dumnyImage,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: GestureDetector(
        onTap: ontap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              fillColor: MaterialStatePropertyAll(AppColors.primarybg),
            ),
            Row(
              children: [
                iconPath.isEmpty
                    ? SizedBox.shrink()
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: AppNetworkImage(
                          networkImage: iconPath,
                          assetPath: "assets/images/coupe.png",
                          fit: BoxFit.cover,
                        )),
                Gap(10),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
