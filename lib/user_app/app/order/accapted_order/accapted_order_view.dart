// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/order/accapted_order/accapted_order_controller.dart';
import 'package:mobilegarage/user_app/app/order/accapted_order/component/order_card.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';

class AccaptedOrderView extends StatefulWidget {
  const AccaptedOrderView({super.key});

  @override
  State<AccaptedOrderView> createState() => _AccaptedOrderViewState();
}

class _AccaptedOrderViewState extends State<AccaptedOrderView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccaptedOrderController>(
        autoRemove: false,
        builder: (controller) => AppLayout(
              appBarTitle: 'Accepted  Orders',
              hasBgColor: false,
              hasShadow: true,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        OrderCard(),
                      ],
                    ),
                    Column(
                      children: [],
                    )
                  ],
                ),
              ),
            ));
  }
}
