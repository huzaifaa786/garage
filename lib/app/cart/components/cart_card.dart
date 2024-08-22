// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    this.orders,
  });
  final Map<String, dynamic>? orders;

  @override
  Widget build(BuildContext context) {
    String carWashDate = orders!['date'];
    String carWashTime = orders!['time'];

    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(color: AppColors.black.withOpacity(0.2), blurRadius: 4),
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
                    child: CachedNetworkImage(
                      imageUrl: orders!["productImage"].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * 0.525,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(8),
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
                        SvgPicture.asset('assets/icons/cross.svg'),
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
                      title: "Date: $carWashDate",
                      fontWeight: FontWeight.w500,
                      size: 9,
                    ),
                    Gap(2),
                    AppText(
                      title: "Time: $carWashTime",
                      fontWeight: FontWeight.w500,
                      size: 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          title: "${orders!['Price']} AED",
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkblue,
                          size: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, bottom: 5),
                          child: InputQty(
                            initVal: 1,
                            minVal: 1,
                            decoration: QtyDecorationProps(
                              minusBtn: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: AppColors.primary)),
                                child: Icon(
                                  Icons.remove,
                                  color: AppColors.primary,
                                  size: 12,
                                ),
                              ),
                              isBordered: false,
                              width: 6,
                              borderShape: BorderShapeBtn.circle,
                              plusBtn: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.white,
                                  size: 12,
                                ),
                              ),
                            ),
                            onQtyChanged: (val) {
                              print('sdfds');
                            },
                          ),
                        ),
                      ],
                    ),
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
