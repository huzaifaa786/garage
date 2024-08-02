// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:mobilegarage/app/auth/signup/signup_controller.dart';
import 'package:mobilegarage/components/buttons/map_button.dart';
import 'package:mobilegarage/components/textfields/main_input.dart';
import 'package:mobilegarage/components/textfields/main_input_dropdown.dart';
import 'package:mobilegarage/components/textfields/phone_inputfield.dart';
import 'package:mobilegarage/helper/permission.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primarybg,
          toolbarHeight: 20,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(color: AppColors.primarybg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/splash_logo.png'),
                Container(
                  height: Get.height * 0.741,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(80))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        children: [
                          Gap(30),
                          AppText(
                            title: 'Sign Up',
                            size: 32,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primarybg,
                          ),
                          Gap(30),
                          PhoneInputField(
                            controller: controller.phoneController,
                            onChanged: controller.onChanged,
                          ),
                          Gap(20),
                          MainInputDropdown(
                            hint: 'Emirate'.tr,
                            controller: controller.emirateController,
                            errorText: '',
                            onchange: (value) {
                              controller.emirateController.text = value;
                              // controller.emirateValidation(value);
                            },
                            items: controller.citiesList,
                          ),
                          Gap(20),
                          MainInput(
                            hint: 'Address details'.tr,
                            controller: controller.adreesdetailController,
                            errorText: '',
                          ),
                          Gap(20),
                          GoogleMapButton(
                              title: 'Select location on Google map'.tr,
                              address: controller.currentAddress,
                              onPressed: () async {
                                if (await getLocationPermission() == true) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PlacePicker(
                                        apiKey:
                                            "AIzaSyASCMQagE0IHqYPiniGuCf-_jh5XHlwMy8",
                                        onPlacePicked: (result) {
                                          controller.currentAddress =
                                              result.formattedAddress!;
                                          controller.lat =
                                              result.geometry!.location.lat;
                                          controller.lng =
                                              result.geometry!.location.lng;
                                          Navigator.of(context).pop();
                                        },
                                        initialPosition: LatLng(
                                            controller.currentPosition != null
                                                ? controller
                                                    .currentPosition!.latitude
                                                : 25.1972,
                                            controller.currentPosition != null
                                                ? controller
                                                    .currentPosition!.longitude
                                                : 55.2744),
                                        useCurrentLocation: true,
                                        resizeToAvoidBottomInset:
                                            false, // only works in page mode, less flickery, remove if wrong offsets
                                      ),
                                    ),
                                  );
                                }
                              }),
                          Gap(50),
                          AppText(
                            title: 'Type of vehicle',
                            size: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Gap(40),
                          GridView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 0,
                                      childAspectRatio: 1),
                              itemCount: controller.cars.length,
                              itemBuilder: (BuildContext context, int index) {
                                final car = controller.cars[index];
                                return Container(
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Radio<String>(
                                                value: car['name']!,
                                                groupValue:
                                                    controller.selectedVehicle,
                                                onChanged: (value) {
                                                  if (value != null) {
                                                    controller
                                                        .selectVehicle(value);
                                                  }
                                                },
                                                activeColor: AppColors.primary,
                                              ),
                                              Image.asset(
                                                car['iconPath']!,
                                              ),
                                              Gap(3),
                                              ConstrainedBox(
                                                constraints: BoxConstraints(
                                                    maxWidth: Get.width * 0.07),
                                                child: AppText(
                                                  title: car['name']!,
                                                  size: 11,
                                                  fontWeight: FontWeight.w500,
                                                  maxLines: 2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
