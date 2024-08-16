// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/terms/terms_conditions_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/cards/terms_condition_listile.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';

class TermsConditionsView extends StatefulWidget {
  const TermsConditionsView({super.key});

  @override
  State<TermsConditionsView> createState() => _TermsConditionsViewState();
}

class _TermsConditionsViewState extends State<TermsConditionsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TermsConditionsController>(
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
                title: "Terms & Conditions",
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Container(
              padding:
                  EdgeInsets.only(left: 54, right: 54, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText(
                        title: 'Terms & Conditions',
                        size: 12,
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
                        'Conditions of use By using this app, you certify that you have read and reviewed this Agreement and that you agree to comply with its terms. If you do not want to be bound by the terms of this Agreement, you are advised to stop using the app accordingly. [company name] only grants use and access of this app, its products, and its services to those who have accepted its terms. Privacy policy Before you continue using our app, we advise you to read our privacy policy [link to privacy policy] regarding our user data collection. It will help ',size: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  )
                  // Divider(
                  //   thickness: 3.5,
                  //   color: Colors.grey.withOpacity(0.3),
                  // ),

                  // Padding(
                  //   padding: EdgeInsets.only(left: 54, top: 10),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       AppText(
                  //         title: 'Popular questions?',
                  //         size: 12,
                  //         fontWeight: FontWeight.w600,
                  //         color: AppColors.darkprimary,
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  //           SizedBox(
                  //             height: MediaQuery.of(context).size.height * 0.4,
                  //             child: ListView.builder(
                  //               padding: EdgeInsets.only(left: 38, right: 38),
                  //               itemCount: controller.questionsAndAnswers.length,
                  //               shrinkWrap: true,
                  //               physics: NeverScrollableScrollPhysics(),
                  //               itemBuilder: (context, index) {

                  // return TermsConditionQuestionAnswer(
                  //      question: 'How can i delete my account?',
                  //      answer: 'Conditions of use By using this app, you certify that you have read and reviewed this Agreement and that ',
                  // );
                  //               },
                  //             ),
                  //           ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
