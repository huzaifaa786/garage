import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:get/get.dart';

class TextSwitchButton extends StatelessWidget {
  const TextSwitchButton({
    super.key,
    required this.ontoggle,
    required this.value,
  });

  final bool value;
  final Function(bool) ontoggle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          title: value ? "Garage Open".tr : "Garage Busy".tr,
          size: 11,
          fontWeight: FontWeight.w500,
          color: value ? AppColors.green_color : AppColors.grey,
        ),
        const Gap(6),
        Switch(
          onChanged: ontoggle,
          value: value,
          activeColor: AppColors.white,
          inactiveThumbColor: AppColors.white,
          inactiveTrackColor: AppColors.grey,
          activeTrackColor: AppColors.green_color,
          trackOutlineColor:
              MaterialStateProperty.all<Color>(Colors.transparent),
          thumbIcon: WidgetStatePropertyAll(Icon(Icons.circle)),
        )
      ],
    );
  }
}
