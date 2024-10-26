import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobilegarage/models/order_models/order_items_model.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class ItemsCard extends StatelessWidget {
  ItemsCard({super.key, required this.item});
  OrderItemsModel item;

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
              // border: Border.all()
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AppNetworkImage(
                networkImage: item.products!.images![0].imageUrl.toString(),
                fit: BoxFit.cover,
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
                title: item.productsExtra == null
                    ? item.products!.brands!.name.toString()
                    : item.products!.categoryId == '2'
                        ? item.products!.brands!.name.toString()
                        : item.productsExtra!.categoryExtra!.name.toString(),
                size: 11,
                fontWeight: FontWeight.w500,
              ),

              Gap(4),
              // Row(
              //   children: [
              //     AppText(
              //       title: 'Type : ',
              //       size: 11,
              //       fontWeight: FontWeight.w400,
              //     ),
              //     AppText(
              //       title: " ${item.price.toString()}",
              //       size: 10,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ],
              // ),
              Row(
                children: [
                  AppText(
                    title: 'Quantity : ',
                    size: 11,
                    fontWeight: FontWeight.w400,
                  ),
                  AppText(
                    title: ' ${item.quantity.toString()}',
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
                title: "Total : ${item.price.toString()}",
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
