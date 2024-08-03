// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class ServiceCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  final String price;

  const ServiceCard({
    required this.image,
    required this.title,
    required this.onTap,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.28,
      height: Get.height * 0.2,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                // height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    height: 80,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                      width: 2,
                      color: AppColors.lightprimary,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: CachedNetworkImage(
                      imageUrl: 'https://dummyimage.com/70x70/d9c3d9/00000a',
                      fit: BoxFit.cover,
                      height: 26,
                      width: 26,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              top: 8.0,
              bottom: 10.0,
            ),
            child: SizedBox(
              width: Get.width * 0.18,
              child: AppText(
                title: title,
                fontWeight: FontWeight.w600,
                size: 10.0,
                maxLines: 2,
                overFlow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                      child: AppText(
                        title: price,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        size: 12.0,
                        maxLines: 1,
                        overFlow: TextOverflow.visible,
                      ),
                    ),
                    AppText(
                      title: 'AED',
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      size: 12.0,
                    ),
                  ],
                ),
                IconButton(
                  icon: Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        'assets/icons/cart_ic.svg',
                      ),
                    ),
                  ),
                  onPressed: onTap,
                )
              ],
            ),
          ),
        ],
      ),
    );

    //   SizedBox(
    //     width: 100,
    //     child: Column(
    //       children: [
    //         Stack(
    //           children: [
    //             Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.vertical(
    //                   top: Radius.circular(12),
    //                 ),
    //               ),
    //               child: ClipRRect(
    //                 borderRadius:
    //                     BorderRadius.vertical(top: Radius.circular(12)),
    //                 child: CachedNetworkImage(
    //                   imageUrl: image,
    //                   height: 80,
    //                   width: double.infinity,
    //                   fit: BoxFit.cover,
    //                   placeholder: (context, url) =>
    //                       CircularProgressIndicator(),
    //                   errorWidget: (context, url, error) => Icon(Icons.error),
    //                 ),
    //               ),
    //             ),
    //             Positioned(
    //               top: 8,
    //               left: 8,
    //               child: Container(
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(60),
    //                   border: Border.all(
    //                     width: 2,
    //                     color: AppColors.lightprimary,
    //                   ),
    //                 ),
    //                 child: ClipRRect(
    //                   borderRadius: BorderRadius.circular(60),
    //                   child: CachedNetworkImage(
    //                     imageUrl: 'https://dummyimage.com/70x70/d9c3d9/00000a',
    //                     fit: BoxFit.cover,
    //                     height: 26,
    //                     width: 26,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(
    //             left: 8.0,
    //             right: 8.0,
    //             top: 8.0,
    //             bottom: 10.0,
    //           ),
    //           child: SizedBox(
    //             width: Get.width * 0.18,
    //             child: AppText(
    //               title: title,
    //               fontWeight: FontWeight.w600,
    //               size: 10.0,
    //               maxLines: 2,
    //               overFlow: TextOverflow.ellipsis,
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //           child: Row(
    //             children: [
    //               Row(
    //                 children: [
    //                   SizedBox(
    //                     width: 20,
    //                     child: AppText(
    //                       title: price,
    //                       color: Colors.blue,
    //                       fontWeight: FontWeight.w600,
    //                       size: 12.0,
    //                       maxLines: 1,
    //                       overFlow: TextOverflow.ellipsis,
    //                     ),
    //                   ),
    //                   AppText(
    //                     title: ' AED',
    //                     color: Colors.blue,
    //                     fontWeight: FontWeight.w600,
    //                     size: 12.0,
    //                   ),
    //                 ],
    //               ),
    //               IconButton(
    //                 icon: Container(
    //                   height: 20,
    //                   width: 20,
    //                   decoration: BoxDecoration(
    //                     color: AppColors.primary,
    //                     borderRadius: BorderRadius.circular(30),
    //                   ),
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(4.0),
    //                     child: SvgPicture.asset(
    //                       'assets/icons/cart_ic.svg',
    //                       height: 14,
    //                       width: 14,
    //                     ),
    //                   ),
    //                 ),
    //                 onPressed: onTap,
    //               )
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }
  }
}
