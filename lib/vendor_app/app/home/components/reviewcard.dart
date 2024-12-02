// ignore_for_file: avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/models/garage_reviews_model.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/home/home_controller.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:shimmer/shimmer.dart';

class Reviewcard extends StatelessWidget {
  Reviewcard({
    super.key,
    required this.reviews,
    this.img,
  });
  GarageReviewsModel reviews;
  final img;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VHomeController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Container(
          decoration: BoxDecoration(color: AppColors.white_color),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 7,
                            width: 7,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightblue,
                            ),
                          ),
                          const Gap(6),
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child:  ClipRRect(
                                    borderRadius: BorderRadius.circular(38),
                                    child: reviews.user!.image == null ||
                                    reviews.user!.image!.isEmpty
                                ?SvgPicture.asset(
                                      img,
                                      color: AppColors.primary,
                                    ) : CachedNetworkImage(
                                    imageUrl: reviews.user!.image.toString(),
                                  
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                  ),)
                               
                          ),
                          const Gap(8),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  title: reviews.user!.name.toString(),
                                  fontWeight: FontWeight.w600,
                                  size: 12,
                                ),
                                const Gap(10),
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: double.parse(
                                          reviews.rating!.toString()),
                                      itemCount: 5,
                                      itemSize: 14,
                                      unratedColor: AppColors.grey,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    const Gap(10),
                                    AppText(
                                      title: double.parse(
                                              reviews.rating.toString())
                                          .toString(),
                                      size: 8.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                if (reviews.comment != null)
                                  AppText(
                                    maxLines: 2,
                                    title: reviews.comment.toString(),
                                  )
                              ],
                            ),
                          ),
                          AppText(
                            title: controller
                                .timeAgo(reviews.createdAt!.toIso8601String()),
                            color: Colors.grey,
                            size: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                const Divider(
                  color: Color.fromARGB(255, 209, 208, 208),
                  thickness: 1.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
