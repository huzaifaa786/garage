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
        Gap(20),
        Container(
          margin: EdgeInsets.only(top: 4, bottom: 4),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          color: AppColors.white,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: Get.height * 0.1 / 13,
                    width: Get.width * 0.1 / 13,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.darkprimary,
                    ),
                  ),
                  Gap(5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tracking Number  ',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.primarybg,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: '(${orders!['TrackingNumber']})',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.primarybg,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
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
                            color: AppColors.primarybg,
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
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: ' (Quantity: ',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '${orders!["quantity"]})',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                      Gap(5),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Type: ',
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' ${orders!["product_type"]}',
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(2),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/cars.svg"),
                          Gap(2),
                          AppText(
                            title: orders!["carName"].toString(),
                            size: 10,
                            color: AppColors.primarybg,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Gap(5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Date: ',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ' $carWashDate',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Time: ',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '$carWashTime am',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Gap(120),
                              AppText(
                                title: "${orders!['Price']} AED",
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkblue,
                                size: 10,
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
