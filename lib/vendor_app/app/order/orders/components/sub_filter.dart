import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/orders_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class SubFilterView extends StatelessWidget {
  const SubFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VOrdersController>(
      builder: (controller) => SizedBox(
        height: 40,
        child: Center(
          child: ListView.builder(
            itemCount: controller.subFilterList.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  controller.selectedSubIndex = index;
                  controller.update();
                },
                child: Container(
                  width: Get.width * 0.4,
                  decoration: BoxDecoration(
                      color: controller.selectedSubIndex == index
                          ? AppColors.primary_color
                          : AppColors.white_color,
                      borderRadius: BorderRadius.only(
                        bottomLeft: index == 0
                            ? Radius.circular(5)
                            : Radius.circular(0),
                        topLeft: index == 0
                            ? Radius.circular(5)
                            : Radius.circular(0),
                        bottomRight: index == 1
                            ? Radius.circular(5)
                            : Radius.circular(0),
                        topRight: index == 1
                            ? Radius.circular(5)
                            : Radius.circular(0),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          title: controller.subFilterList[index]['Name'],
                          size: 10,
                          fontWeight: FontWeight.w600,
                          color: controller.selectedSubIndex == index
                              ? AppColors.white_color
                              : AppColors.black_color,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
