import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class TextSwitchButton extends StatelessWidget {
  const TextSwitchButton({
    super.key,
    required this.ontoggle,
    required this.value,
    this.size = 12,
  });

  final bool value;
  final Function(bool) ontoggle;
  final double size;

  @override
  Widget build(BuildContext context) {
    final controller = ValueNotifier<bool>(false);
    return Row(
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: controller,
          builder: (context, switchValue, _) {
            return AppText(
              title: switchValue ? "Garage Open" : "Garage Busy",
              size: 11,
              fontWeight: FontWeight.w500,
              color: switchValue ? AppColors.green_color : AppColors.grey,
            );
          },
        ),
        const Gap(6),
        AdvancedSwitch(
          height: 25,
          width: 45,
          controller: controller,
          thumb: ValueListenableBuilder<bool>(
            valueListenable: controller,
            builder: (_, value, __) {
              return Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: value ? AppColors.white : AppColors.white,
                  shape: BoxShape.circle,
                ),
              );
            },
          ),
          activeColor: AppColors.lightgreen,
          inactiveColor: AppColors.grey,
        )
      ],
    );
  }
}
