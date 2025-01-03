// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class FragmentThreeView extends StatefulWidget {
  const FragmentThreeView({
    super.key,
  });

  @override
  State<FragmentThreeView> createState() => _FragmentOneState();
}

class _FragmentOneState extends State<FragmentThreeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Image.asset(
            'assets/images/onboarding3.png',
            fit: BoxFit.cover,
          ),
          AppText(
            title: 'All car supplies between your hand!',
            size: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.black.withOpacity(0.5),
          ),
          AppText(
            title: 'Sign up & discover now!',
            size: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
