import 'package:flutter/material.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class BottomsheetContainer extends StatefulWidget {
  const BottomsheetContainer({super.key});

  @override
  _BottomsheetContainerState createState() => _BottomsheetContainerState();
}

class _BottomsheetContainerState extends State<BottomsheetContainer> {
  bool istap = true;

  void _toggleTap() {
    setState(() {
      istap = !istap; // Toggle the value of istap
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleTap,
      child: Container(
        height: 31,
        width: 103,
        decoration: BoxDecoration(
          color: istap ? AppColors.primary : Colors.white, // Toggle colors
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.primary),
        ),
        child: Center(
          child: AppText(
            title: 'From low to high',
            size: 10,
            fontWeight: FontWeight.w500,
            color: istap ? Colors.white : Colors.black, // Toggle text color
          ),
        ),
      ),
    );
  }
}
