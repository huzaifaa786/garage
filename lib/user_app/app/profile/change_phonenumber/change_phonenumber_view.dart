import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/profile/change_phonenumber/change_phonenumber_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';
import 'package:mobilegarage/vendor_app/utils/app_phone_input/app_phone_input.dart';

class ChangePhonenumberView extends StatefulWidget {
  const ChangePhonenumberView({super.key});

  @override
  State<ChangePhonenumberView> createState() => _ChangePhonenumberViewState();
}

class _ChangePhonenumberViewState extends State<ChangePhonenumberView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePhonenumberController>(
        autoRemove: false,
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
                      title: "Change phone number".tr,
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(70),
                        AppText(
                          title: 'Enter your new phone number'.tr,
                          size: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black.withOpacity(0.4),
                        ),
                        AppText(
                          title: 'to continue'.tr,
                          size: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black.withOpacity(0.4),
                        ),
                        Gap(48),
                        AppPhoneInput(
                          onCountryChanged: controller.onCountryChanged,
                          errorText: controller.phoneError,
                          onChanged: controller.phoneValidation,
                          controller: controller.phoneController,
                        ),
                        Gap(83),
                        MainButton(
                          title: 'Save changes'.tr,
                          buttonWidth: Get.width * 0.77,
                          onTap: () {
                            controller.changeNumber();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            ));
  }
}
