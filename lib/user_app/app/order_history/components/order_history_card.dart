// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
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
    String productDetail = orders!['product_Detail'];
    String productType = orders!['product_type'];
    String carWashDate = orders!['date'];
    String carWashTime = orders!['time'];

    return Wrap(
      children: [
        Container(
          margin: EdgeInsets.only(top: 7, bottom: 7),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          color: AppColors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 95.0,
                height: 98.0,
                decoration: BoxDecoration(
                  color: Color(0xff7c94b6),
                  image: DecorationImage(
                    image: NetworkImage(
                      orders!["productImage"].toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(
                    color: AppColors.grey.shade100,
                    width: 3.0,
                  ),
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
                          borderRadius: BorderRadius.all(Radius.circular(80.0)),
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
                        color: AppColors.darkprimary,
                      ),
                    ],
                  ),
                  AppText(
                    title: orders!["product"].toString(),
                    size: 10,
                    fontWeight: FontWeight.w600,
                  ),
                  Gap(5),
                  productDetail.isNotEmpty
                      ? productType.isNotEmpty
                          ? AppText(
                              title: "Type: ${orders!["product_type"]}",
                              fontWeight: FontWeight.w400,
                              size: 8,
                            )
                          : AppText(
                              title: "Size: ${orders!["product_Detail"]}",
                              fontWeight: FontWeight.w400,
                              size: 8,
                            )
                      : SizedBox.shrink(),
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
                  carWashDate.isNotEmpty
                      ? Column(
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
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              title: "Amount: ${orders!["item"]}",
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
