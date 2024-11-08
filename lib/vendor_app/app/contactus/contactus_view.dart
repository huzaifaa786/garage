// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/contactus/component/container.dart';
import 'package:mobilegarage/vendor_app/app/contactus/contactus_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/utils/rating_alertdialog/rating_alertdialog.dart';

class VContactusView extends StatefulWidget {
  const VContactusView({super.key});

  @override
  State<VContactusView> createState() => _VContactusViewState();
}

class _VContactusViewState extends State<VContactusView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VContactusController>(
        autoRemove: false,
        builder: (controller) => AppLayout(
              appBarTitle: 'Contact Us'.tr,
              hasBgColor: false,
              hasShadow: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Gap(40),
                      // AppText(
                      //   title: 'Contact Us',
                      //   size: 15,
                      //   color: AppColors.darkprimary,
                      //   fontWeight: FontWeight.w600,
                      // ),
                      // Gap(40),
                      Image.asset('assets/images/contactus.png'),
                      Gap(40),
                      Row(
                        children: [
                          ContactBox(
                            ontap: () {
                              controller.openEmail(context);
                            },
                            icon: 'assets/images/mail.svg',
                          ),
                          ContactBox(
                            icon: 'assets/images/Instagram.svg',
                            ontap: () {
                              controller.openInstagram(context);
                            },
                          ),
                          ContactBox(
                            icon: 'assets/icons/whatsapp_img.svg',
                            ontap: () {
                              controller.openWhatsApp(context);
                            },
                          ),
                          ContactBox(
                            icon: 'assets/icons/phone.svg',
                            ontap: () {
                              controller.openPhone(context);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
