import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/app/search/search_controller.dart';

class FilterBottomsheet extends StatelessWidget {
  const FilterBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(
   
      builder: (controller) => Container(
       
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: AppColors.white,
        ),
        child: FractionallySizedBox(
          heightFactor: 0.9,
          child: Wrap(
            children: [
              SizedBox(
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(40),
                    AppText(
                      title: 'Filter By',
                      size: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    Divider(
                      color: AppColors.lightgrey,
                    ),
                    Gap(10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              AppText(
                                title: 'Sort',
                                size: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          Gap(5),
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.black,
                                ),
                              ),
                              Gap(5),
                              AppText(
                                title: 'Price',
                                size: 12,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                          Gap(5),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (controller.selectedIndex != 0) {
                                    controller.selectIndex(0);
                                  }
                                },
                                child: Container(
                                  height: 31,
                                  width: 103,
                                  decoration: BoxDecoration(
                                    color: controller.selectedIndex == 0
                                        ? AppColors.primary
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: AppColors.primary),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      title: 'From low to high',
                                      size: 10,
                                      fontWeight: FontWeight.w500,
                                      color: controller.selectedIndex == 0
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Gap(10),
                              GestureDetector(
                                onTap: () {
                                  if (controller.selectedIndex != 1) {
                                    controller.selectIndex(1);
                                  }
                                },
                                child: Container(
                                  height: 31,
                                  width: 103,
                                  decoration: BoxDecoration(
                                    color: controller.selectedIndex == 1
                                        ? AppColors.primary
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: AppColors.primary),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      title: 'From high to low',
                                      size: 10,
                                      fontWeight: FontWeight.w500,
                                      color: controller.selectedIndex == 1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //////////////////////////////////////////////////////////////////////////////
                          Gap(15),
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.black,
                                ),
                              ),
                              Gap(5),
                              AppText(
                                title: 'The closest',
                                size: 12,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                          Gap(5),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (controller.selectedIndexTwo != 0) {
                                    controller.selectIndexTwo(0);
                                  }
                                },
                                child: Container(
                                  height: 31,
                                  width: 190,
                                  decoration: BoxDecoration(
                                    color: controller.selectedIndexTwo == 0
                                        ? AppColors.primary
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: AppColors.primary),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      title: 'From the closest to the furthest',
                                      size: 10,
                                      fontWeight: FontWeight.w500,
                                      color: controller.selectedIndexTwo == 0
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Gap(10),
                              GestureDetector(
                                onTap: () {
                                  if (controller.selectedIndexTwo != 1) {
                                    controller.selectIndexTwo(1);
                                  }
                                },
                                child: Container(
                                  height: 31,
                                  width: 103,
                                  decoration: BoxDecoration(
                                    color: controller.selectedIndexTwo == 1
                                        ? AppColors.primary
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: AppColors.primary),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      title: 'Random',
                                      size: 10,
                                      fontWeight: FontWeight.w500,
                                      color: controller.selectedIndexTwo == 1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gap(15),
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.black,
                                ),
                              ),
                              Gap(5),
                              AppText(
                                title: 'Rating',
                                size: 12,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                          Gap(5),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (controller.selectedIndexThree != 0) {
                                    controller.selectIndexThree(0);
                                  }
                                },
                                child: Container(
                                  height: 31,
                                  width: 103,
                                  decoration: BoxDecoration(
                                    color: controller.selectedIndexThree == 0
                                        ? AppColors.primary
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: AppColors.primary),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      title: 'From high to low ',
                                      size: 10,
                                      fontWeight: FontWeight.w500,
                                      color: controller.selectedIndexThree == 0
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Gap(10),
                              GestureDetector(
                                onTap: () {
                                  if (controller.selectedIndexThree != 1) {
                                    controller.selectIndexThree(1);
                                  }
                                },
                                child: Container(
                                  height: 31,
                                  width: 103,
                                  decoration: BoxDecoration(
                                    color: controller.selectedIndexThree == 1
                                        ? AppColors.primary
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: AppColors.primary),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      title: 'From high to low ',
                                      size: 10,
                                      fontWeight: FontWeight.w500,
                                      color: controller.selectedIndexThree == 1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
          
                          Gap(15),
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.black,
                                ),
                              ),
                              Gap(5),
                              AppText(
                                title: 'Filter',
                                size: 12,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                          Gap(5),
                          ///                     AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ///
                          /// 
                          /// 
                          /// 
                          Row(
                            children: [
                               GestureDetector(
                                onTap: () {
                                  if (controller.selectedIndexThree != 0) {
                                    controller.selectIndexThree(0);
                                  }
                                },
                                child: Container(
                                  height: 31,
                                  width: 48,
                                  decoration: BoxDecoration(
                                    color: controller.selectedIndexThree == 0
                                        ? AppColors.primary
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: AppColors.primary),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      title: 'All',
                                      size: 10,
                                      fontWeight: FontWeight.w500,
                                      color: controller.selectedIndexThree == 0
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Gap(10),
                              GestureDetector(
                                onTap: () {
                                  if (controller.selectedIndexThree != 0) {
                                    controller.selectIndexThree(0);
                                  }
                                },
                                child: Container(
                                  height: 31,
                                  width: 103,
                                  decoration: BoxDecoration(
                                    color: controller.selectedIndexThree == 0
                                        ? AppColors.primary
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: AppColors.primary),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      title: 'Garages ',
                                      size: 10,
                                      fontWeight: FontWeight.w500,
                                      color: controller.selectedIndexThree == 0
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Gap(10),
                              GestureDetector(
                                onTap: () {
                                  if (controller.selectedIndexThree != 1) {
                                    controller.selectIndexThree(1);
                                  }
                                },
                                child: Container(
                                  height: 31,
                                  width: 103,
                                  decoration: BoxDecoration(
                                    color: controller.selectedIndexThree == 1
                                        ? AppColors.primary
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: AppColors.primary),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      title: 'Only services ',
                                      size: 10,
                                      fontWeight: FontWeight.w500,
                                      color: controller.selectedIndexThree == 1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                           GestureDetector(
                                onTap: () {
                                  if (controller.selectedIndexThree != 1) {
                                    controller.selectIndexThree(1);
                                  }
                                },
                                child: Container(
                                  height: 31,
                                  width: 103,
                                  decoration: BoxDecoration(
                                    color: controller.selectedIndexThree == 1
                                        ? AppColors.primary
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: AppColors.primary),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      title: 'Only services ',
                                      size: 10,
                                      fontWeight: FontWeight.w500,
                                      color: controller.selectedIndexThree == 1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
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
      ),
    );
  }
}
