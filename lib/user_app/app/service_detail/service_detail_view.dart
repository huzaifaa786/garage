import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/home/components/service_cards.dart';
import 'package:mobilegarage/user_app/app/service_detail/service_detail_controller.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class ServiceDetailView extends StatelessWidget {
  const ServiceDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceDetailController>(
        autoRemove: false,
        builder: (controller) => AppLayout(
            appBarTitle: 'Service Detail',
            hasBgColor: false,
            hasShadow: true,
            child: SingleChildScrollView(
                child: controller.garage != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: AppText(
                                title: 'Results',
                                fontWeight: FontWeight.w500,
                                size: 15,
                              ),
                            ),
                            Gap(10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: GridView.builder(
                                  itemCount:
                                      controller.garage!.products!.length,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 14,
                                          childAspectRatio: 0.89),
                                  itemBuilder: (context, index) {
                                    var product =
                                        controller.garage!.products![index];
                                    var productextra =
                                        product.fuelextra != null ? product.fuelextra![0].id : '';
                                    return ServiceCard(
                                      logo: controller.garage!.logo.toString(),
                                      image: product.images![0].imageUrl
                                          .toString(),
                                      time: product.brands == null
                                          ? product.fuelextra![0].time
                                              .toString()
                                          : '',
                                      price: product.brands == null
                                          ? product.fuelextra![0].price
                                              .toString()
                                          : product.price.toString(),
                                      title: product.brands == null
                                          ? product.fuelextra![0].name
                                              .toString()
                                          : product.brands!.name.toString(),
                                    
                                      onTap: () {
                                        UiUtilites.showConfirmationDialog(
                                          false,
                                          'Are you Sure that you want\n to Add this product to cart ?',
                                          onConfirm: () async {
                                            controller.addToCart(
                                                product.id.toString(),
                                                productextra);
                                          },
                                        );
                                      },
                                    );
                                  }),
                            ),
                          ])
                    : Text(''))));
  }
}
