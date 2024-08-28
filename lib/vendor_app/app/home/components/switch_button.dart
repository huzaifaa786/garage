import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class TextSwitchButton extends StatelessWidget {
  TextSwitchButton({
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
    return Row(
      children: [
        AppText(
          title: value ? "Garage Open" : "Garage Busy",
          size: 11,
          fontWeight: FontWeight.w500,
          color: value ? Colors.green : Colors.grey,
        ),
        Gap(6),
        FlutterSwitch(
            height: 25,
            width: 45,
            activeColor: Colors.green,
            inactiveColor: Colors.grey,
            value: value,
            onToggle: ontoggle)
      ],
    );
  }
}
