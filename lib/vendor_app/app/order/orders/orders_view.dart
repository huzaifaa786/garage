import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/components/filter_view.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/components/order_card.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/components/sub_filter.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/orders_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';

class VOrdersView extends StatelessWidget {
  const VOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VOrdersController>(
      autoRemove: false,
      builder: (controller) => AppLayout(
        appBarTitle: 'Orders',
        hasBgColor: true,
        hasShadow: false,
        child: Column(
          children: [
            const FilterView(),
            if (controller.selectedIndex == 0) ...[
              // const Gap(12),
              // const SubFilterView(),
            ],
            // Orders List
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.selectedIndex == 0
                    ? controller.pendingOrders.length
                    : controller.selectedIndex == 1
                        ? controller.onTheWayOrders.length
                        : controller.selectedIndex == 2
                            ? controller.deliveredOrders.length
                            : controller.rejectedOrders.length,
                itemBuilder: (BuildContext context, int index) {
                  final orders = controller.selectedIndex == 0
                      ? controller.pendingOrders[index]
                      : controller.selectedIndex == 1
                          ? controller.onTheWayOrders[index]
                          : controller.selectedIndex == 2
                              ? controller.deliveredOrders[index]
                              : controller.rejectedOrders[index];
                  return Column(
                    children: [
                      OrderCard(orders: orders),
                      const Gap(20),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
