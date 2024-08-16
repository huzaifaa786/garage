// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class FragmentTwoView extends StatefulWidget {
  const FragmentTwoView({
    super.key,
  });

  @override
  State<FragmentTwoView> createState() => _FragmentOneState();
}

class _FragmentOneState extends State<FragmentTwoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Image.asset(
            'assets/images/onboarding2.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: AppText(
              title: 'Book service appointments \nand  save your time',
              size: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.black.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
