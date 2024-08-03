// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/home/components/service_icons.dart';
import 'package:mobilegarage/app/order/components/vehicle_listTile.dart';
import 'package:mobilegarage/app/order/order_controller.dart';
import 'package:mobilegarage/components/app_bar/top_bar.dart';
import 'package:mobilegarage/components/buttons/dotted_border_button.dart';
import 'package:mobilegarage/components/textfields/main_input.dart';
import 'package:mobilegarage/components/textfields/price_inputfield.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';
import 'package:mobilegarage/utils/shadows/appbar_shadow.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        builder: (controller) => Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(95.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [appbarShadow],
                  ),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    scrolledUnderElevation: 0.0,
                    toolbarHeight: 95.0,
                    title: TopBar(
                      showicon: true,
                      title: 'Find Service',
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Gap(30),
                      Row(
                        children: [
                          SizedBox(
                            height: Get.height * 0.05,
                            width: Get.width * 0.45,
                            child: AppText(
                              title: 'What service do you need?',
                              size: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkprimary,
                            ),
                          ),
                        ],
                      ),
                      Gap(30),
                      MainInput(
                        hint: 'I need..',
                        controller: controller.serviceController,
                        errorText: '',
                      ),
                      Gap(15),
                      PriceInput(
                        hint: 'Price',
                        controller: controller.priceController,
                        errorText: '',
                      ),
                      Gap(15),
                      DottedBorderButton(
                        title: 'Upload service or product image'.tr,
                        imgselect: () => controller.selectVehicleImage(),
                        isImgSelected: controller.isImageSelected(),
                      ),
                      Gap(25),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/stop-circle.svg',
                            height: 20,
                            width: 20,
                          ),
                          Gap(10),
                          AppText(
                            title: 'Choose service category',
                            size: 12,
                            fontWeight: FontWeight.w600,
                            // color: AppColors.darkprimary,
                          ),
                        ],
                      ),
                      Gap(25),
                      SizedBox(
                        height: Get.height * 0.12,
                        child: ListView.builder(
                          itemCount: controller.itemCount,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            controller.services.length;
                            final item = controller.services[index];
                            return ServicesIcons(
                              imageUrl: item.imageUrl,
                              text: item.text,
                            );
                          },
                        ),
                      ),
                      Gap(25),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/vehicle.svg',
                            height: 16,
                            width: 19,
                          ),
                          Gap(10),
                          AppText(
                            title: 'Choose your vehicle',
                            size: 12,
                            fontWeight: FontWeight.w600,
                            // color: AppColors.darkprimary,
                          ),
                        ],
                      ),
                      Gap(10),
                      SizedBox(
                        height: controller.listHeight,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.items.length,
                          itemBuilder: (context, index) {
                            final item = controller.items[index];
                            return VehicleListTile(
                              value: item['id']!,
                              groupValue: controller.selectedValue.toString(),
                              onChanged: (value) {
                                controller.selectedValue = value;
                                controller.update();
                              },
                              iconPath: 'assets/icons/vehicle.svg',
                              text: item['text']!,
                            );
                          },
                        ),
                      ),
                      Gap(20),
                      Row(children: [
                        SvgPicture.asset(
                          'assets/icons/map_pin.svg',
                          height: 15,
                          width: 15,
                        ),
                        Gap(10),
                        AppText(
                          title: 'Select location',
                          size: 12,
                          fontWeight: FontWeight.w600,
                          // color: AppColors.darkprimary,
                        ),
                      ]),
                      Gap(20),
                    ]),
                  ),
                ),
              ),
            ));
  }
}
