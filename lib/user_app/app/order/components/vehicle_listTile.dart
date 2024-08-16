// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class VehicleListTile extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String?>? onChanged;
  final String iconPath;
  final String text;

  const VehicleListTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.iconPath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          Row(
            children: [
              SvgPicture.asset(
                iconPath,
                color: AppColors.primarybg,
                height: 25,
                width: 25,
              ),
              Gap(5),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primarybg,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
