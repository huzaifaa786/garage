// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({
    super.key,
    this.orders,
  });
  final Map<String, dynamic>? orders;

  @override
  Widget build(BuildContext context) {
    // String productDetail = orders!['product_Detail'];
    // String productType = orders!['product_type'];
    String carWashDate = orders!['date'];
    String carWashTime = orders!['time'];
    String quantity = orders!["quantity"];

    return Wrap(
      children: [
        Container(
          margin: EdgeInsets.only(top: 7, bottom: 7),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          color: AppColors.white,
          child: Column(
            children: [
              Gap(20),
              Row(
                children: [
                  Container(
                    height: Get.height * 0.1 / 13,
                    width: Get.width * 0.1 / 13,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.darkprimary,
                    ),
                  ),
                  Gap(3),
                  AppText(
                    title: "Tracking Number  (${orders!['TrackingNumber']})",
                    color: AppColors.primary_color,
                    size: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              Gap(15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 95.0,
                    height: 98.0,
                    decoration: BoxDecoration(
                      color: Color(0xff7c94b6),
                      // image: DecorationImage(
                      //   image: NetworkImage(
                      //     orders!["productImage"].toString(),
                      //   ),
                      //   fit: BoxFit.cover,
                      // ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(
                        color: AppColors.grey.shade100,
                        width: 3.0,
                      ),
                    ),
                    child: AppNetworkImage(
                      assetPath: 'assets/images/battery.png',
                    ),
                  ),
                  Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 28.0,
                            height: 28.0,
                            decoration: BoxDecoration(
                              color: Color(0xff7c94b6),
                              image: DecorationImage(
                                image: NetworkImage(orders!["clientImage"]),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                              border: Border.all(
                                color: AppColors.grey.shade100,
                                width: 3.0,
                              ),
                            ),
                          ),
                          Gap(2),
                          AppText(
                            title: orders!["client Name"].toString(),
                            fontWeight: FontWeight.w600,
                            size: 12,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                      quantity.isEmpty
                          ? AppText(
                              title: orders!["product"].toString(),
                              size: 10,
                              fontWeight: FontWeight.w600,
                            )
                          : Row(
                              children: [
                                AppText(
                                  title: orders!["product"].toString(),
                                  size: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                                Gap(3),
                                AppText(
                                  title: "(Quantity: ${orders!["quantity"]} )",
                                  fontWeight: FontWeight.w400,
                                  size: 8,
                                ),
                              ],
                            ),
                      Gap(5),
                      AppText(
                        title: "Type: ${orders!["product_type"]}",
                        fontWeight: FontWeight.w400,
                        size: 8,
                      ),
                      Gap(6),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/cars.svg"),
                          Gap(2),
                          AppText(
                            title: orders!["carName"].toString(),
                            size: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Gap(5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            title: "Date: $carWashDate",
                            fontWeight: FontWeight.w400,
                            size: 8,
                          ),
                          Gap(2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: "Time: $carWashTime",
                                fontWeight: FontWeight.w400,
                                size: 8,
                              ),
                              Gap(120),
                              AppText(
                                title: "${orders!['Price']} AED",
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkblue,
                                size: 8,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
