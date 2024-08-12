// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:mobilegarage/app/auth/signup/signup_controller.dart';
import 'package:mobilegarage/components/buttons/dotted_border_button.dart';
import 'package:mobilegarage/components/buttons/main_button.dart';
import 'package:mobilegarage/components/buttons/map_button.dart';
import 'package:mobilegarage/components/textfields/main_input.dart';
import 'package:mobilegarage/components/textfields/main_input_dropdown.dart';
import 'package:mobilegarage/components/textfields/phone_inputfield.dart';
import 'package:mobilegarage/helper/permission.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/utils/app_text/app_rich_text.dart';
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
            child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(color: AppColors.primarybg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/splash_logo.png'),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                  ),
                  child: Container(
                    height: Get.height * 0.741,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 35,
                        ),
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
                                title: 'Select location on Google map',
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
                                            controller.update();
                                            Navigator.of(context).pop();
                                          },
                                          initialPosition: LatLng(
                                              controller.currentPosition != null
                                                  ? controller
                                                      .currentPosition!.latitude
                                                  : 25.1972,
                                              controller.currentPosition != null
                                                  ? controller.currentPosition!
                                                      .longitude
                                                  : 55.2744),
                                          useCurrentLocation: true,
                                          resizeToAvoidBottomInset: false,
                                        ),
                                      ),
                                    );
                                  }
                                }),
                            Column(
                              children: controller.vehicleSections
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                int index = entry.key;
                                var section = entry.value;
                                return Column(
                                  key: ValueKey(index),
                                  children: [
                                    Gap(25),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                          title: 'Type of vehicle',
                                          size: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        if (index != 0)
                                          GestureDetector(
                                            onTap: () => controller
                                                .removeVehicleSection(index),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/bin.svg'),
                                                Gap(3),
                                                AppText(
                                                  title: 'Delete',
                                                  size: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.primary,
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                    Gap(20),
                                    GridView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 2,
                                      ),
                                      itemCount: controller.cars.length,
                                      itemBuilder:
                                          (BuildContext context, int carIndex) {
                                        final car = controller.cars[carIndex];
                                        return Flex(
                                          direction: Axis.horizontal,
                                          children: [
                                            Flexible(
                                              child: Row(
                                                children: [
                                                  Radio<String>(
                                                    value: car['name']!,
                                                    groupValue: section[
                                                        'selectedVehicle'],
                                                    onChanged: (value) {
                                                      if (value != null) {
                                                        controller
                                                            .selectVehicle(
                                                                index, value);
                                                      }
                                                    },
                                                    activeColor:
                                                        AppColors.primary,
                                                  ),
                                                  Image.asset(
                                                    car['iconPath']!,
                                                  ),
                                                  Gap(3),
                                                  ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                        maxWidth:
                                                            Get.width * 0.07),
                                                    child: AppText(
                                                      title: car['name']!,
                                                      size: 11,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    Gap(20),
                                    MainInput(
                                      hint: 'Vehicle information'.tr,
                                      controller:
                                          section['vehicleDetailController'],
                                      errorText: '',
                                    ),
                                    Gap(20),
                                    DottedBorderButton(
                                      title: 'Upload vehicle photo'.tr,
                                      imgselect: () =>
                                          controller.selectVehicleImage(index),
                                      isImgSelected:
                                          controller.isImageSelected(index),
                                      selectedimgpath: section['vehicleImage'],
                                      imgRemove: () =>
                                          controller.removeVehicleImage(index),
                                    ),
                                    Gap(10),
                                  ],
                                );
                              }).toList(),
                            ),
                            Gap(20),
                            GestureDetector(
                              onTap: controller.addVehicleSection,
                              child: Container(
                                height: 40,
                                width: Get.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: AppColors.lightprimary,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: AppColors.primary),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: AppColors.white,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                      AppText(
                                        title: 'Add another vehicle',
                                        color: AppColors.primary,
                                        size: 11,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Gap(40),
                            MainButton(
                              title: 'Sign Up',
                              txtweight: FontWeight.w600,
                              onTap: () {
                                Get.toNamed(AppRoutes.otp);
                              },
                            ),
                            Gap(60),
                            AuthRichText(
                              title: 'Already have an account?',
                              description: 'Sign In',
                              titlesize: 14,
                              descriptiosize: 14,
                              titlefontweight: FontWeight.w500,
                              descriptionfontweight: FontWeight.w600,
                              descriptionColor: AppColors.primary,
                              titleColor: Colors.black.withOpacity(0.6),
                              onTap: () {
                                Get.offAllNamed(AppRoutes.signin);
                              },
                            ),
                            Gap(60),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
