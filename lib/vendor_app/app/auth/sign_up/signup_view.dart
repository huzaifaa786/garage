import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:mobilegarage/components/buttons/google_button.dart';
import 'package:mobilegarage/models/emirate_model.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_view.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_up/components/image_selection_tile.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_up/components/inputfiled_title.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_up/components/profile_and_cover_picker.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_up/components/signup_triangle.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_up/signup_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_button/app_button.dart';
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
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  // child: Image.asset(
                  //   ImageConst.appLogo,
                  //   width: 172,
                  //   height: 108,
                  // ),
                  child: SvgPicture.asset(
                    'assets/icons/mobile_garagelogo.svg',
                    color: AppColors.white_color,
                    height: 108,
                    width: 172,
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
                              hint: 'Name of owner'.tr,
                              controller: controller.nameController,
                              onchange: (val) {
                                controller.validateFields("Name ", val);
                              },
                            ),
                            const Gap(12),
                            AppInputField(
                              errorText: controller.garageNameError,
                              hint: 'Garage name'.tr,
                              controller: controller.garageNameController,
                              onchange: (val) {
                                controller.validateFields("Garage name ", val);
                              },
                            ),
                            const Gap(16),
                            InputfiledTitle(title: 'Owner Id'.tr),
                            const Gap(8),
                            ImageSelectionTile(
                              title: 'Upload the front side of ID'.tr,
                              onTap: () {
                                controller
                                    .pickImageFromGallery('id_card_frontSide');
                              },
                              isSelected: controller.idCardFrontSide != null &&
                                  controller.idCardFrontSide!.path.isNotEmpty,
                            ),
                            const Gap(12),
                            ImageSelectionTile(
                              title: 'Upload the back side of ID'.tr,
                              onTap: () {
                                controller
                                    .pickImageFromGallery('id_card_backSide');
                              },
                              isSelected: controller.idCardBackSide != null &&
                                  controller.idCardBackSide!.path.isNotEmpty,
                            ),
                            const Gap(16),
                            InputfiledTitle(title: 'Garage license'.tr),
                            const Gap(8),
                            ImageSelectionTile(
                              title: 'Upload license'.tr,
                              onTap: () {
                                controller
                                    .pickImageFromGallery('upload_license');
                              },
                              isSelected: controller.uploadLicense != null &&
                                  controller.uploadLicense!.path.isNotEmpty,
                            ),
                            const Gap(12),
                            Directionality(
                              textDirection: box.read('locale') == 'ar'
                                  ? TextDirection.ltr
                                  : TextDirection.ltr,
                              child: AppPhoneInput(
                                onCountryChanged: controller.onCountryChanged,
                                errorText: controller.phoneNumberError,
                                onChanged: controller.phoneValidation,
                                controller: controller.phoneNumberController,
                              ),
                            ),
                            const Gap(12),
                            AppInputField(
                              errorText: controller.garageDescriptionError,
                              hint: 'Garage description'.tr,
                              controller:
                                  controller.garageDescriptionController,
                              onchange: (val) {
                                controller.validateFields(
                                    "Garage description ", val);
                              },
                            ),
                            const Gap(16),
                            InputfiledTitle(title: 'Garage location'.tr),
                            const Gap(8),
                            GoogleButton(
                              address: controller.currentAddress,
                              isSelected: controller.locationselected,
                              onTap: () async {
                                if (await controller.getLocationPermission() == true) {
                                  try {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PlacePicker(
                                          apiKey:
                                              "AIzaSyASCMQagE0IHqYPiniGuCf-_jh5XHlwMy8",
                                          onPlacePicked: (result) {
                                            if (result != null &&
                                                result.geometry != null) {
                                              controller.currentAddress =
                                                  result.formattedAddress ?? '';
                                              controller.lat =
                                                  result.geometry!.location.lat;
                                              controller.lng =
                                                  result.geometry!.location.lng;
                                              controller.locationselected =
                                                  true;
                                              controller.update();
                                              Navigator.of(context).pop();
                                            } else {
                                              // Handle invalid result
                                              print(
                                                  "Error: Invalid place result");
                                            }
                                          },
                                          initialPosition: LatLng(
                                            controller.currentPosition != null
                                                ? controller
                                                    .currentPosition!.latitude
                                                : 25.1972,
                                            controller.currentPosition != null
                                                ? controller
                                                    .currentPosition!.longitude
                                                : 55.2744,
                                          ),
                                          useCurrentLocation: true,
                                          resizeToAvoidBottomInset: false,
                                        ),
                                      ),
                                    );
                                  } catch (e) {
                                    print("Error: $e");
                                  }
                                } else {
                                  print("Location permission not granted");
                                }
                              },
                            ),
                            const Gap(15),
                            DropDownField<EmirateModel>(
                              displayValue: (item) => item.name!,
                              items: controller.emirates,
                              hint: 'Emirate'.tr,
                              selectedValue: controller.selectedEmirate,
                              onChanged: (value) {
                                controller.setSelectedEmirate(value);
                                controller.validateFields("Emirate ",
                                    controller.selectedEmirateId.toString());
                                controller.update();
                              },
                              errorText: controller.emirateError,
                            ),
                            const Gap(12),
                            AppInputField(
                              errorText: controller.garageAddressDetailError,
                              hint: 'Garage address detail'.tr,
                              controller:
                                  controller.garageAddressDetailController,
                              onchange: (val) {
                                controller.validateFields(
                                    "Garage address detail ", val);
                              },
                            ),
                            const Gap(12),
                            AppInputField(
                              errorText: controller.emailError,
                              hint: 'Email'.tr,
                              controller: controller.emailController,
                              onchange: (val) {
                                controller.validateFields("Email ", val);
                              },
                            ),
                            const Gap(12),
                            AppInputField(
                              errorText: controller.passwordError,
                              hint: 'Password'.tr,
                              obscure: controller.obscurePassword,
                              controller: controller.passwordController,
                              onchange: (val) {
                                controller.validateFields("password ", val);
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
                              hint: 'Confirm Password'.tr,
                              obscure: controller.cobscurePassword,
                              controller: controller.confirmPasswordController,
                              onchange: (val) {
                                controller.validateFields(
                                    "confirm password ", val);
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
                              title: 'Sign Up'.tr,
                              buttonColor: AppColors.primary_color,
                              ontap: () {
                                controller.register();
                              },
                            ),
                            const Gap(12),
                            AppRichText(
                              title: "Already have an account?".tr,
                              buttonText: 'Sign In'.tr,
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
