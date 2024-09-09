import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/profile/editprofile.dart/editprofile_controller.dart';

import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class ProfileAndCoverPickerr extends StatelessWidget {
  const ProfileAndCoverPickerr({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VEditprofileController>(
      builder: (controller) => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              onTap: () {
                 controller.pickImageFromGallery('cover');
              },
              child: DottedBorder(
                borderType: BorderType.RRect,
                strokeWidth: 1.0,
                color:
                     controller.cover != null &&
                            controller.cover!.path.isNotEmpty
                   ?
                      AppColors.green_color
                     :
                    AppColors.primary_color,
                dashPattern: const <double>[4, 2],
                padding: const EdgeInsets.all(0),
                radius: const Radius.circular(5),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child:
                          controller.cover == null ||
                                controller.cover!.path.isEmpty
                           ?
                        Container(
                      height: 160,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: AppColors.primary_color.withOpacity(0.07),
                          image: const DecorationImage(
                              image: CachedNetworkImageProvider(
                                // controller.garage!.banner!,
                                // controller.garage != null
                                //     ? controller.garage!.logo!
                                //     :
                                // 'https://dummyimage.com/60x40/000/fff',
                                '',
                              ),
                              opacity: 0.5,
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImageConst.image_ic,
                                height: 13,
                              ),
                              const Gap(4),
                              AppText(
                                title: ConstantStrings.upload_garage_banner,
                                size: 11,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary_color,
                              )
                            ],
                          ),
                          const Gap(6),
                          AppText(
                            title: ConstantStrings.recomended_image_size,
                            size: 10,
                            color: AppColors.hint_text_color,
                          )
                        ],
                      ),
                    )
                    : Image.file(
                        controller.cover!,
                        height: 160,
                        width: Get.width,
                      ),
                    ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: Get.width * 0.35,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: AppColors.white_color,
                borderRadius: const BorderRadius.all(Radius.circular(35)),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: Get.width * 0.35,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(35)),
              onTap: () {
                 controller.pickImageFromGallery('logo');
              },
              // child: DottedBorder(
              //   borderType: BorderType.RRect,
              //   strokeWidth: 1.0,
              // color:
              //     controller.logo != null && controller.logo!.path.isNotEmpty
              //         ? AppColors.green_color
              //         : AppColors.primary_color,
              // dashPattern: const <double>[4, 2],
              // padding: const EdgeInsets.all(0),
              // radius: const Radius.circular(35),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(35)),
                  child:
                      // controller.logo == null ||
                      //         controller.logo!.path.isEmpty
                      //     ?
                      Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: AppColors.primary_color.withOpacity(0.07),
                        image: const DecorationImage(
                            image: CachedNetworkImageProvider(
                              // controller.garage!.logo!
                              // controller.garage != null
                              //     ? controller.garage!.logo!
                              //     :
                              // 'https://dummyimage.com/60x40/000/fff',
                              '',
                            ),
                            opacity: 0.5,
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImageConst.image_ic,
                          height: 12,
                        ),
                        const Gap(2),
                        AppText(
                          title: ConstantStrings.upload_logo,
                          size: 9,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary_color,
                        ),
                        const Gap(2),
                        AppText(
                          title: ConstantStrings.seventy_square,
                          size: 8,
                          fontWeight: FontWeight.w500,
                          color: AppColors.hint_text_color,
                        ),
                      ],
                    ),
                  )
                  // : Image.file(
                  //     controller.logo!,
                  //     height: 70,
                  //     width: 70,
                  //   ),
                  ),
            ),
          ),
          // )
        ],
      ),
    );
  }
}
