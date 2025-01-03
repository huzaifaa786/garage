import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_controller.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class OrderFilterContainer extends StatelessWidget {
  OrderFilterContainer({
    super.key,
    required this.text,
    required this.index,
    required this.group,
    // required this.height,
    // required this.width,
  });

  final String text;
  final int index;
  final String group;
  // final double height;
  // final double width;
  final FilterServiceController controller = Get.put(FilterServiceController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterServiceController>(
      init: controller,
      builder: (controller) {
        int selectedIndex;
        switch (group) {
          case 'price':
            selectedIndex = controller.selectedIndexPrice;
            break;
          case 'closest':
            selectedIndex = controller.selectedIndexClosest;
            break;
          case 'rating':
            selectedIndex = controller.selectedIndexRating;
            break;
          // case 'results':
          //   selectedIndex = controller.selectedIndexResults;
          //   break;
          default:
            selectedIndex = 0;
        }

        return GestureDetector(
          onTap: () {
            switch (group) {
              case 'price':
                controller.selectIndexPrice(index);
                break;
              case 'closest':
                controller.selectIndexClosest(index);
                break;
              case 'rating':
                controller.selectIndexRating(index);
                break;
              case 'results':
                controller.selectIndexResults(index);
                break;
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            // height: height,
            // width: width,
            decoration: BoxDecoration(
              color: selectedIndex == index ? AppColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.primary),
            ),
            child: Center(
              child: AppText(
                title: text,
                size: 10,
                fontWeight: FontWeight.w500,
                color: selectedIndex == index ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
