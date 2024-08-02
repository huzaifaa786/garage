import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class EmailProfileCard extends StatelessWidget {
  const EmailProfileCard({
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
          children: [
            Image.asset(
              image,
            ),
            Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: AppColors.primary),
                ),
                Gap(5),
                Text(
                  text2,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
