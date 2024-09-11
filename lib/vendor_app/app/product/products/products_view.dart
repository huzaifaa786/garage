import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/app/product/products/component/product_card.dart';
import 'package:mobilegarage/vendor_app/app/product/products/products_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';

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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      final category = controller.categories[index];
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
                                title: category.name.toString(),
                                size: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            //
                            ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: category.product!.length,
                                itemBuilder: (context, index) {
                                  final product = category.product![index];
                                  return ProductCard(
                                    products: product,
                                    ondeltap: () {
                                      controller.deleteProduct(product.id);
                                      Get.back();
                                      controller.update();
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
