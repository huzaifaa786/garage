import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobilegarage/models/order_models/orders_model.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class ItemsCard extends StatelessWidget {
  ItemsCard({super.key, required this.item});
  OrdersModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AppNetworkImage(
                networkImage: item.orderItems![0].products!.images![0].toString(),
              ),
              // child: CachedNetworkImage(
              //   imageUrl: controller.image?.isEmpty ?? true
              //       ? img
              //       : controller.image.toString(),
              //   placeholder: (context, url) =>
              //       CircularProgressIndicator(),
              //   errorWidget: (context, url, error) =>
              //       Icon(Icons.error),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title: item.orderItems![0].products!.id.toString(),
                size: 11,
                fontWeight: FontWeight.w500,
              ),

              Gap(4),
              Row(
                children: [
                  AppText(
                    title: 'Type:',
                    size: 11,
                    fontWeight: FontWeight.w400,
                  ),
                  AppText(
                    title: " ${item.orderItems![0].price}",
                    size: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Row(
                children: [
                  AppText(
                    title: 'Quantity:',
                    size: 11,
                    fontWeight: FontWeight.w400,
                  ),
                  AppText(
                    title: ' ${item.orderItems![0].quantity}',
                    size: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              // Gap(3),
              // Row(
              //   children: [
              //     AppText(
              //       title: 'Time :',
              //       size: 10,
              //       fontWeight: FontWeight.w400,
              //     ),
              //     AppText(
              //       title: '4: 34',
              //       size: 9,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ],
              // ),
              Gap(4),
              AppText(
                title: "Total ${item.orderItems![0].price}",
                size: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.lightblue,
              )
            ],
          )
        ],
      ),
    );
  }
}
