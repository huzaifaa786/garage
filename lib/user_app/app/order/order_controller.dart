// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilegarage/user_app/app/home/home_controller.dart';
import 'package:mobilegarage/user_app/components/cards/filter_product_card.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/product/products/component/product_card.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  TextEditingController priceController = TextEditingController();
  TextEditingController serviceController = TextEditingController();

  List<StepperItemData> get stepperData => [
        StepperItemData(
            content: Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: AppColors.lightprimary,
                          borderRadius: BorderRadius.circular(80),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/filter.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Gap(10),
                      AppText(
                        title: 'Filter By',
                        fontWeight: FontWeight.w600,
                        size: 16.0,
                        color: AppColors.primary,
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
                        color: AppColors.grey,
                      ),
                      Row(
                        children: [
                          ConstrainedBox(
                            constraints:
                                BoxConstraints(maxWidth: Get.width * 0.35),
                            child: AppText(
                              title: '123.444444',
                              fontWeight: FontWeight.w600,
                              size: 13.0,
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
                    width: Get.width,
                    height: Get.height * 0.2,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5,left: 5,top: 5,bottom: 5),
                          child: Center(
                            child: FilterProductCard(
                              productname: 'item.text',
                              imageUrl: 'https://dummyimage.com/70x70/000/fff',
                              produstdiscription:
                                  'dsfdsafdsfdsfsdfffsdfsdgsfgfdsdfsdfsdf sdf sdf sdf sdf sdf sdf',
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
            content: Container(
              height: 150,
              width: 50,
              color: AppColors.darkprimary,
            ),
            id: '3'),
      ];

  final picker = ImagePicker();
  String? vehicleImage;
  String? vehicleImageBase64;
  String? selectedValue;
  int get itemCount => services.length;
  static double itemHeight = Get.height * 0.04;

  double get listHeight {
    return services.length * (itemHeight);
  }

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

  //! ListView.builder

  var services = <ServiceItem>[
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Car wash',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Oil change',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Battery',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Road Service',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Maintenance',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Battery',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Car wash',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Oil change',
    ),
  ];

  final List<Map<String, String>> items = [
    {'id': 'vehicle1', 'text': 'Toyota Lexus'},
    {'id': 'vehicle2', 'text': 'Honda Civic'},
    {'id': 'vehicle3', 'text': 'Ford Raptor'},
    {'id': 'vehicle4', 'text': 'GMC'},
    {'id': 'vehicle5', 'text': 'Range Rover'},
  ];
}
