import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/banner/banner_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class CoverPickerr extends StatelessWidget {
  const CoverPickerr({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VBannerController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          onTap: () {
            controller.pickImageFromGallery('cover');
          },
          child: DottedBorder(
            borderType: BorderType.RRect,
            strokeWidth: 1.0,
            color: controller.cover != null &&
                    controller.cover!.path.isNotEmpty
                ? AppColors.green_color
                : AppColors.primary_color,
            dashPattern: const <double>[4, 2],
            padding: const EdgeInsets.all(0),
            radius: const Radius.circular(5),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: controller.cover == null ||
                      controller.cover!.path.isEmpty
                  ? Container(
                      height: 160,
                      width: Get.width,
                      color: AppColors.primary_color.withOpacity(0.07),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(ImageConst.image_ic),
                              const Gap(4),
                              AppText(
                                title: ConstantStrings.upload_garage_banner,
                                size: 10,
                                color: AppColors.primary_color,
                              )
                            ],
                          ),
                          const Gap(6),
                          AppText(
                            title: ConstantStrings.recomended_image_size,
                            size: 8,
                            color: AppColors.hint_text_color,
                          )
                        ],
                      ),
                    )
                  : Image.file(
                      controller.cover!,
                      height: 160,
                      fit:BoxFit.cover,
                      width: Get.width,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}