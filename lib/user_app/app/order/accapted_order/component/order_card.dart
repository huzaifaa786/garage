import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/order/accapted_order/accapted_order_controller.dart';
import 'package:mobilegarage/user_app/components/buttons/curved_container.dart';
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
        child: Container(
          width: Get.width * 0.9,
         // width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // border: Border.all(
            //   color: controller.isSelected
            //       ? AppColors.primary
            //       : Colors.transparent,
            // ),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(13)),
                  child: CachedNetworkImage(
                    imageUrl: 'https://dummyimage.com/70x70/000/fff',
                    height: 170,
                    width: Get.width * 0.57,
                    fit: BoxFit.fill,
                    placeholderFadeInDuration: Duration(milliseconds: 500),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.white,
                        height: 170,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                // Gap(4),
                Flexible(
                  child: Column(
                    children: [
                      //  Gap(4),
                      Container(
                        height: 112,
                        // width: 115,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60)),
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(60),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(13)),
                          child: CachedNetworkImage(
                            // height: 72,
                            imageUrl: 'https://dummyimage.com/97x72/000/fff',
                            fit: BoxFit.cover,
                            placeholderFadeInDuration:
                                Duration(milliseconds: 500),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      AppText(
                        title: 'Super car oil',
                        size: 11,
                        fontWeight: FontWeight.w600,
                      ),
                      Gap(4),
                      AppText(
                        title: 'Car oil 700 ml best quality for all car types',
                        size: 9,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overFlow: TextOverflow.ellipsis,
                      ),
                      Gap(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            title: '30.50 AED',
                            size: 9,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkblue,
                          ),
                        ],
                      ),
                      Gap(4),
                    ],
                  ),
                ),
                Gap(4),
              ],
            ),
            Padding(
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
              padding: EdgeInsets.only(left: 20, top: 6),
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
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Colors.yellow),
                    onRatingUpdate: (rating) {
                      controller.updateRating(rating);
                    },
                  ),
                  Gap(10),
                  AppText(
                    title: controller.ratings.toString(),
                    size: 8.0,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 7,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
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
              padding: EdgeInsets.only(top: 15, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                                print('object');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.lightprimary,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                                height: Get.height * 0.05,
                                width: Get.width * 0.6,
                                child: Center(
                                  child: Text(
                                    'View garage',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(13),
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
                  Gap(17),
                  // if (isSelected)
                  controller.isSelected
                      ? SvgPicture.asset(
                          'assets/icons/check-circle.svg',
                          height: 20,
                          width: 20,
                          color: AppColors.primary,
                        )
                      : Text(''),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
