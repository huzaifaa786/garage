// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class PaymentCheckoutCard extends StatelessWidget {
  const PaymentCheckoutCard({
    super.key,
    this.orders,
  });
  final Map<String, dynamic>? orders;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(color: AppColors.black.withOpacity(0.1), blurRadius: 4),
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Wrap(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: Get.width * 0.25,
                  height: Get.height * 0.12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AppNetworkImage(
                      assetPath: 'assets/images/battery.png',
                      // fit: BoxFit.cover,
                    ),
                    // child: CachedNetworkImage(
                    //   imageUrl: orders!["productImage"].toString(),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * 0.67,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: Get.width * 0.5),
                          child: AppText(
                            title: orders!["product"].toString(),
                            size: 12,
                            maxLines: 1,
                            overFlow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        AppText(
                          title: 'Quantity :' '2',
                          size: 10,
                          maxLines: 1,
                          overFlow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Gap(5),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: Get.width * 0.52),
                      child: AppText(
                        title: "Type: ${orders!["product_type"]}",
                        fontWeight: FontWeight.w500,
                        size: 9,
                        maxLines: 1,
                      ),
                    ),
                    Gap(6),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/cars.svg"),
                        Gap(4),
                        AppText(
                          title: orders!["carName"].toString(),
                          size: 9,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkprimary,
                        ),
                      ],
                    ),
                    Gap(5),
                    AppText(
                      title: "Date: ${orders!['date']}",
                      fontWeight: FontWeight.w500,
                      size: 9,
                    ),
                    Gap(2),
                    AppText(
                      title: "Time: ${orders!['time']}",
                      fontWeight: FontWeight.w500,
                      size: 9,
                    ),
                    Gap(5),
                    AppText(
                      title: "${orders!['Price']} AED",
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkblue,
                      size: 12,
                    ),
                    Gap(7)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
