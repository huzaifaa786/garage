import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.image,
    required this.ontap,
  });
  final String image;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        // height: 55,
        // width: 55,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(80),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            image,
            // 'assets/icons/local.svg',
            color: AppColors.primarybg,
            height: 20,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
