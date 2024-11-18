  import 'package:flutter/material.dart';

  import 'package:get/get.dart';
  import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

  import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

  class ReviewBox extends StatelessWidget {
    const ReviewBox({
      super.key,
      this.icon,
      this.text,
      this.ontap,
      this.size = 24.0,
    });
    final icon;
    final text;
    final ontap;
    final double size;

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: InkWell(
          onTap: ontap,
          child: Container(
            height: 40,
            width: Get.width * 0.5,
            decoration: BoxDecoration(
              color: AppColors.light_red,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    icon,
                    height: size, 
                    width:size,
                  ),
                  AppText(
                    title: '  ' + text,
                    size: 10,
                    color: AppColors.primary_color,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
