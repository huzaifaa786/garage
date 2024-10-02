// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/app/profile/trading_license/components/profile_cover_picker.dart';
import 'package:mobilegarage/vendor_app/app/profile/trading_license/trading_license_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';

class TradingLicenseView extends StatelessWidget {
  const TradingLicenseView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TradingLicenseController>(
        autoRemove: false,
        builder: (controller) => AppLayout(
            appBarTitle: 'Trading License',
            hasBgColor: false,
            child: Column(
              children: [
                AppText(
                  title: '     *Select date to view sales',
                  size: 14,
                  fontWeight: FontWeight.w500,
                ),

                LicenseImagePickerr(),
              ],
            )));
  }
}
