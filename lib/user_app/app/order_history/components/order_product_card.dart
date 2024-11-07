import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/models/garage_model.dart';
import 'package:mobilegarage/models/order_models/order_items_model.dart';
import 'package:mobilegarage/models/order_models/orders_model.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class OrderProductCard extends StatelessWidget {
  final OrdersModel? orders;
  final OrderItemsModel? items;
  final GarageModel? garage;

  OrderProductCard({
    super.key,
    this.orders,
    this.items,
    this.garage,
  });

  @override
  Widget build(BuildContext context) {
    final deliveryParts = orders?.deliveryTime?.split(' ');
    final deliveryDate = deliveryParts != null && deliveryParts.isNotEmpty
        ? deliveryParts.first
        : '';
    final deliveryTime = deliveryParts != null && deliveryParts.length > 1
        ? deliveryParts.sublist(1).join(' ')
        : '';
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 95.0,
              height: 98.0,
              decoration: BoxDecoration(
                color: Color(0xff7c94b6),
                image: DecorationImage(
                  image:
                      NetworkImage(items?.products?.images?[0].imageUrl ?? ''),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(
                  color: AppColors.grey.shade100,
                ),
              ),
              child: garage != null
                  ? AppNetworkImage(
                      networkImage: items?.products?.images?[0].imageUrl ?? '',
                      fit: BoxFit.contain,
                    )
                  : Container(),
            ),
            Gap(10),
            Flexible(
              child: Column(
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
                            image: NetworkImage(garage?.logo ?? ''),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(80.0)),
                          border: Border.all(
                            color: AppColors.grey.shade100,
                          ),
                        ),
                      ),
                      Gap(2),
                      AppText(
                        title: garage?.name ?? '',
                        fontWeight: FontWeight.w600,
                        size: 12,
                        color: AppColors.primarybg,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      AppText(
                        title:
                            // items?.productsExtra?.categoryExtra?.name == ''
                            //     ? items?.productsExtra?.categoryExtra?.name ?? ''
                            //     :
                            items?.productsExtra?.categoryExtra?.name ?? '',
                        size: 10,
                        fontWeight: FontWeight.w600,
                      ),
                      Gap(3),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                          text: ' ( Quantity: '.tr,
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '${items?.quantity ?? ''} )',
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
                      text: 'Type: '.tr,
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                          text:
                              ' ${items?.userVehicles?.vehicle_type?.name ?? ''}',
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
                        title:
                            '${items?.userVehicles?.vehiclebrand?.name ?? ''} ${items?.userVehicles?.vehicle_info ?? ''} ${items?.userVehicles?.year_of_manufacture ?? ''}',
                        size: 10,
                        color: AppColors.primarybg,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Gap(5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                          text: 'Date: '.tr,
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: deliveryDate,
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
                    children: [
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Time: '.tr,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: deliveryTime,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: AppText(
                              title:
                                  '${orders?.totalAmount ?? ''} ${"AED".tr}',
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkblue,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        
      ],
    );
  }
}
