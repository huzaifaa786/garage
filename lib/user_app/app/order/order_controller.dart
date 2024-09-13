// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilegarage/apis/user_apis/order_vehicles_apis/filter_order_api.dart';
import 'package:mobilegarage/apis/user_apis/order_vehicles_apis/order_vehicles_api.dart';

import 'package:mobilegarage/models/user_vehicles.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/order/components/vehicle_listTile.dart';
import 'package:mobilegarage/user_app/components/buttons/dotted_border_button.dart';
import 'package:mobilegarage/user_app/components/cards/filter_product_card.dart';
import 'package:mobilegarage/user_app/components/filter_bottomsheet/filter_bottomsheet.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  TextEditingController priceController = TextEditingController();
  TextEditingController serviceController = TextEditingController();

  double start = 0.0;
  double end = 50.0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getvehicles();
  }

  List<UserVehicles> vehiclesList = [];
  final ordervehiclesapi = OrderVehiclesApi();
  getvehicles() async {
    var response = await ordervehiclesapi.getvehicles();
    if (response.isNotEmpty) {
      vehiclesList = (response['user_vehicles'] as List<dynamic>)
          .map((item) => UserVehicles.fromJson(item as Map<String, dynamic>))
          .toList();

      update();
    }
  }

  List<StepperItemData> get stepperData => [
        StepperItemData(
            content: Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            FilterBottomsheet(),
                            isScrollControlled: true,
                          );
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              // color: AppColors.lightprimary,
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.lightPink),
                          child: SvgPicture.asset(
                            'assets/icons/filter.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      Gap(10),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: AppText(
                          title: 'Filter By',
                          fontWeight: FontWeight.w600,
                          size: 16.0,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  Gap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Gap(18),
                      AppText(
                        title: 'Approximate price '.tr,
                        fontWeight: FontWeight.w400,
                        size: 10.0,
                        color: AppColors.black.withOpacity(0.8),
                      ),
                      Row(
                        children: [
                          ConstrainedBox(
                            constraints:
                                BoxConstraints(maxWidth: Get.width * 0.35),
                            child: AppText(
                              title: '123.444444',
                              fontWeight: FontWeight.w600,
                              size: 10.0,
                              color: AppColors.primarybg,
                              overFlow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          AppText(
                            title: ' AED'.tr,
                            fontWeight: FontWeight.w600,
                            size: 13.0,
                            color: AppColors.primarybg,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            id: '1'),
        StepperItemData(
            content: Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: 'All brands',
                    size: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  Gap(10),
                  Container(
                    decoration: BoxDecoration(),
                    width: Get.width * 0.99,
                    height: Get.height * 0.18,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              right: 5, left: 5, top: 5, bottom: 12),
                          child: Center(
                            child: FilterProductCard(
                              productname: 'Super car oil',
                              produstdiscription:
                                  'Car oil 700 ml best quality for all car types ',
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            id: '2'),
        StepperItemData(
            content: Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 50, right: 50),
              child: DottedBorderButton(
                title: 'Upload service or product image'.tr,
                imgselect: () => selectVehicleImage(),
                isImgSelected: isImageSelected(),
                selectedimgpath: vehicleImage,
                imgRemove: () => removeVehicleImage(),
              ),
            ),
            id: '3'),
        StepperItemData(
            content: Padding(
              padding: const EdgeInsets.only(left: 10),

              /// this thsi this ///
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/vehicle.svg'),
                      Gap(8),
                      AppText(
                        title: 'Choose your vehicle ',
                        fontWeight: FontWeight.w600,
                        size: 12,
                      ),
                    ],
                  ),
                  Gap(8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: carNames.length,
                    itemBuilder: (context, index) {
                      final name = carNames[index];
                      return VehicleListTile(
                        value: name,
                        groupValue: selectedCarName,
                        onChanged: (value) {
                          selectCar(value!);
                        },
                        iconPath: 'assets/icons/vehicle.svg',
                        text: name,
                      );
                    },
                  ),
                  Gap(30),
                ],
              ),
            ),
            id: '4'),
        StepperItemData(
            content: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/garage_logo.svg',
                        height: 30,
                        width: 30,
                      ),
                      Gap(5),
                      AppText(
                        title: 'What do you prefer?',
                        fontWeight: FontWeight.w600,
                        size: 12,
                      ),
                    ],
                  ),
                  Gap(8),
                  // SizedBox(
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     itemCount: garageNames.length,
                  //     itemBuilder: (context, index) {
                  //       final name = garageNames[index];
                  //       return VehicleListTile(
                  //         value: name,
                  //         groupValue: selectedgarageName,
                  // onChanged: (value) {
                  //   selectGarage(value!);
                  // },
                  //         iconPath: 'assets/icons/garage_logo.svg',

                  //         text: name,
                  //       );
                  //     },
                  //   ),
                  // ),

                  Row(
                    children: [
                      Radio<String>(
                        value: 'Select garage',
                        groupValue: selectedgarageName,
                        onChanged: (value) {
                          selectGarage(value!);
                        },
                        fillColor:
                            MaterialStatePropertyAll(AppColors.primarybg),
                      ),
                      SvgPicture.asset(
                        'assets/icons/garage_logo.svg',
                        color: AppColors.primarybg,
                        height: 20,
                        width: 20,
                      ),
                      Gap(10),
                      Text(
                        'Select garage',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primarybg,
                        ),
                      ),
                    ],
                  ),
                  Gap(22),
                  Row(
                    children: [
                      Radio<String>(
                        value:
                            'Send to all garages', // Updated to match the correct value
                        groupValue: selectedgarageName,
                        onChanged: (value) {
                          selectGarage(value!);
                        },
                        fillColor:
                            MaterialStatePropertyAll(AppColors.primarybg),
                      ),
                      Image.asset(
                        'assets/images/all_garage.png',
                        color: AppColors.primarybg,
                        height: 30,
                        width: 30,
                      ),
                      Gap(10),
                      Text(
                        'Send to all garages',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primarybg,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            id: '5')
      ];

  String selectedCarName = '';
  //! Method to select a car
  void selectCar(String carName) {
    selectedCarName = carName;
    update();
  }

  //! List for car names
  final List<String> carNames = [
    'Mercedes-Benz',
    'Mercedes-Benz SL-Class',
  ];
  String selectedgarageName = 'Select garage';
  //! Method to select a garage
  void selectGarage(String garageName) {
    selectedgarageName = garageName;
    update();
  }

//! List for garage names
  final List<String> garageNames = [
    'Select garage',
    'Send to all garages',
  ];

  final picker = ImagePicker();
  String? vehicleImage;
  String? vehicleImageBase64;

  // Check if Image is Selected
  bool isImageSelected() {
    return vehicleImage != null;
  }

  // Convert Image to Base64
  String? convertImageToBase64(String imagePath) {
    File imageFile = File(imagePath);
    List<int> imageBytes = imageFile.readAsBytesSync();
    return base64Encode(imageBytes);
  }

  // Select Image
  Future<void> selectVehicleImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      vehicleImage = pickedFile.path;
      vehicleImageBase64 = convertImageToBase64(vehicleImage!);
      update();
    } else {
      print('No image selected.');
    }
  }

  void removeVehicleImage() {
    vehicleImage = null;
    vehicleImageBase64 = null;
    update(); // This will trigger a UI update to reflect the changes
  }

  // filter api

  
  filterorder() async {
    var response = await FilterOrderApi.filterOrder(
      startprice: start.toString(),
      endprice: end.toString(),
    );
    if (response.isNotEmpty) {
      print('object');

      Get.toNamed(AppRoutes.acceptedorder);
      UiUtilites.successAlertDialog(
          context: Get.context,
          onTap: () {
            Get.toNamed(AppRoutes.main);
          },
          title: 'Thank you!',
          description: 'A garage will accept your order from within 3-5 min.');
    }
  }
}
