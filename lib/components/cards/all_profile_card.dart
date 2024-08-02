import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class AllProfileCard extends StatelessWidget {
  const AllProfileCard({
    super.key,
    required this.text,
    required this.image,
    required this.ontap,
   required this.text2,
  });
  final String text;
  final String image;
  final String text2;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11),
        height: Get.height * 0.08,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(40),
          //Image.asset('assets/images/location.png'),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                ),
                Gap(10),
                Text(
                  text,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Gap(5),
                Text(
                  text2,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400,color: AppColors.grey,),
                ),
              ],
            ),
            Image.asset('assets/images/errow_back.png'),
          ],
        ),
      ),
    );
  }
}
