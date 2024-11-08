import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/utils.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class AppBarr extends StatelessWidget {
  const AppBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 3),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: AppBar(
          centerTitle: true,
          title: AppText(
            title:  'Edit Profile'.tr,
            size: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.primary_color,
          ),
          elevation: 0,
          backgroundColor: Colors.white),
    );
  }
}
