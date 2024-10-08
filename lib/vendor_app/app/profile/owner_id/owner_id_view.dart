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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnerIdController>(
        autoRemove: false,
        builder: (controller) => controller.garage != null
            ? AppLayout(
                appBarTitle: 'Owner ID',
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
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: AppText(
                                title: 'Front side',
                                size: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Expanded(child: OwnerIdImagePickerr(imageType: 'idfront',)),
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
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: AppText(
                                title: 'Back side',
                                size: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Expanded(child: OwnerIdImagePickerr(imageType: 'idback',)),
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
                          title: 'Add New Owner ID',
                          size: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: ImageSelectionTile(
                          title: 'Upload the front side',
                          onTap: () {
                            controller.pickImageFromGallery('idfront');
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
                          title: 'Upload the Back side',
                          onTap: () {
                            controller.pickImageFromGallery('idback');
                          },
                          isSelected: controller.idback != null &&
                              controller.idback!.path.isNotEmpty,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: MainButton(
                          title: 'Confirm',
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
