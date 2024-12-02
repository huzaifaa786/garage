
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/profile/trading_license/trading_license_controller.dart';

class LicenseImagePickerr extends StatelessWidget {
  const LicenseImagePickerr({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TradingLicenseController>(
      builder: (controller) => DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 1.0,
        color: controller.license != null &&
                controller.license!.path.isNotEmpty
            ? AppColors.green_color
            : AppColors.primary_color,
        dashPattern: const <double>[4, 2],
        padding: const EdgeInsets.all(0),
        radius: const Radius.circular(5),
        child: ClipRRect(
            borderRadius:  BorderRadius.circular(10),
            child: Container(
              height: 160,
              width: Get.width,
              padding: EdgeInsets.all(1),
              child: controller.license == null ||
                      controller.license!.path.isEmpty
                  ? AppNetworkImage(
                      networkImage: controller.garage!.license,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      controller.license!,
                      height: 160,
                      fit: BoxFit.cover,
                      width: Get.width,
                    ),
            )),
      ),
    );
  }
}
