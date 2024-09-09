// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/profile/changepassword/changepassword_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_button/app_button.dart';

import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';
import 'package:mobilegarage/vendor_app/utils/app_inputfields/app_inputfield.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class VChangepasswordView extends StatefulWidget {
  const VChangepasswordView({super.key});

  @override
  State<VChangepasswordView> createState() => _VChangepasswordViewState();
}

class _VChangepasswordViewState extends State<VChangepasswordView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VChangepasswordController>(
      autoRemove: false,
      builder: (controller) => Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: AppBar(
                centerTitle: true,
                title: AppText(
                  title: 'Change Password',
                  size: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary_color,
                ),
                elevation: 0,
                scrolledUnderElevation: 0.0,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(35.0),
            child: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  AppInputField(
                    errorText: controller.passwordError,
                    hint: 'Old Password',
                    obscure: controller.obscureOldPassword,
                    controller: controller.oldpasswordController,
                    onchange: (val) {
                      controller.validateFields("old_password", val);
                    },
                    hasSuffix: true,
                    suffixWidget: InkWell(
                      onTap: controller.oldPasswordToggle,
                      child: controller.obscureOldPassword
                          ? SvgPicture.asset(
                              ImageConst.eye_off_ic,
                              fit: BoxFit.scaleDown,
                            )
                          : SvgPicture.asset(
                              ImageConst.eye_ic,
                              fit: BoxFit.scaleDown,
                            ),
                    ),
                  ),
                  Gap(20),
                  AppInputField(
                    errorText: controller.newpasswordError,
                    hint: 'Password',
                    obscure: controller.obscurePassword,
                    controller: controller.passwordController,
                    onchange: (val) {
                      controller.validateFields("password", val);
                    },
                    hasSuffix: true,
                    suffixWidget: InkWell(
                      onTap: controller.passwordToggle,
                      child: controller.obscurePassword
                          ? SvgPicture.asset(
                              ImageConst.eye_off_ic,
                              fit: BoxFit.scaleDown,
                            )
                          : SvgPicture.asset(
                              ImageConst.eye_ic,
                              fit: BoxFit.scaleDown,
                            ),
                    ),
                  ),
                  const Gap(20),
                  AppInputField(
                    errorText: controller.confirmPasswordError,
                    hint: 'Confirm Password',
                    obscure: controller.cobscurePassword,
                    controller: controller.confirmPasswordController,
                    onchange: (val) {
                      controller.validateFields("confirm_password", val);
                    },
                    hasSuffix: true,
                    suffixWidget: InkWell(
                      onTap: controller.confirmPasswordToggle,
                      child: controller.cobscurePassword
                          ? SvgPicture.asset(
                              ImageConst.eye_off_ic,
                              fit: BoxFit.scaleDown,
                            )
                          : SvgPicture.asset(
                              ImageConst.eye_ic,
                              fit: BoxFit.scaleDown,
                            ),
                    ),
                  ),
                  Gap(35),
                  AppButton(
                    title: 'Confirm',
                    buttonColor: controller.isButtonClicked
                        ? AppColors.divider_color
                        : AppColors.primary_color,
                    ontap: () {
                      controller.onSaveChanges();
                    },
                  ),
                  Gap(20),
                  controller.isButtonClicked
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              title: 'Password changed successfully ',
                              color: AppColors.green_color,
                            ),
                            SvgPicture.asset('assets/images/checkcircle.svg'),
                          ],
                        )
                      : Gap(1)
                ],
              ),
            )),
          )),
    );
  }
}
