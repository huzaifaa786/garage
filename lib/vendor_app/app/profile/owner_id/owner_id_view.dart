// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_up/components/image_selection_tile.dart';
import 'package:mobilegarage/vendor_app/app/profile/owner_id/components/profile_cover_picker.dart';
import 'package:mobilegarage/vendor_app/app/profile/owner_id/owner_id_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';

class OwnerIdView extends StatelessWidget {
  const OwnerIdView({super.key});
  void _showImageSourceDialog(
      BuildContext context, OwnerIdController controller, String imageName) {
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
    return GetBuilder<OwnerIdController>(
        autoRemove: false,
        builder: (controller) => controller.garage != null
            ? AppLayout(
                appBarTitle: 'Owner ID'.tr,
                hasBgColor: false,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: AppText(
                                title: 'Front side'.tr,
                                size: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Expanded(
                                    child: OwnerIdImagePickerr(
                                  imageType: 'idfront',
                                )),
                                if (controller.idfront != null) Gap(15),
                                if (controller.idfront != null)
                                  InkWell(
                                    onTap: () {
                                      controller.removeLicenseImage('idfront');
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/delete.svg',
                                      height: 17,
                                      width: 17,
                                    ),
                                  )
                              ],
                            ),
                            Gap(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: AppText(
                                title: 'Back side'.tr,
                                size: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Expanded(
                                    child: OwnerIdImagePickerr(
                                  imageType: 'idback',
                                )),
                                if (controller.idback != null) Gap(15),
                                if (controller.idback != null)
                                  InkWell(
                                    onTap: () {
                                      controller.removeLicenseImage('idback');
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/delete.svg',
                                      height: 17,
                                      width: 17,
                                    ),
                                  )
                              ],
                            ),
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
                          title: 'Add New Owner ID'.tr,
                          size: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: ImageSelectionTile(
                          title: 'Upload the front side'.tr,
                          onTap: () {
                            // controller.pickImageFromGallery('idfront');
                            _showImageSourceDialog(
                                context, controller, 'idfront');
                          },
                          isSelected: controller.idfront != null &&
                              controller.idfront!.path.isNotEmpty,
                        ),
                      ),
                      Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: ImageSelectionTile(
                          title: 'Upload the Back side'.tr,
                          onTap: () {
                            // controller.pickImageFromGallery('idback');
                            _showImageSourceDialog(
                                context, controller, 'idback');
                          },
                          isSelected: controller.idback != null &&
                              controller.idback!.path.isNotEmpty,
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
