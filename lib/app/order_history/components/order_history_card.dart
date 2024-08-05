// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({
    super.key,
    this.orders,
  });
  final orders;

  @override
  Widget build(BuildContext context) {
    String product = orders['product'];
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
                      orders["productImage"],
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
              // CachedNetworkImage(
              //   // imageUrl: "https://dummyimage.com/93x93/000/fff",
              //   imageUrl: orders["productImage"],
              // ),
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
                            image: NetworkImage(orders["clientImage"]),
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
                        title: orders["client Name"],
                        fontWeight: FontWeight.w600,
                        size: 12,
                        color: AppColors.darkprimary,
                      ),
                    ],
                  ),
                  AppText(
                    title: orders["product"],
                    size: 10,
                    fontWeight: FontWeight.w600,
                  ),
                  Gap(5),
                  product != "Car battery oil"
                      ? product == "Car washing"
                          ? AppText(
                              title: "type: ${orders["product_Detail"]}"
                                  .toString(),
                              fontWeight: FontWeight.w400,
                              size: 8,
                            )
                          : AppText(
                              title: " Size: ${orders["product_Detail"]}"
                                  .toString(),
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
                        title: orders["carName"],
                        size: 8,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Gap(5),
                  product == "Car washing"
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              title: "Date: ${orders['date'].toString()}",
                              fontWeight: FontWeight.w400,
                              size: 8,
                            ),
                            Gap(2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  title: "Time: ${orders['time'].toString()}",
                                  fontWeight: FontWeight.w400,
                                  size: 8,
                                ),
                                Gap(120),
                                AppText(
                                  title: "${orders['Price'].toString()} AED",
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
                              title: "Amount: ${orders["item"]} ".toString(),
                              fontWeight: FontWeight.w400,
                              size: 8,
                            ),
                            Gap(120),
                            AppText(
                              title: "${orders['Price'].toString()} AED",
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
