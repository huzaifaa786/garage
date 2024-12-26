// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/contactus/component/container.dart';
import 'package:mobilegarage/vendor_app/app/contactus/contactus_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';

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
              child: Column(
                children: [
                  Gap(40),
                  Image.asset(
                    'assets/images/contactuslogo.png',
                    height: 130,
                    width: 230,
                    fit: BoxFit.cover,
                  ),
                  Gap(40),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Flexible(
                            child: ContactBox(
                              ontap: () {
                                controller.openEmail(context);
                              },
                              icon: 'assets/images/mail.svg',
                            ),
                          ),
                          Flexible(
                            child: ContactBox(
                              icon: 'assets/images/Instagram.svg',
                              ontap: () {
                                controller.openInstagram(context);
                              },
                            ),
                          ),
                          Flexible(
                            child: ContactBox(
                              icon: 'assets/icons/whatsapp_img.svg',
                              ontap: () {
                                controller.openWhatsApp(context);
                              },
                            ),
                          ),
                          Flexible(
                            child: ContactBox(
                              icon: 'assets/icons/phone.svg',
                              ontap: () {
                                controller.openPhone(context);
                              },
                            ),
                          ),
                          Flexible(
                            child: ContactBox(
                              icon: 'assets/icons/linkedln.svg',
                              ontap: () {
                                controller.openLinkedIn(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
