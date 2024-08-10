// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import this package
import 'package:mobilegarage/app/my_location/my_location_controller.dart';
import 'package:mobilegarage/components/app_bar/top_bar.dart';
import 'package:mobilegarage/components/buttons/map_button.dart';
import 'package:mobilegarage/components/cards/all_profile_card.dart';
import 'package:mobilegarage/components/textfields/main_input.dart';
import 'package:mobilegarage/components/textfields/main_input_dropdown.dart';
import 'package:mobilegarage/helper/permission.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class MyLocationView extends StatefulWidget {
  const MyLocationView({super.key});

  @override
  State<MyLocationView> createState() => _MyLocationViewState();
}

class _MyLocationViewState extends State<MyLocationView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyLocationController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0.0,
                toolbarHeight: 95.0,
                title: TopBar(
                  title: "My Location",
                ),
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: AppColors.lightprimary,
                          borderRadius: BorderRadius.circular(80),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/map_pin.svg",
                          color: AppColors.primarybg,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Gap(10),
                      AppText(
                        title: "Dubai",
                        size: 14,
                        fontWeight: FontWeight.w500,
                        overFlow: TextOverflow.ellipsis,
                      ),
                      Gap(5),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: Get.width * 0.44),
                        child: AppText(
                          title: "zayed street , house3564",
                          size: 14,
                          color: AppColors.grey.shade500,
                          fontWeight: FontWeight.w400,
                          overFlow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Gap(12),
                  Divider(
                    thickness: 10,
                    color: AppColors.grey.shade100,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 34),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(33),
                        AppText(
                          title: "Fill location info.",
                          size: 14,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                        Gap(29),
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
                        GestureDetector(
                          onTap: () async {
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
                                            ? controller
                                                .currentPosition!.longitude
                                            : 55.2744),
                                    useCurrentLocation: true,
                                    resizeToAvoidBottomInset: false,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/map_image.png',
                              ),
                              Positioned(
                                left: Get.width * 0.1,
                                right: Get.width * 0.1,
                                top: Get.height * 0.12,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      height: Get.height * 0.06,
                                      width: Get.width * 0.9 / 0.2,
                                      decoration: BoxDecoration(
                                        color: AppColors.white.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              color: AppColors.lightprimary,
                                              borderRadius:
                                                  BorderRadius.circular(80),
                                            ),
                                            child: SvgPicture.asset(
                                              "assets/icons/map_pin.svg",
                                              color: AppColors.primarybg,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          Gap(5),
                                          controller.currentAddress == ""
                                              ? AppText(
                                                  title:
                                                      "Select location on Google map",
                                                  size: 10,
                                                  fontWeight: FontWeight.w500,
                                                )
                                              : ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                      maxWidth:
                                                          Get.width * 0.46),
                                                  child: AppText(
                                                    title: controller
                                                        .currentAddress,
                                                    size: 10,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
            ));
  }
}
