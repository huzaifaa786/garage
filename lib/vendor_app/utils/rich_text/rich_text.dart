import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({super.key, this.title, this.buttonText, this.onTap});
  final String? title;
  final String? buttonText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: '$title',
          style: GoogleFonts.inter(
              color: AppColors.hint_text_color,
              fontSize: 12,
              fontWeight: FontWeight.w500),
          children: <TextSpan>[
            TextSpan(
                text: ' ' '$buttonText',
                style: GoogleFonts.inter(
                    color: AppColors.primary_color,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
                recognizer: TapGestureRecognizer()..onTap = onTap)
          ]),
    );
  }
}
