import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/user_app/app/privacy/privacy_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';

class PrivacyView extends StatefulWidget {
  const PrivacyView({super.key});

  @override
  State<PrivacyView> createState() => _PrivacyViewState();
}

class _PrivacyViewState extends State<PrivacyView> {
  String loadingText = 'Loading privacy policy'.tr;
  Timer? _timer;
  int dotCount = 0;

  @override
  void initState() {
    super.initState();
    _startLoadingAnimation();
  }

  void _startLoadingAnimation() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        dotCount = (dotCount + 1) % 4;
        loadingText = "${'Loading privacy policy'.tr} ${'.' * dotCount}";
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        GetStorage box = GetStorage();
    return GetBuilder<PrivacyController>(
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
                title: "Privacy".tr,
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
                        title: 'Privacy'.tr,
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkprimary,
                      ),
                    ],
                  ),
                  Gap(25),
                  if (controller.privacyPolicy.isNotEmpty)
                    for (var policy in controller.privacyPolicy)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: AppText(
                          title:  box.read('locale') == 'ar'?policy['ar_description']:policy['description'],
                          size: 10,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      )
                  else
                    Center(
                      child: AppText(
                        title: loadingText.tr,
                        size: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
