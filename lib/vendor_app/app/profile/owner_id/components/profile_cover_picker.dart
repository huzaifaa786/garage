
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/profile/owner_id/owner_id_controller.dart';

class OwnerIdImagePickerr extends StatelessWidget {
    final String imageType;
  const OwnerIdImagePickerr({super.key,required this.imageType});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnerIdController>(
      builder: (controller) {
         File? imageFile;
        String? networkImage;
        if (imageType == 'idfront') {
          imageFile = controller.idfront;
          networkImage = controller.garage?.idFront; 
        } else if (imageType == 'idback') {
          imageFile = controller.idback;
          networkImage = controller.garage?.idBack; 
        }
        return DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 1.0,
        color: imageFile != null &&
                imageFile.path.isNotEmpty
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
              child: imageFile == null ||
                      imageFile.path.isEmpty
                  ? AppNetworkImage(
                      networkImage: networkImage,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      imageFile,
                      height: 160,
                      fit: BoxFit.cover,
                      width: Get.width,
                    ),
            )),
      );
      },
    );
  }
}
