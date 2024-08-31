import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/order/accapted_order/accapted_order_controller.dart';
import 'package:mobilegarage/user_app/components/buttons/curved_container.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:shimmer/shimmer.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({super.key});

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccaptedOrderController>(
      builder: (controller) => GestureDetector(
        onTap: controller.toggleSelection,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              // width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: controller.isSelected
                      ? AppColors.primary
                      : Colors.transparent,
                ),
                color: AppColors.white,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 5,
                //     blurRadius: 9,
                //     offset: Offset(2, 2),
                //   ),
                // ],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Column(children: [
                Row(
                  children: [
                    const ClipRRect(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(13)),
                        child: AppNetworkImage(
                          assetPath: 'assets/images/garage.png',
                          width: 190,
                          height: 173,
                        )),
                    Flexible(
                      child: Column(
                        children: [
                          //  Gap(4),
                          Container(
                            height: 112,

                            // width: 115,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60)),
                            child: const ClipRRect(
                                // borderRadius: BorderRadius.circular(60),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(13)),
                                child: AppNetworkImage(
                                  assetPath: 'assets/images/mobiloil.png',
                                )),
                          ),

                          const AppText(
                            title: 'Super car oil',
                            size: 11,
                            fontWeight: FontWeight.w600,
                          ),
                          const Gap(4),
                          const AppText(
                            title:
                                'Car oil 700 ml best quality\n for all car types',
                            size: 9,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overFlow: TextOverflow.ellipsis,
                          ),
                          const Gap(4),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                title: '30.50 AED',
                                size: 8,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkblue,
                              ),
                            ],
                          ),
                          const Gap(4),
                        ],
                      ),
                    ),
                    const Gap(4),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 13),
                  child: Row(
                    children: [
                      AppText(
                        title: 'Street Garage ',
                        size: 13,
                        fontWeight: FontWeight.w600,
                      ),
                      Gap(3),
                      AppText(
                        title: '14 Services',
                        size: 9,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkblue,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 6),
                  child: Row(
                    children: [
                      RatingBar.builder(
                        initialRating: controller.ratings,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        glow: false,
                        itemSize: 14,
                        unratedColor: Colors.grey,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) =>
                            const Icon(Icons.star, color: Colors.yellow),
                        onRatingUpdate: (rating) {
                          controller.updateRating(rating);
                        },
                      ),
                      const Gap(10),
                      AppText(
                        title: controller.ratings.toString(),
                        size: 8.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 7,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 15,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: "Dubai",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                            TextSpan(
                              text: "  ",
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text: "Zayed street , road 3452",
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 12, left: 20),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipPath(
                                clipper: RightCircularClipper(),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.garage);
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: AppColors.lightprimary,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    height: Get.height * 0.05,
                                    width: Get.width * 0.65,
                                    child: const Center(
                                      child: Text(
                                        'View garage',
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(13),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            top: Get.height * 0.003,
                            child: GestureDetector(
                              onTap: () {
                                print('object23');
                              },
                              child: Container(
                                height: Get.height * 0.045,
                                width: Get.width * 0.085,
                                decoration: BoxDecoration(
                                  color: AppColors.lightprimary,
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: Image.asset(
                                  'assets/images/chat.png',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(17),
                      // if (isSelected)
                      controller.isSelected
                          ? SvgPicture.asset(
                              'assets/icons/check-circle.svg',
                              height: 20,
                              width: 20,
                              color: AppColors.primary,
                            )
                          : const Text(''),
                    ],
                  ),
                )
              ]),
            ),
            Positioned(
              top: 11,
              left: 20,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(53),
                  child: const AppNetworkImage(
                    assetPath: 'assets/images/street_garage.png',
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
