// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';

class ContainerSelect extends StatelessWidget {
  const ContainerSelect({
    super.key,
    this.text,
  });
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: Get.height * 0.2,
            width: Get.width * 0.9,

            child: Text(text),
            decoration: BoxDecoration(color: AppColors.light_red),
          )
        ],
      ),
    );
  }
}
