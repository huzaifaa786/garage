// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/home/components/review_box.dart';
import 'package:mobilegarage/vendor_app/app/profile/editprofile.dart/component/button.dart';
import 'package:mobilegarage/vendor_app/app/profile/editprofile.dart/component/profile_cover_picker.dart';
import 'package:mobilegarage/vendor_app/app/profile/editprofile.dart/editprofile_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_button/app_button.dart';
import 'package:mobilegarage/vendor_app/utils/app_inputfields/app_inputfield.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class VEditprofileView extends StatefulWidget {
  const VEditprofileView({super.key});

  @override
  State<VEditprofileView> createState() => _VEditprofileViewState();
}

class _VEditprofileViewState extends State<VEditprofileView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VEditprofileController>(
      autoRemove: false,
      builder: (controller) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 224, 223, 223),
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
                  title: 'Edit profile'.tr,
                  size: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary_color,
                ),
                scrolledUnderElevation: 0,
                elevation: 0.0,
                backgroundColor: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: controller.garage != null
                ? Column(
                    children: [
                      Container(
                        // height: Get.height * 0.6,
                        decoration: BoxDecoration(color: AppColors.white_color),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              Gap(13),
                              ProfileAndCoverPickerr(),
                              SizedBox(height: Get.height * 0.05),
                              Row(
                                children: [
                                  AppText(
                                    title: 'Garage description'.tr,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                              Gap(20),
                              AppInputField(
                                errorText: controller.garageDescriptionError,
                                hint: 'Garage description'.tr,
                                controller:
                                    controller.garageDescriptionController,
                                onchange: (val) {
                                  controller.validateFields(
                                      "Garage description", val);
                                },
                              ),
                              Gap(16),
                              AppButton(
                                title: controller.isButtonClicked
                                    ? 'Changes saved successfully'.tr
                                    : 'Save Changes'.tr,
                                titleColor: controller.isButtonClicked
                                    ? AppColors.green_color
                                    : AppColors.white_color,
                                buttonColor: controller.isButtonClicked
                                    ? AppColors.divider_color
                                    : AppColors.primary_color,
                                suffixWidget: controller.isButtonClicked
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: SvgPicture.asset(
                                            'assets/images/checkcircle.svg'),
                                      )
                                    : Gap(1),
                                ontap: () {
                                  controller.onSaveChanges();
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      Gap(12),
                      Container(
                        decoration: BoxDecoration(color: AppColors.white_color),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Row(
                                  children: [
                                    Icon(Icons.settings),
                                    AppText(
                                      title: ' Setting'.tr,
                                      size: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                              EditProductsField(
                                ontap: () {
                                  Get.toNamed(AppRoutes.vtradinglicense);
                                },
                                icon: 'assets/icons/license.svg',
                                text: 'Edit or add new trading license'.tr,
                              ),
                              EditProductsField(
                                ontap: () {
                                  Get.toNamed(AppRoutes.vownerid);
                                },
                                icon: 'assets/icons/license.svg',
                                text: 'Edit or add new owner ID'.tr,
                              ),
                              EditProductsField(
                                ontap: () {
                                  Get.toNamed(AppRoutes.vgarage_timings);
                                },
                                icon: 'assets/icons/Timeclock.svg',
                                text: 'Open time and close time'.tr,
                              ),
                              EditProductsField(
                                ontap: () {
                                  Get.toNamed(AppRoutes.vchangepassword);
                                },
                                icon: 'assets/images/lock.svg',
                                text: 'Change password'.tr,
                              ),
                              EditProductsField(
                                ontap: () {
                                  Get.toNamed(AppRoutes.language);
                                },
                                icon: 'assets/images/globe.svg',
                                text: 'Change language'.tr,
                                langtext: 'English'.tr,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, top: 14, right: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // UiUtilites.showConfirmationDialog(
                                        //   false,
                                        //   'Are you Sure that you want\n to log out ?'
                                        //       .tr,
                                        //   onConfirm: () async {
                                        //     GetStorage box = GetStorage();
                                        //     await box.remove('api_token');
                                        //     controller.update();
                                        //     Get.offAllNamed(
                                        //         AppRoutes.selectside);
                                        //   },
                                        // );

                                        UiUtilites.confirmAlertDialog(
                                          context: context,
                                          onCancelTap: () {
                                            Get.back();
                                          },
                                          onConfirmTap: () async {
                                            GetStorage box = GetStorage();
                                            await box.remove('api_token');
                                            controller.update();
                                            Get.offAllNamed(
                                                AppRoutes.selectside);
                                          },
                                          title:
                                              'Are you Sure that you want\n to log out ?'
                                                  .tr,
                                          cancelText: 'No'.tr,
                                          confirmText: 'Yes'.tr,
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.light_red,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        height: 49,
                                        width: Get.width * 0.4,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                  height: 25,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppColors.white_color,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Image.asset(
                                                        'assets/images/loggout.png'),
                                                  )),
                                              Gap(8),
                                              AppText(
                                                title: 'Log Out'.tr,
                                                size: 12,
                                                color: AppColors.primary_color,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Gap(0),
          ),
        ),
      ),
    );
  }
}
