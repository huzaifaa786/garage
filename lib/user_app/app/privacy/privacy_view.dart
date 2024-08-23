// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/privacy/privacy_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';


class PrivacyView extends StatefulWidget {
  const PrivacyView({super.key});

  @override
  State<PrivacyView> createState() => _TermsConditionsViewState();
}

class _TermsConditionsViewState extends State<PrivacyView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacyController>(
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(95.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [appbarShadow],
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0.0,
              toolbarHeight: 95.0,
              title: TopBar(
                showicon: true,
                showgarageicon: false,
                title: "Privacy",
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Container(
              padding:
                  EdgeInsets.only(left: 54, right: 54, top: 25, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText(
                        title: 'Privacy',
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkprimary,
                      ),
                    ],
                  ),
                  Gap(25),
                  AppText(
                    title:
                        'Conditions of use By using this app, you certify that you have read and reviewed this Agreement and that you agree to comply with its terms. If you do not want to be bound by the terms of this Agreement, you are advised to stop using the app accordingly. [company name] only grants use and access of this app, its products, and its services to those who have accepted its terms. Privacy policy Before you continue using our app, we advise you to read our privacy policy [link to privacy policy] regarding our user data collection. It will help ',
                    size: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                  Gap(10),
                  AppText(
                    title:
                        'Conditions of use By using this app, you certify that you have read and reviewed this Agreement and that you agree to comply with its terms. If you do not want to be bound by the terms of this Agreement, you are advised to stop using the app accordingly. [company name] only grants use and access of this app, its products, and its services to those who have accepted its terms. Privacy policy Before you continue using our app, we advise you to read our privacy policy [link to privacy policy] regarding our user data collection. It will help ',
                    size: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
