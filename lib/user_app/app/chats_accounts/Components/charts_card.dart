// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class ChartsCard extends StatelessWidget {
  const ChartsCard({super.key, this.name,this.img,this.msg,this.ontap});
  final name;
  final img;
  final msg;
 final ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 2),
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: Get.width,
        // height: 81,
        color:  AppColors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                width: 54.0,
                height: 54.0,
                decoration: BoxDecoration(
                  color: Color(0xff7c94b6),
                  // image: DecorationImage(
                  //   image: NetworkImage(
                  //     'https://dummyimage.com/61x61/000/fff',
                  //   ),
                  //   fit: BoxFit.cover,
                  // ),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(
                    color: AppColors.grey.shade100,
                    width: 3.0,
                  ),
                ),
                child: ClipOval(
                    child: AppNetworkImage(
                  assetPath: 'assets/images/street_garage.png',
                  height: Get.height * 0.08,
                  width: Get.width * 0.18,
                )),
              ),
          
              // GestureDetector(
              //     onTap: () {
              //       Get.toNamed(AppRoutes.chatScreen);
              //     },
              //     child: Text("ddd")),
              Gap(8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: name,
                    color: AppColors.darkprimary,
                    size: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  Gap(4),
                  AppText(
                    maxLines: 1,
                    title: msg,
                    color: AppColors.grey,
                    overFlow: TextOverflow.ellipsis,
                    size: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

 // item["showBluedot"]
                      //     ? Container(
                      //         height: 5,
                      //         width: 5,
                      //         decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           color: AppColors.darkblue,
                      //         ),
                      //       )
                      //     : SizedBox.shrink(),
                      //   Gap(3),
                      // AppText(
                      //   title: item['newMessage'],
                      //   size: 10,
                      //   fontWeight: FontWeight.w600,
                      //   color: item["showcolor"]
                      //       ? AppColors.black
                      //       : AppColors.grey,
                      // ),