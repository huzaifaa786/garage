import 'package:flutter/material.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class Circle extends StatelessWidget {
  const Circle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: AppColors.primarybg,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
