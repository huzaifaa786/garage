// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/models/product_model.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/app/product/products/component/product_card.dart';
import 'package:mobilegarage/vendor_app/app/product/products/products_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';

class VProductsView extends StatefulWidget {
  VProductsView({super.key, this.product});
  ProductModel? product;

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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.categoriess.length,
                    itemBuilder: (context, index) {
                      var categoryies = controller.categoriess[index];
                      // var product = controller.products[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: AppText(
                                title: categoryies.name.toString(),
                                size: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            //
                            ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: categoryies.product!.length,
                                itemBuilder: (context, index) {
                                  final product = categoryies.product![index];
                                  return ProductCard(
                                    product: product,
                                    ondeltap: () {
                                      controller.deleteProduct(product.id);
                                      Get.back();
                                      controller.update();
                                    },
                                    oneditTap: () {
                                      Get.toNamed(
                                        AppRoutes.edit_product,
                                        arguments: product,
                                      );
                                    },
                                  );
                                }),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            )));
  }
}
