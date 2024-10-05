// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class SellerCard extends StatelessWidget {
  const SellerCard({
    super.key,
    required this.garageName,
    this.image,
    required this.ontap,
  });

  final String garageName;
  final image;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.only(left: 11, right: 24),
        height: Get.height * 0.09,
        width: Get.width * 0.8,
        decoration: BoxDecoration(
          color: AppColors.lightgrey,
          border: Border.all(color: AppColors.grey.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: AppNetworkImage(
                    assetPath: 'assets/images/street_garage.png',
                    // imageUrl: image,
                    height: 50,
                    width: 50,
                    // fit: BoxFit.scaleDown,
                    // placeholder: (context, url) => CircularProgressIndicator(),
                    // errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      garageName,
                      style: TextStyle(
                          fontSize: 14,
                          //fontWeight: FontWeight.bold,
                          fontWeight: FontWeight.w500),
                    ),
                    Gap(2),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: 3.5,
                          itemCount: 5,
                          itemSize: 13,
                          unratedColor: AppColors.grey.withOpacity(0.6),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: AppColors.orange,
                          ),
                        ),
                        Gap(2),
                        Text(
                          '2.5',
                          style: TextStyle(
                              fontSize: 10,
                              //fontWeight: FontWeight.bold,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              // onTap: () {
              //   Get.toNamed(
              //     AppRoutes.editprofile,
              //     arguments: {
              //       'image': 'https://dummyimage.com/70x70/000/0011ff',
              //       'userName': 'User38498990',
              //       'userNumber': '+971 0000 0000',
              //        'userEmail' : 'ahmed34@gmail.com'
              //     },
              //   );
              // },
              child: SvgPicture.asset(
                height: 20,
                width: 20,
                'assets/icons/arrow_right.svg',
                color: AppColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
