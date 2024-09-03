import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/promotion/promotion_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';

class PromotionView extends StatefulWidget {
  const PromotionView({super.key});

  @override
  State<PromotionView> createState() => _PromotionViewState();
}

class _PromotionViewState extends State<PromotionView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromotionController>(
        autoRemove: false,
        builder: (controller) => Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(70.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [appbarShadow],
                  ),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    scrolledUnderElevation: 0.0,
                    toolbarHeight: 95.0,
                    title: const TopBar(
                      showicon: true,
                      showgarageicon: false,
                      title: "Promotion",
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                  child: Container(
                padding: const EdgeInsets.only(left: 46, top: 40),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: 'New Promotion!',
                      size: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkprimary,
                    ),
                    Gap(14),
                    AppText(
                      title: 'Use voucher AED for 30% ',
                      size: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                    Gap(17),
                    AppText(
                      title: 'Use Code H27 for 15% discount for first order! ',
                      size: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                    Gap(17),
                    AppText(
                      title: 'Use voucher AED for 30%',
                      size: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                    Gap(17),
                    AppText(
                      title: 'Use voucher AED for 30% ',
                      size: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                    Gap(32),
                    AppText(
                      title: 'New Promotion!',
                      size: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkprimary,
                    ),
                    Gap(14),
                    AppText(
                      title: 'Use voucher AED for 30% ',
                      size: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                    Gap(17),
                    AppText(
                      title: 'Use Code H27 for 15% discount for first order! ',
                      size: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                    Gap(17),
                    AppText(
                      title: 'Use voucher AED for 30%',
                      size: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                    Gap(17),
                    AppText(
                      title: 'Use voucher AED for 30% ',
                      size: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              )),
            ));
  }
}
