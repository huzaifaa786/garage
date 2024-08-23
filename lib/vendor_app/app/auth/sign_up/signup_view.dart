import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_up/components/image_selection_tile.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_up/components/inputfiled_title.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_up/components/profile_and_cover_picker.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_up/components/signup_triangle.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_up/signup_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_button/app_button.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';
import 'package:mobilegarage/vendor_app/utils/app_dropdown/app_dropdown.dart';
import 'package:mobilegarage/vendor_app/utils/app_inputfields/app_inputfield.dart';
import 'package:mobilegarage/vendor_app/utils/app_phone_input/app_phone_input.dart';
import 'package:mobilegarage/vendor_app/utils/rich_text/rich_text.dart';

class VSignupView extends StatelessWidget {
  const VSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VSignUpController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.primary_color,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset(
                    ImageConst.appLogo,
                    width: 172,
                    height: 108,
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      width: Get.width,
                      color: AppColors.white_color,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        child: Column(
                          children: [
                            const Gap(65),
                            const ProfileAndCoverPicker(),
                            const Gap(20),
                            AppInputField(
                              errorText: controller.nameError,
                              hint: 'Name of owner',
                              controller: controller.nameController,
                              onchange: (val) {
                                controller.validateFields("Name", val);
                              },
                            ),
                            const Gap(12),
                            AppInputField(
                              errorText: controller.garageNameError,
                              hint: 'Garage name',
                              controller: controller.garageNameController,
                              onchange: (val) {
                                controller.validateFields("Garage name", val);
                              },
                            ),
                            const Gap(16),
                            const InputfiledTitle(title: 'Owner Id'),
                            const Gap(8),
                            ImageSelectionTile(
                              title: 'Upload the front side of ID',
                              onTap: () {
                                controller
                                    .pickImageFromGallery('id_card_frontSide');
                              },
                              isSelected: controller.idCardFrontSide != null &&
                                  controller.idCardFrontSide!.path.isNotEmpty,
                            ),
                            const Gap(12),
                            ImageSelectionTile(
                              title: 'Upload the back side of ID',
                              onTap: () {
                                controller
                                    .pickImageFromGallery('id_card_backSide');
                              },
                              isSelected: controller.idCardBackSide != null &&
                                  controller.idCardBackSide!.path.isNotEmpty,
                            ),
                            const Gap(16),
                            const InputfiledTitle(title: 'Garage license'),
                            const Gap(8),
                            ImageSelectionTile(
                              title: 'Upload license',
                              onTap: () {
                                controller
                                    .pickImageFromGallery('upload_license');
                              },
                              isSelected: controller.uploadLicense != null &&
                                  controller.uploadLicense!.path.isNotEmpty,
                            ),
                            const Gap(12),
                            AppPhoneInput(
                              onCountryChanged: controller.onCountryChanged,
                              errorText: controller.phoneNumberError,
                              onChanged: controller.phoneValidation,
                              controller: controller.phoneNumberController,
                            ),
                            const Gap(12),
                            AppInputField(
                              errorText: controller.garageDescriptionError,
                              hint: 'Garage description',
                              controller:
                                  controller.garageDescriptionController,
                              onchange: (val) {
                                controller.validateFields(
                                    "Garage description", val);
                              },
                            ),
                            const Gap(16),
                            const InputfiledTitle(title: 'Garage location'),
                            const Gap(8),
                            DropDownField(
                              items: controller.items,
                              hint: 'Emirate',
                              selectedValue: controller.selectedValue,
                              onChanged: (value) {
                                controller.selectedValue = value;
                                controller.update();
                                controller.validateFields("Emirate", value);
                              },
                              errorText: controller.emirateError,
                            ),
                            const Gap(12),
                            AppInputField(
                              errorText: controller.garageAddressDetailError,
                              hint: 'Garage address detail',
                              controller:
                                  controller.garageAddressDetailController,
                              onchange: (val) {
                                controller.validateFields(
                                    "Garage address detail", val);
                              },
                            ),
                            const Gap(12),
                            AppInputField(
                              errorText: controller.emailError,
                              hint: 'Email',
                              controller: controller.emailController,
                              onchange: (val) {
                                controller.validateFields("Email", val);
                              },
                            ),
                            const Gap(12),
                            AppInputField(
                              errorText: controller.passwordError,
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
                            const Gap(12),
                            AppInputField(
                              errorText: controller.confirmPasswordError,
                              hint: 'Confirm Password',
                              obscure: controller.cobscurePassword,
                              controller: controller.confirmPasswordController,
                              onchange: (val) {
                                controller.validateFields(
                                    "confirm_password", val);
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
                            const Gap(30),
                            AppButton(
                              title: 'Sign Up',
                              buttonColor: AppColors.primary_color,
                              ontap: () {
                                // controller.register();
                                 Get.offNamed(AppRoutes.vhome);

                              },
                            ),
                            const Gap(12),
                            AppRichText(
                              title: "Already have an account?",
                              buttonText: 'Sign In',
                              onTap: () {
                                 Get.offNamed(AppRoutes.vsignin);
                              },
                            )
                          ],
                        ),
                      ),
                    ),

                    //* Triangle
                    Positioned(
                      left: Get.width * 0.2,
                      child: const SignupTriangle(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
