// ignore_for_file: prefer_const_constructors
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/my_cars/components/radio_card.dart';
import 'package:mobilegarage/user_app/app/my_cars/my_cars_controllers.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/buttons/dotted_border_button.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/components/textfields/main_input.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';
import 'package:mobilegarage/user_app/utils/ui_utils/ui_utils.dart';

class MyCarsView extends StatefulWidget {
  const MyCarsView({super.key});

  @override
  State<MyCarsView> createState() => _MyCarsViewState();
}

class _MyCarsViewState extends State<MyCarsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCarsControllers>(
        builder: (controllers) => Scaffold(
              // backgroundColor: AppColors.grey.shade200,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(70.0),
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
                        showgarageicon: false,
                        title: "My Cars",
                      ),
                    ),
                  )),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(color: AppColors.white),
                            child: Column(
                              children: [
                                Gap(40),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/cars.svg",
                                        height: 17,
                                        width: 17,
                                      ),
                                      Gap(6),
                                      Text(
                                        "Marked as default",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Gap(7),
                                      Text(
                                        "white Mercedes 2022",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemCount: controllers.radioButton.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final addCars =
                                          controllers.radioButton[index];
                                      return RadioCard(
                                        value: addCars["id"].toString(),
                                        groupValue: controllers.selectedValue
                                            .toString(),
                                        onChanged: (value) {
                                          controllers.selectedValue = value;
                                          controllers.update();
                                        },
                                        addCars: addCars,
                                        isSelected: controllers.selectedValue ==
                                            addCars["id"].toString(),
                                      );
                                    }),
                              ],
                            ),
                          ),
                          Gap(28),
                          Divider(
                            color: AppColors.grey.shade200,
                            thickness: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 34),
                            child: Column(
                              children: controllers.vehicleSections
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
                                          title: 'Fill info',
                                          size: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                    Gap(20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: MainInput(
                                        height: Get.height * 0.07,
                                        hint: 'Vehicle information'.tr,
                                        controller:
                                            section['vehicleDetailController'],
                                        errorText: '',
                                      ),
                                    ),
                                    Gap(20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: DottedBorderButton(
                                        title: 'Upload vehicle photo'.tr,
                                        imgselect: () => controllers
                                            .selectVehicleImage(index),
                                        isImgSelected:
                                            controllers.isImageSelected(index),
                                        selectedimgpath:
                                            section['vehicleImage'],
                                        imgRemove: () => controllers
                                            .removeVehicleImage(index),
                                      ),
                                    ),
                                    Gap(10),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                          Gap(28),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: GestureDetector(
                              onTap: controllers.addVehicleSection,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Container(
                                  height: Get.height * 0.07,
                                  width: Get.width * 0.8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColors.lightPink,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                        Gap(10),
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
                            ),
                          ),
                          Gap(28),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 45.0,
                            ),
                            child: MainButton(
                              height: Get.height * 0.07,
                              title: 'Save Changes',
                              onTap: () {
                                UiUtilites.DeleteSuccessAlert(
                                    context, () {}, () {});
                              },
                            ),
                          ),
                          Gap(15),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
