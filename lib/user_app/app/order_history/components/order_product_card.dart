import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
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
  // final String deliveryDate; // New parameter for delivery date
  // final String deliveryTime; // New parameter for delivery time

  OrderProductCard({
    super.key,
    this.orders,
    this.items,
    this.garage,
    // required this.deliveryDate, // Make sure to require these parameters
    // required this.deliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 95.0,
          height: 98.0,
          decoration: BoxDecoration(
            color: Color(0xff7c94b6),
            image: DecorationImage(
              image: NetworkImage(
                items!.products!.images![0].imageUrl.toString(),
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
              color: AppColors.grey.shade100,
              // width: 3.0,
            ),
          ),
          child: garage != null
              ? AppNetworkImage(
                  networkImage: items!.products!.images![0].imageUrl.toString(),
                  fit: BoxFit.contain,
                )
              : Container(),
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
                      image: NetworkImage(
                        garage!.logo.toString(),
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(80.0)),
                    border: Border.all(
                      color: AppColors.grey.shade100,
                      // width: 3.0,
                    ),
                  ),
                ),
                Gap(2),
                AppText(
                  title: garage!.name.toString(),
                  fontWeight: FontWeight.w600,
                  size: 12,
                  color: AppColors.primarybg,
                ),
              ],
            ),
            Row(
              children: [
                AppText(
                  title: items!.productsExtra!.categoryExtra!.name.toString(),
                  size: 10,
                  fontWeight: FontWeight.w600,
                ),
                Gap(3),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ' ( Quantity: ',
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: '${items!.quantity!.toString()} )',
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
                    text:
                        ' ${items!.userVehicles!.vehicle_type!.name.toString()}',
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
                  title: items!.userVehicles!.vehiclebrand!.name.toString() +
                      " " +
                      items!.userVehicles!.vehicle_info!.toString() +
                      " " +
                      items!.userVehicles!.year_of_manufacture!.toString(),
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
                        text:
                            'deliveryDate', // Display the formatted delivery date
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
                            text:
                                'deliveryTime', // Display the formatted delivery time
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
                      // title: orders!.totalAmount.toString() + " AED",
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
    );
  }
}
