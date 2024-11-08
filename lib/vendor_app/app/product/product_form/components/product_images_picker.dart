import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/product/product_form/product_form_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class ProductImagesPicker extends StatelessWidget {
  const ProductImagesPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductFormController>(
      builder: (controller) => InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: controller.onMultipleImagePick,
        child: DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 1.0,
          color: AppColors.primary_color,
          dashPattern: const <double>[4, 2],
          padding: const EdgeInsets.all(0),
          radius: const Radius.circular(5),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: controller.images.isEmpty
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
                              title: 'Upload services photos'.tr,
                              size: 10,
                              color: AppColors.primary_color,
                            )
                          ],
                        ),
                        const Gap(6),
                        AppText(
                          title: 'Recomended size 390 * 185 px'.tr,
                          size: 8,
                          color: AppColors.hint_text_color,
                        )
                      ],
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(8.0),
                    color: AppColors.primary_color.withOpacity(0.07),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(ImageConst.image_ic),
                              const Gap(4),
                              AppText(
                                title:  'Upload services photos'.tr,
                                size: 10,
                                color: AppColors.primary_color,
                              )
                            ],
                          ),
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            controller.images.length,
                            (i) {
                              return Stack(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 8, right: 6),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.primary_color,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.file(
                                        controller.images[i],
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -2,
                                    right: -2,
                                    child: InkWell(
                                      onTap: () {
                                        UiUtilites.confirmAlertDialog(
                                          context: context,
                                          onCancelTap: () {
                                            Get.back();
                                          },
                                          onConfirmTap: () {
                                            controller.removeSelectedImages(i);
                                          },
                                          title:
                                              'Are you sure you want to delete this Image?'.tr,
                                          cancelText: 'Cancel'.tr,
                                          confirmText: 'Delete'.tr,
                                        );
                                      },
                                      child: Icon(
                                        Icons.cancel,
                                        color: AppColors.primary_color,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
