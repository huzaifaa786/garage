// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import this package
import 'package:mobilegarage/models/emirate_model.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_view.dart';
import 'package:mobilegarage/user_app/app/my_location/my_location_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/components/textfields/main_input.dart';
import 'package:mobilegarage/user_app/helper/permission.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_dropdown/app_dropdown.dart';

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
                  title: "My Location".tr,
                  showgarageicon: false,
                ),
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: controller.user != null
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightPink,
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
                                      title: box.read('locale') == 'ar'
                                          ? controller.user!.arEmirate
                                              .toString()
                                              .tr
                                          : controller.user!.emirate
                                              .toString()
                                              .tr,
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      overFlow: TextOverflow.ellipsis,
                                    ),
                                    Gap(5),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth: Get.width * 0.44),
                                      child: AppText(
                                        title: controller.user!.addressDetail
                                            .toString()
                                            .tr,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Gap(33),
                                      AppText(
                                        title: "Fill location info.".tr,
                                        size: 14,
                                        fontWeight: FontWeight.w500,
                                        textAlign: TextAlign.start,
                                      ),
                                      Gap(29),
                                      DropDownField<EmirateModel>(
                                        displayValue: (item) =>
                                            box.read('locale') == 'ar'
                                                ? item.arname!
                                                : item.name!,
                                        items: controller.emirates,
                                        hint: 'Emirate'.tr,
                                        selectedValue:
                                            controller.selectedEmirate,
                                        onChanged: (value) {
                                          controller.setSelectedEmirate(value);
                                          controller.validateFields(
                                              "Emirate",
                                              controller.selectedEmirateId
                                                  .toString());
                                          controller.update();
                                        },
                                        errorText: controller.emirateError,
                                      ),
                                      Gap(20),
                                      MainInput(
                                        height: Get.height * 0.073,
                                        hint: 'Address details'.tr,
                                        controller:
                                            controller.adreesdetailController,
                                        errorText:
                                            controller.addressdetailError,
                                      ),
                                      Gap(20),
                                     GestureDetector(
  onTap: () async {
    bool isPermissionGranted = await   controller.getLocationPermission();
    if (!isPermissionGranted) return;

    if (controller.currentPosition == null) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      controller.currentPosition = position;
      controller.lat = position.latitude;
      controller.lng = position.longitude;
      await  controller.getPlaceName(controller.lat!, controller.lng!);
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey: "AIzaSyASCMQagE0IHqYPiniGuCf-_jh5XHlwMy8",
          onPlacePicked: (result) {
            controller.currentAddress = result.formattedAddress!;
            controller.lat = result.geometry!.location.lat;
            controller.lng = result.geometry!.location.lng;
            controller.update();
            Navigator.of(context).pop();
          },
          initialPosition: LatLng(
            controller.currentPosition!.latitude,
            controller.currentPosition!.longitude,
          ),
          useCurrentLocation: false, // We manually fetch the location
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
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
              padding: EdgeInsets.symmetric(horizontal: 5),
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
                      color: AppColors.lightPink,
                      borderRadius: BorderRadius.circular(80),
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
                          title: "Select location on Google map".tr,
                          size: 10,
                          fontWeight: FontWeight.w500,
                        )
                      : ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: Get.width * 0.46),
                          child: AppText(
                            title: controller.currentAddress,
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


                                      Gap(60),
                                      MainButton(
                                        onTap: () =>
                                            controller.updateLocation(),
                                        title: 'Save changes'.tr,
                                        height: Get.height * 0.077,
                                      ),
                                      Gap(27),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Text(''))),
            ));
  }
}
