// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class ServiceTypeCard extends StatelessWidget {
  const ServiceTypeCard({super.key, this.name, this.price, this.onRemoveTap});
  final String? name;
  final String? price;
  final onRemoveTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 4, top: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.input_bg_color,
        borderRadius: BorderRadius.circular(5),
        // boxShadow: cartCardShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: AppText(
              title: '$name',
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              AppText(title: '$price ${'AED'.tr}', fontWeight: FontWeight.w600),
              const Gap(8),
              InkWell(
                onTap: onRemoveTap,
                child: Icon(
                  Icons.cancel_outlined,
                  color: AppColors.primary_color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
