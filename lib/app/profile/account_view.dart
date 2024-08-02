import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/profile/account_controller.dart';

import 'package:mobilegarage/components/buttons/logout_button.dart';
import 'package:mobilegarage/components/buttons/main_button.dart';
import 'package:mobilegarage/components/cards/all_profile_card.dart';
import 'package:mobilegarage/components/cards/email_profile_card.dart';
import 'package:mobilegarage/components/cards/profile_card.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      builder: (controller) => Scaffold(
        // appBar: AppBar(
        //   title: ChatTopBar(
        //     title: "Profile",
        //     showicon: false,
        //   ),
        // ),
        backgroundColor: AppColors.grey.withOpacity(0.1),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 44, right: 44, top: 56,),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileCard(
                    userName: 'User38498990',
                    userNumber: '+971 0000 0000',
                    ontap: () {},
                  ),
                  Gap(23),
                  AllProfileCard(
                      text: 'Dubai',
                      image: 'assets/images/location.png',
                      text2: 'zayed street , house3564 ,....',
                      ontap: () {}),
                  Gap(23),
                  AllProfileCard(
                      text: 'My cards',
                      image: 'assets/images/my_card.png',
                      text2: '',
                      ontap: () {}),
                  Gap(23),
                  AllProfileCard(
                      text: 'Orders history',
                      image: 'assets/images/order_history.png',
                      text2: '12 items',
                      ontap: () {}),
                  Gap(23),
                  AllProfileCard(
                      text: 'Language',
                      image: 'assets/images/languange.png',
                      text2: 'English',
                      ontap: () {}),
                  Gap(81),
                  EmailProfileCard(
                      text: 'Contact us',
                      image: 'assets/images/email.png',
                      text2: 'mobilegarage1@gmail.com',
                      ontap: () {}),
                  Gap(123),
                  LogoutButton(
                    title: 'Log out',
                    buttonWidth: Get.width * 0.77,
                    onTap: () {},
                  ),
                   Gap(25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
