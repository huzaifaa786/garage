// ignore_for_file: prefer_typing_uninitialized_variables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
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
                title: '  '+text,
              ),
            ),
            SvgPicture.asset('assets/images/arrow.svg')
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
