import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/components/filter_view.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/components/orders_card.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/orders_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';

class VOrdersView extends StatelessWidget {
  const VOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VOrdersController>(
      autoRemove: false,
      builder: (controller) => AppLayout(
        appBarTitle: 'Orders'.tr,
        hasBgColor: true,
        hasShadow: false,
        child: 

             Column(
                children: [
                   FilterView(),
                  // controller.pendingOrders.isNotEmpty ||
                  //         controller.acceptedOrders.isNotEmpty ||
                  //         controller.onTheWayOrders.isNotEmpty ||
                  //         controller.deliveredOrders.isNotEmpty
              controller.getItemCount() > 0

                      ? Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.getItemCount(),
                            itemBuilder: (BuildContext context, int index) {
                              final orders = controller.getOrder(index);
                              return Column(
                                children: [
                                  OrdersCard(
                                    order: orders,
                                    ontapReject: () {
                                      controller.rejectedOrder(
                                          orders.id.toString(),
                                          orders.paymentIntent.toString());
                                    },
                                    ontapAccept: () {
                                      controller
                                          .acceptOrder(orders.id.toString());
                                    },
                                    ontapOnway: () {
                                      controller
                                          .ontheWayOrder(orders.id.toString());
                                    },
                                    ontapDelivered: () {
                                      controller
                                          .deliveredOrder(orders.id.toString());
                                    },
                                  ),
                                  Gap(20),
                                ],
                              );
                            },
                          ),
                        )
                      : SizedBox(
                        height: Get.height*0.7,
                        child: Center(
                            child: AppText(
                              title: 'No Orders Found'.tr,
                            ),
                          ),
                      ),
                ],
              )
          
      ),
    );
  }
}
