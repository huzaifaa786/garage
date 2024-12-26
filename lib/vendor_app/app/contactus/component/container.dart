import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class ContactBox extends StatelessWidget {
  const ContactBox({super.key, this.icon, this.ontap});
  final icon;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
            shape: BoxShape.circle,
            color: AppColors.white_color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              icon,
              color: AppColors.primary_color,
            ),
          ),
        ),
      ),
    );
  }
}
