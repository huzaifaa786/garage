import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/components/cards/all_profile_card.dart';
import 'package:mobilegarage/components/textfields/phone_inputfield.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 46, right: 46),
          child: Column(
            children: [
              Gap(52),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: CachedNetworkImage(
                      imageUrl: 'https://dummyimage.com/70x70/000/0011ff',
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                      // placeholder: (context, url) => CircularProgressIndicator(),
                      // errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  // ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset('assets/images/edit.png')),
                ],
              ),
              Gap(20),
              Row(
                children: [
                  AppText(
                    title: 'My information',
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
             
             
              Gap(22),
              
                        // PhoneInputField(
                        //   controller: controller.phoneController,
                        //   onChanged: controller.onChanged,
                        // ),
            ],
          ),
        ),
      )),
    );
  }
}
