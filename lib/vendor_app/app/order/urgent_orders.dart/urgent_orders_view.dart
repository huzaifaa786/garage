import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/components/orders_card.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/orders_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';

class VUrgentOrdersView extends StatelessWidget {
  const VUrgentOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VOrdersController>(
      autoRemove: false,
      builder: (controller) => AppLayout(
        appBarTitle: 'Urgent Orders',
        hasBgColor: true,
        hasShadow: false,
        child: controller.pendingOrders.isNotEmpty
            ? Column(
                children: [
                  // const FilterView(),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.getItemCount(),
                      itemBuilder: (BuildContext context, int index) {
                        final orders = controller.getOrder(index);
                        return Column(
                          children: [
                            OrdersCard(order: orders),
                            const Gap(20),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              )
            : Center(
                child: AppText(
                  title: 'No Orders Found',
                ),
              ),
      ),
    );
  }
}