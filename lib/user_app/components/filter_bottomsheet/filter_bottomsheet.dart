import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/components/filter_bottomsheet/filter_bottomsheet_container.dart';
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
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            ),
                          ],
                        ),
                        Gap(5),
                        Row(
                          children: [
                            FilterBottomsheetContainer(
                              height: 31,
                              width: 103,
                              text: 'From low to high',
                              index: 0,
                              group: 'price',
                            ),
                            Gap(10),
                            FilterBottomsheetContainer(
                              height: 31,
                              width: 103,
                              text: 'From high to low',
                              index: 1,
                              group: 'price',
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
                              title: 'The closest',
                              size: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Gap(5),
                        Row(
                          children: [
                            FilterBottomsheetContainer(
                              height: 31,
                              width: 190,
                              text: 'From the closest to the furthest',
                              index: 0,
                              group: 'closest',
                            ),
                            Gap(10),
                            FilterBottomsheetContainer(
                              height: 31,
                              width: 103,
                              text: 'Random',
                              index: 1,
                              group: 'closest',
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
                            ),
                          ],
                        ),
                        Gap(5),
                        Row(
                          children: [
                            FilterBottomsheetContainer(
                              height: 31,
                              width: 103,
                              text: 'From high to low',
                              index: 0,
                              group: 'rating',
                            ),
                            Gap(10),
                            FilterBottomsheetContainer(
                              height: 31,
                              width: 103,
                              text: 'From low to high',
                              index: 1,
                              group: 'rating',
                            ),
                          ],
                        ),
                        Gap(11),
                        Divider(
                          color: AppColors.lightgrey,
                        ),
                        Gap(11),
                        Row(
                          children: [
                            AppText(
                              title: 'Filter',
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
                              title: 'Results',
                              size: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Gap(5),
                        Row(
                          children: [
                            FilterBottomsheetContainer(
                              height: 31,
                              width: 70,
                              text: 'All',
                              index: 0,
                              group: 'results',
                            ),
                            Gap(10),
                            FilterBottomsheetContainer(
                              height: 31,
                              width: 103,
                              text: 'Garages',
                              index: 1,
                              group: 'results',
                            ),
                            Gap(10),
                            FilterBottomsheetContainer(
                              height: 31,
                              width: 103,
                              text: 'Only services',
                              index: 2,
                              group: 'results',
                            ),
                          ],
                        ),
                        Gap(10),
                        FilterBottomsheetContainer(
                          height: 31,
                          width: 103,
                          text: 'Only products',
                          index: 3,
                          group: 'results',
                        ),
                        Gap(11),
                        Divider(
                          color: AppColors.lightgrey,
                        ),
                        Gap(11),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 46,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: AppColors.lightPink,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: AppText(
                                    title: 'Reset',
                                    size: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                            Gap(10),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 46,
                                width: 143,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: AppText(
                                    title: 'Apply',
                                    size: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
