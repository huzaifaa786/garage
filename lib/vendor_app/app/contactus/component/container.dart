import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';

class ContactBox extends StatelessWidget {
  const ContactBox({
    super.key,
    this.icon,
  });
  final icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 60,
        width: 60,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SvgPicture.asset(
            icon,
            color: AppColors.primary_color,
          ),
        ),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(40.0),
            color: AppColors.white_color),
      ),
    );
  }
}
