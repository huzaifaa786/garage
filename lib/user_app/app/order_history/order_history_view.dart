import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/models/garage_model.dart';
import 'package:mobilegarage/user_app/app/order_history/components/order_history_card.dart';
import 'package:mobilegarage/user_app/app/order_history/order_history_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';

class OrderHistoryView extends StatefulWidget {
  OrderHistoryView({
    super.key,
    this.garage,
  });
  GarageModel? garage;

  @override
  State<OrderHistoryView> createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends State<OrderHistoryView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColors.grey.shade200,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(70.0),
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
                        title: "Orders history".tr,
                      ),
                    ),
                  )),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(5),
                    controller.orders!.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.orders!.length,
                            itemBuilder: (BuildContext context, int index) {
                              final orders = controller.orders![index];
                              return OrderHistoryCard(
                                order: orders,
                                garage: orders.garage,
                              );
                            })
                        : SizedBox(
                          height: Get.height*0.7,
                          child: Center(
                              child: AppText(
                                title: 'No order Found!'.tr,
                                color: AppColors.darkGrey,
                              ),
                            ),
                        ),
                  ],
                ),
              ),
            ));
  }
}
