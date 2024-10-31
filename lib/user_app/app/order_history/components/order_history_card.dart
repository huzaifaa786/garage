import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/models/garage_model.dart';
import 'package:mobilegarage/models/order_models/orders_model.dart';
import 'package:mobilegarage/user_app/app/order_history/components/order_product_card.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class OrderHistoryCard extends StatelessWidget {
  final OrdersModel? order;
  final GarageModel? garage;
  // final String deliveryDate; // New parameter for delivery date
  // final String deliveryTime; 

  OrderHistoryCard({
    super.key,
    required this.order,
    required this.garage,
    // required this.deliveryDate,
    // required this.deliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          text: '(${order!.id})',
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
              ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: order!.orderItems!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final items = order!.orderItems![index];
                    return OrderProductCard(
                      orders: order,
                      items: items,
                      garage: garage,

                      // deliveryDate: deliveryDate,
                      // deliveryTime: deliveryTime,
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
