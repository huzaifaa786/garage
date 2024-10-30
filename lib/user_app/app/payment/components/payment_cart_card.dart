// // ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:input_quantity/input_quantity.dart';
// import 'package:mobilegarage/models/cart_model.dart/cart_model.dart';
// import 'package:mobilegarage/user_app/app/payment/payment_controller.dart';
// import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
// import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
// import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

// class PaymentCartCard extends StatelessWidget {
//   PaymentCartCard({
//     super.key,
//     this.item,
//     this.ontap,
//   });
//   CartItemModel? item;
//   final ontap;
//   // final ontap;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<PaymentsController>(
//         builder: (controller) => Container(
//             decoration: BoxDecoration(
//                 color: AppColors.white,
//                 boxShadow: [
//                   BoxShadow(
//                       color: AppColors.black.withOpacity(0.4), blurRadius: 4),
//                 ],
//                 borderRadius: BorderRadius.circular(8)),
//             child: Wrap(children: [
//               Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: SizedBox(
//                     width: Get.width * 0.25,
//                     height: Get.height * 0.12,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: AppNetworkImage(
//                         networkImage:
//                             item!.cartProduct!.images![0].imageUrl.toString(),
//                         assetPath: 'assets/images/battery.png',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Gap(8),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Flexible(
//                             child: AppText(
//                               title: item!.fuelextra!.name.toString(),
//                               size: 12,
//                               maxLines: 1,
//                               overFlow: TextOverflow.ellipsis,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           Flexible(
//                             child: InkWell(
//                                 onTap: ontap,
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 12.0),
//                                   child: SvgPicture.asset(
//                                       'assets/icons/cross.svg'),
//                                 )),
//                           ),
//                         ],
//                       ),
//                       Gap(7),
//                       AppText(
//                         title:
//                             "Type: ${controller.cart!.vehicle!.vehicle_type!.name.toString()}",
//                         fontWeight: FontWeight.w500,
//                         size: 9,
//                         maxLines: 1,
//                       ),
//                       Gap(7),
//                       Row(
//                         children: [
//                           SvgPicture.asset("assets/icons/cars.svg"),
//                           Gap(4),
//                           Flexible(
//                             child: AppText(
//                               title: controller.cart!.vehicle!.vehicle_info
//                                       .toString() +
//                                   ' ' +
//                                   controller.cart!.vehicle!.year_of_manufacture
//                                       .toString(),
//                               size: 9,
//                               fontWeight: FontWeight.w500,
//                               color: AppColors.darkprimary,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Gap(5),
//                       // AppText(
//                       //   title: "Date: carWashDate",
//                       //   fontWeight: FontWeight.w500,
//                       //   size: 9,
//                       // ),
//                       // Gap(2),
//                       // AppText(
//                       //   title: "Time: carWashTime",
//                       //   fontWeight: FontWeight.w500,
//                       //   size: 9,
//                       // ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Flexible(
//                             child: AppText(
//                               title:
//                                   "${item!.fuelextra!.price.toString()} AED",
//                               fontWeight: FontWeight.w500,
//                               color: AppColors.darkblue,
//                               maxLines: 1,
//                               size: 12,
//                             ),
//                           ),
//                           Flexible(
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.only(right: 5, bottom: 5),
//                               child: InputQty(
//                                 initVal: controller.cart!.totalQuantity ?? 0,
//                                 minVal: 1,
//                                 qtyFormProps: QtyFormProps(enableTyping: false),
//                                 decoration: QtyDecorationProps(
//                                   minusBtn: Container(
//                                     height: 20,
//                                     width: 20,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       border:
//                                           Border.all(color: AppColors.primary),
//                                     ),
//                                     child: Icon(
//                                       Icons.remove,
//                                       color: AppColors.primary,
//                                       size: 12,
//                                     ),
//                                   ),
//                                   isBordered: false,
//                                   width: 8,
//                                   borderShape: BorderShapeBtn.circle,
//                                   plusBtn: Container(
//                                     height: 20,
//                                     width: 20,
//                                     decoration: BoxDecoration(
//                                       color: AppColors.primary,
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Icon(
//                                       Icons.add,
//                                       color: AppColors.white,
//                                       size: 12,
//                                     ),
//                                   ),
//                                 ),
//                                 onQtyChanged: (val) {
//                                   int updatedQuantity = val.toInt();
//                                   controller.updateCartItems(
//                                     item!.id.toString(),
//                                     updatedQuantity,
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 )
//               ])
//             ])));
//   }
// }
// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:mobilegarage/app/cart/cart_controller.dart';
import 'package:mobilegarage/models/cart_model.dart/cart_model.dart';
import 'package:mobilegarage/user_app/app/payment/payment_controller.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class PaymentCartCard extends StatelessWidget {
  PaymentCartCard({
    super.key,
    this.item,
    this.ontap,
  });
  CartItemModel? item;
  final ontap;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentsController>(
        builder: (controller) => Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.black.withOpacity(0.4), blurRadius: 4),
                  ],
                  borderRadius: BorderRadius.circular(8)),
              child: Wrap(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: Get.width * 0.25,
                          height: Get.height * 0.12,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: AppNetworkImage(
                              networkImage: item!
                                  .cartProduct!.images![0].imageUrl
                                  .toString(),
                              assetPath: 'assets/images/battery.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.525,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: AppText(
                                    // title: item!.acextra![0].name.toString(),
                                    title: item!.fuelextra == null
                                        ? item!.brand!.name.toString()
                                        : item!.cartProduct!.categoryId == '2'
                                            ? item!.brand!.name.toString()
                                            : item!.fuelextra!.name.toString(),
                                    size: 12,
                                    maxLines: 1,
                                    overFlow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                InkWell(
                                    onTap: ontap,
                                    child: SvgPicture.asset(
                                      'assets/icons/cross.svg',
                                      height: 15,
                                      width: 15,
                                    )),
                              ],
                            ),
                            Gap(5),
                            AppText(
                              title:
                                  "Type: ${controller.cart!.vehicle!.vehicle_type!.name.toString()}",
                              fontWeight: FontWeight.w500,
                              size: 9,
                              maxLines: 1,
                            ),
                            Gap(9),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/icons/cars.svg"),
                                Gap(4),
                                Flexible(
                                  child: AppText(
                                    title: controller
                                            .cart!.vehicle!.vehicle_info
                                            .toString() +
                                        '  ' +
                                        controller
                                            .cart!.vehicle!.year_of_manufacture
                                            .toString(),
                                    size: 9,
                                    textAlign: TextAlign.justify,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.darkprimary,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            Gap(5),
                            // AppText(
                            //   title: "Date: carWashDate",
                            //   fontWeight: FontWeight.w500,
                            //   size: 9,
                            // ),
                            // Gap(2),
                            // AppText(
                            //   title: "Time: carWashTime",
                            //   fontWeight: FontWeight.w500,
                            //   size: 9,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: AppText(
                                    title: item!.fuelextra != null
                                        ? "${item!.fuelextra!.price.toString()} AED"
                                        : "${item!.price.toString()} AED",
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.darkblue,
                                    size: 12,
                                    maxLines: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 5, bottom: 5),
                                  child: InputQty(
                                    initVal: item!.quantity ?? 0,
                                    minVal: 1,
                                    qtyFormProps:
                                        QtyFormProps(enableTyping: false),
                                    decoration: QtyDecorationProps(
                                      minusBtn: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColors.primary)),
                                        child: Icon(
                                          Icons.remove,
                                          color: AppColors.primary,
                                          size: 12,
                                        ),
                                      ),
                                      isBordered: false,
                                      width: 6,
                                      borderShape: BorderShapeBtn.circle,
                                      plusBtn: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: AppColors.white,
                                          size: 12,
                                        ),
                                      ),
                                    ),
                                    onQtyChanged: (val) {
                                      int updatedQuantity = val.toInt();
                                      controller.updateCartItems(
                                        item!.id.toString(),
                                        updatedQuantity,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
