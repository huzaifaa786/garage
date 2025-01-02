// ignore_for_file: unnecessary_import, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:mobilegarage/models/garage_model.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_controller.dart';
import 'package:mobilegarage/user_app/components/buttons/curved_container.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class OrderCard extends StatelessWidget {
  OrderCard(
      {super.key,
      required this.garage,
      this.location,
      this.city,
      required this.isSelected,
      required this.ontap,
      this.onchattap});
  GarageModel garage;
  final String? location;
  final String? city;
  final bool isSelected;
  final ontap;
  final onchattap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterServiceController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.all(15),
          child: GestureDetector(
            onTap: ontap,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color:
                          isSelected ? AppColors.primary : Colors.transparent,
                    ),
                    color: AppColors.white,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(13)),
                            child: AppNetworkImage(
                              networkImage: garage.banner.toString(),
                              assetPath: 'assets/images/garage.png',
                              width: 230,
                              height: 153,
                              fit: BoxFit.cover,
                            )),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: Get.height * 0.1,
                                width: Get.width * 0.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(13)),
                                  child: AppNetworkImage(
                                    networkImage: controller.path != 'filter'
                                        ? garage.order!.orderItems![0].products!
                                            .images![0].imageUrl
                                            .toString()
                                        : garage
                                            .products![0].images!.first.imageUrl
                                            .toString(),
                                    assetPath: 'assets/images/mobiloil.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Gap(5),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: AppText(
                                  title: controller.path != 'filter'
                                      ? (garage.order?.orderItems?[0].products?.brands != null
                                          ? garage.order!.orderItems![0]
                                              .products!.brands!.name
                                              .toString()
                                          : garage
                                                  .order!
                                                  .orderItems![0]
                                                  .productsExtra
                                                  ?.categoryExtra
                                                  ?.name
                                                  ?.toString() ??
                                              '')
                                      : (garage.products?[0].oilextra?.isEmpty ?? true
                                          ? garage.products![0].brands?.name
                                                  .toString() ??
                                              ''
                                          : (garage.products![0].categoryId == '2'
                                              ? garage.products![0].brands?.name
                                                      .toString() ??
                                                  ''
                                              : garage.products![0].oilextra![0].name
                                                      ?.toString() ??
                                                  '')),
                                  size: 11,
                                  fontWeight: FontWeight.w600,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Gap(4),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: AppText(
                                  title: controller.path != 'filter'
                                      ? (garage.order?.orderItems?[0].products?.description == ''
                                          ? garage.order!.orderItems![0]
                                              .products!.description
                                              .toString()
                                          : garage.order!.orderItems![0]
                                                  .productsExtra?.description
                                                  ?.toString() ??
                                              '')
                                      : (garage.products?[0].oilextra?.isEmpty ?? true
                                          ? garage.products![0].description?.toString() ??
                                              ''
                                          : (garage.products![0].categoryId == '2'
                                              ? garage.products![0].description
                                                      .toString()
                                              : garage.products![0].oilextra![0]
                                                      .description
                                                      ?.toString() ??
                                                  '')),
                                  size: 9,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overFlow: TextOverflow.ellipsis,
                                ),
                              ),
                              Gap(6),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppText(
                                      title: controller.path != 'filter'
                                          ? (garage.order?.orderItems?[0].products?.price != ''
                                              ? garage.order!.orderItems![0]
                                                  .products!.price
                                                  .toString()
                                              : garage.order!.orderItems![0]
                                                      .productsExtra?.price
                                                      ?.toString() ??
                                                  '')
                                          : (garage.products?[0].oilextra?.isEmpty ?? true
                                              ? garage.products![0].price
                                                      ?.toString() ??
                                                  ''
                                              : (garage.products![0].categoryId == '2'
                                                  ? garage.products![0].price
                                                          ?.toString() ??
                                                      ''
                                                  : garage.products![0]
                                                          .oilextra![0].price
                                                          ?.toString() ??
                                                      '')),
                                      size: 9,
                                      maxLines: 1,
                                      overFlow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.darkblue,
                                    ),
                                    Gap(5),
                                    AppText(
                                      title: ' AED'.tr,
                                      size: 9,
                                      maxLines: 1,
                                      overFlow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.darkblue,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 13),
                      child: Row(
                        children: [
                          AppText(
                            title: garage.name.toString(),
                            size: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          Gap(5),
                          AppText(
                            title: garage.servicecount.toString() +
                                ' ' +
                                'Services'.tr,
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
                            initialRating: garage.rating == null
                                ? 0.0
                                : double.parse(garage.rating.toString()),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            glow: false,
                            itemSize: 12,
                            unratedColor: Colors.grey,
                            itemBuilder: (context, _) =>
                                const Icon(Icons.star, color: Colors.yellow),
                            onRatingUpdate: (rating) {
                              // controller.updateRating(rating);
                            },
                          ),
                          const Gap(5),
                          AppText(
                            title: garage.rating ?? '0.0',
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
                          SvgPicture.asset(
                            'assets/icons/map_pin.svg',
                            width: 11,
                            height: 10,
                            fit: BoxFit.scaleDown,
                          ),
                          Gap(3),
                          Flexible(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: city,
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
                                    text: location,
                                    style: TextStyle(
                                        color: AppColors.grey,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, bottom: 12, left: 20),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipPath(
                                    clipper: RightCircularClipper(),
                                    child: GestureDetector(
                                      onTap: ontap,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: AppColors.lightPink,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                bottomLeft:
                                                    Radius.circular(20))),
                                        height: Get.height * 0.05,
                                        width: Get.width * 0.7,
                                        child: Center(
                                          child: Text(
                                            'View garage'.tr,
                                            style: TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 10,
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
                                  onTap: onchattap,
                                  child: Container(
                                      height: Get.height * 0.045,
                                      width: Get.width * 0.085,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightPink,
                                        borderRadius: BorderRadius.circular(80),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/icons/chat.svg',
                                        color: AppColors.primary,

                                        // Image.asset(
                                        //   'assets/images/chat.png',
                                        // ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                          const Gap(17),
                          // if (isSelected)
                          isSelected
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
      },
    );
  }
}
