import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key, required this.userName, required this.userNumber,this.image,});
  final String userName;
  final String userNumber;
  final image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11),
      height: Get.height * 0.10,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.white),
        borderRadius: BorderRadius.circular(40),
        // boxShadow: [ // Adding shadow effect
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.2), // Shadow color
        //     blurRadius: 2, // Softness of the shadow
        //     offset: Offset(0, 0), // Offset from the container
        //   ),
        // ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              // Container(
              //   height: 63,
              //   width: 64,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(45),
              //     color: AppColors.primary,
              //   ),
                // ClipRRect(
                //       borderRadius: BorderRadius.circular(8),
                //       child: image != null && image!.isNotEmpty
                //           ? CachedNetworkImage(
                //               height: MediaQuery.of(context).size.height * 0.21,
                //               width: MediaQuery.of(context).size.width * 0.4,
                //               imageUrl: image,
                //               fit: BoxFit.cover,
                //             )
                //           : Container(),
                //     ),
             // ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset('assets/images/edit.png')),
            ],
          ),
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
