import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/search/search_controller.dart';
import 'package:mobilegarage/user_app/components/filter_bottomsheet/filter_bottomsheet_container.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class FilterBottomsheet extends StatelessWidget {
  FilterBottomsheet({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(
        builder: (controller) => Container(
            width: double.infinity,
            decoration: const BoxDecoration(
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
                      const Gap(40),
                      AppText(
                        title: 'Filter By'.tr,
                        size: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      const Divider(
                        color: AppColors.lightgrey,
                      ),
                      const Gap(10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                AppText(
                                  title: 'Sort'.tr,
                                  size: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            const Gap(15),
                            // if (path != 'search')
                            //   Row(
                            //     children: [
                            //       Container(
                            //         height: 5,
                            //         width: 5,
                            //         decoration: const BoxDecoration(
                            //           shape: BoxShape.circle,
                            //           color: AppColors.black,
                            //         ),
                            //       ),
                            //       const Gap(5),
                            //       AppText(
                            //         title: 'Price'.tr,
                            //         size: 13,
                            //         fontWeight: FontWeight.w500,
                            //       ),
                            //     ],
                            //   ),
                            // if (path != 'search')

                            // const Gap(10),
                            // if (path != 'search')

                            // Row(
                            //   children: [
                            //     FilterBottomsheetContainer(
                            //       text: 'From low to high'.tr,
                            //       index: 1,
                            //       group: 'price',
                            //     ),
                            //     const Gap(10),
                            //     FilterBottomsheetContainer(
                            //       text: 'From high to low'.tr,
                            //       index: 2,
                            //       group: 'price',
                            //     ),
                            //   ],
                            // ),
                            const Gap(15),
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
                                const Gap(5),
                                AppText(
                                  title: 'The closest'.tr,
                                  size: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                FilterBottomsheetContainer(
                                  text: 'From the closest to the furthest'.tr,
                                  index: 1,
                                  group: 'closest',
                                ),
                                const Gap(10),
                                FilterBottomsheetContainer(
                                  text: 'Random'.tr,
                                  index: 2,
                                  group: 'closest',
                                ),
                              ],
                            ),
                            const Gap(15),
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
                                const Gap(5),
                                AppText(
                                  title: 'Rating'.tr,
                                  size: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                FilterBottomsheetContainer(
                                  text: 'From high to low'.tr,
                                  index: 1,
                                  group: 'rating',
                                ),
                                const Gap(10),
                                FilterBottomsheetContainer(
                                  text: 'From low to high'.tr,
                                  index: 2,
                                  group: 'rating',
                                ),
                              ],
                            ),
                            // const Gap(11),
                            // const Divider(
                            //   color: AppColors.lightgrey,
                            // ),
                            // const Gap(11),
                            // const Row(
                            //   children: [
                            //     AppText(
                            //       title: 'Filter',
                            //       size: 14,
                            //       fontWeight: FontWeight.w600,
                            //     ),
                            //   ],
                            // ),
                            // const Gap(5),
                            // Row(
                            //   children: [
                            //     Container(
                            //       height: 5,
                            //       width: 5,
                            //       decoration: const BoxDecoration(
                            //         shape: BoxShape.circle,
                            //         color: AppColors.black,
                            //       ),
                            //     ),
                            //     const Gap(5),
                            //     const AppText(
                            //       title: 'Results',
                            //       size: 13,
                            //       fontWeight: FontWeight.w500,
                            //     ),
                            //   ],
                            // ),
                            // const Gap(5),
                            // Row(
                            //   children: [
                            //     FilterBottomsheetContainer(
                            //       // height: 31,
                            //       // width: 70,
                            //       text: 'All',
                            //       index: 0,
                            //       group: 'results',
                            //     ),
                            //     const Gap(10),
                            //     FilterBottomsheetContainer(
                            //       // height: 31,
                            //       // width: 103,
                            //       text: 'Garages',
                            //       index: 1,
                            //       group: 'results',
                            //     ),
                            //     const Gap(10),
                            //     FilterBottomsheetContainer(
                            //       // height: 31,
                            //       // width: 103,
                            //       text: 'Only services',
                            //       index: 2,
                            //       group: 'results',
                            //     ),
                            //   ],
                            // ),
                            // const Gap(10),
                            // Row(
                            //   children: [
                            //     FilterBottomsheetContainer(
                            //       // height: 31,
                            //       // width: 103,
                            //       text: 'Only products',
                            //       index: 3,
                            //       group: 'results',
                            //     ),
                            //   ],
                            // ),
                            const Gap(11),
                            const Divider(
                              color: AppColors.lightgrey,
                            ),
                            const Gap(11),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.ResetSelections();
                                    navigator!.pop(context);
                                  },
                                  child: Container(
                                    height: 46,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: AppColors.lightPink,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: AppText(
                                        title: 'Reset'.tr,
                                        size: 13,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                GestureDetector(
                                  onTap: () {
                                    controller.updateApplySelections();
                                    navigator!.pop(context);
                                  },
                                  child: Container(
                                    height: 46,
                                    width: 143,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: AppText(
                                        title: 'Apply'.tr,
                                        size: 13,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
