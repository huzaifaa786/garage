import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/user_app/app/promotion/promotion_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';

class PromotionView extends StatefulWidget {
  const PromotionView({super.key});

  @override
  State<PromotionView> createState() => _PromotionViewState();
}

class _PromotionViewState extends State<PromotionView> {
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();

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
              title: TopBar(
                showicon: true,
                showgarageicon: false,
                title: "Promotion".tr,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 46, top: 40,right: 45),
            child: controller.getPromotions.isEmpty
                ? Center(
                    child: AppText(
                      title: 'No promotions available'.tr,
                      size: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkprimary,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: controller.getPromotions[0]['title'],
                        size: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkprimary,
                      ),
                      const Gap(14),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.getPromotions.length,
                        itemBuilder: (context, index) {
                          var promotions = controller.getPromotions[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title:
                                
                                box.read('locale') == 'ar'? promotions['ar_promotions']:promotions['promotions'],
                                size: 10,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                              const Gap(17),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
