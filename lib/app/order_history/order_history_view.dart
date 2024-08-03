// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/order_history/order_history_controller.dart';
import 'package:mobilegarage/components/app_bar/icon_top_bar.dart';

class OrderHistoryView extends StatefulWidget {
  const OrderHistoryView({super.key});

  @override
  State<OrderHistoryView> createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends State<OrderHistoryView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: IconTopBar(
                  showicon: false,
                  title: "Orders history",
                ),
              ),
            ));
  }
}
