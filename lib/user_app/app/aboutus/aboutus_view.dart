// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/aboutus/aboutus_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';

class AboutusView extends StatefulWidget {
  const AboutusView({super.key});

  @override
  State<AboutusView> createState() => _TermsConditionsViewState();
}

class _TermsConditionsViewState extends State<AboutusView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutusController>(
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
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
                title: "About us",
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
                        title: 'Who are we?',
                        size: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkprimary,
                      ),
                    ],
                  ),
                  Gap(25),
                  AppText(
                    title: controller.des ?? '',
                    size: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                  Gap(27),
                  AppText(
                    title: 'Location ',
                    size: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkprimary,
                    // height: 1.5,
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/map_pin.svg',
                        color: AppColors.darkprimary,
                      ),
                      Gap(8),
                      AppText(
                        title: "${controller.city ?? ''},",
                        size: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkprimary,
                      ),
                      Gap(8),
                      Expanded(
                        child: AppText(
                          title: controller.location ?? '',
                          size: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkprimary,
                          overFlow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ],
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
