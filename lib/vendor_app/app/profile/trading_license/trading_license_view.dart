// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_up/components/image_selection_tile.dart';
import 'package:mobilegarage/vendor_app/app/profile/trading_license/components/profile_cover_picker.dart';
import 'package:mobilegarage/vendor_app/app/profile/trading_license/trading_license_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';

class TradingLicenseView extends StatelessWidget {
  const TradingLicenseView({super.key});
  void _showImageSourceDialog(BuildContext context,
      TradingLicenseController controller, String imageName) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text('Choose from Gallery'.tr),
              onTap: () {
                Navigator.of(context).pop();
                controller
                    .pickImageFromGallery(imageName); // Existing functionality
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text('Take a Photo'.tr),
              onTap: () {
                Navigator.of(context).pop();
                controller
                    .pickImageFromCamera(imageName); // New camera functionality
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TradingLicenseController>(
        autoRemove: false,
        builder: (controller) => controller.garage != null
            ? AppLayout(
                appBarTitle: 'Trading License'.tr,
                hasBgColor: false,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 40),
                        child: Row(
                          children: [
                            Expanded(child: LicenseImagePickerr()),
                            if (controller.license != null) Gap(15),
                            if (controller.license != null)
                              InkWell(
                                onTap: () {
                                  controller.removeLicenseImage();
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/delete.svg',
                                  height: 17,
                                  width: 17,
                                ),
                              )
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 6,
                        color: AppColors.grey.shade200,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 40),
                        child: AppText(
                          title: 'Add New Trading License'.tr,
                          size: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: ImageSelectionTile(
                          title: 'Upload license'.tr,
                          onTap: () {
                            // controller.pickImageFromGallery('upload_license');
                            _showImageSourceDialog(
                                context, controller, 'upload_license');
                          },
                          isSelected: controller.license != null &&
                              controller.license!.path.isNotEmpty,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: MainButton(
                          title: 'Confirm'.tr,
                          onTap: () {
                            controller.updatelicense();
                          },
                        ),
                      )
                    ],
                  ),
                ))
            : Text(''));
  }
}
