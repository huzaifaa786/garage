import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class AllProfileCard extends StatelessWidget {
  const AllProfileCard(
      {super.key, required this.userName, required this.userNumber});
  final String userName;
  final String userNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11),
      height: Get.height * 0.08,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.white),
        borderRadius: BorderRadius.circular(40),
       
      ),
      child: Row(
        children: [
         Image.asset('assets/images/location.png'),
          
          
          Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userName,
                //'User38498990'
                style: TextStyle(
                    fontSize: 14,
                    //fontWeight: FontWeight.bold,
                    fontWeight: FontWeight.w500),
              ),
              Gap(2),
              Text(
                userName,
                //'+971 0000 0000'
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
