// ignore_for_file: prefer_typing_uninitialized_variables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_view.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class Locationn extends StatelessWidget {
  const Locationn({
    super.key,
    this.text,
  });
  final text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              color: AppColors.primary_color,
            ),
            Flexible(
              child: AppText(
                overFlow: TextOverflow.ellipsis,
                title: '  ' + text,
              ),
            ),
            SvgPicture.asset(
              box.read('locale') != 'ar'
                  ? "assets/icons/arrow_left.svg"
                  : 'assets/icons/arrow-right.svg',
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.white_color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
