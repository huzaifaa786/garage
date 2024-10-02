import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/product/edit_product/edit_product_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';
import 'package:shimmer/shimmer.dart';

class EditProductImagesPicker extends StatelessWidget {
  const EditProductImagesPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProductController>(
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
                              title: ConstantStrings.upload_services_photos,
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
                                title: ConstantStrings.upload_services_photos,
                                size: 10,
                                color: AppColors.primary_color,
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: List.generate(
                                controller.images.length,
                                (i) {
                                  var image = controller.images[i];
                                  return Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 8, right: 6),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.primary_color,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: AppNetworkImage(
                                            networkImage: image,
                                            height: 60,
                                            width: 60,
                                            fit: BoxFit.cover,
                                            assetPath:
                                                'assets/images/battery.png',
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
                                                controller.deleteimage(controller.product!.images![i].id.toString(),
                                                    controller.product!.id.toString());
                                              },
                                              title:
                                                  'Are you sure you want to delete this Image?',
                                              cancelText: 'Cancel',
                                              confirmText: 'Delete',
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
                            Gap(10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: List.generate(
                                controller.newimages.length,
                                (i) {
                                  var image = controller.newimages[i];
                                  return Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 8, right: 6),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.primary_color,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.file(
                                            image,
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
                                                controller
                                                    .removeSelectedNewImages(i);
                                              },
                                              title:
                                                  'Are you sure you want to delete this Image?',
                                              cancelText: 'Cancel',
                                              confirmText: 'Delete',
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
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
