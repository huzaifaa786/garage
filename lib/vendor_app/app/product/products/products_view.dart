import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/product/products/component/product_card.dart';
import 'package:mobilegarage/vendor_app/app/product/products/products_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class VProductsView extends StatefulWidget {
  const VProductsView({super.key});

  @override
  State<VProductsView> createState() => _VProductsViewState();
}

class _VProductsViewState extends State<VProductsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VProductsController>(
        autoRemove: false,
        builder: (controller) => AppLayout(
              appBarTitle: 'Edit products & services',
              hasBgColor: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    Gap(13),
                    Row(
                      children: [
                        Image.asset('assets/images/waashcar.png'),
                        AppText(
                          title: '   Car wash',
                          size: 15,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                    ProductCard(
                      price: '400',
                    )
                  ],
                ),
              ),
            ));
  }
}
