// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class FragmentOneView extends StatefulWidget {
  const FragmentOneView({
    super.key,
  });

  @override
  State<FragmentOneView> createState() => _FragmentOneState();
}

class _FragmentOneState extends State<FragmentOneView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Image.asset(
            'assets/images/onboarding1.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: AppText(
              title:
                  'Welcome to Mobile Garage where\n all what you need is on one place',
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
