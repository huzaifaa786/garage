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
        child: SingleChildScrollView(
          child: Column(
            children: [
              FilterView(),
              if (controller.selectedIndex == 0) ...[Gap(12), SubFilterView()],
              OrderCard(name: 'ali',number: '3435435435352',),
            ],
          ),
        ),
      ),
    );
  }
}
