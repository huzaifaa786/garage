import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';

class ProductRichText extends StatelessWidget {
  const ProductRichText({super.key, this.title, this.buttonText, this.onTap});
  final String? title;
  final String? buttonText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: '$title',
          style: GoogleFonts.inter(
              color: AppColors.black_color,
              fontSize: 13,
              fontWeight: FontWeight.w600),
          children: <TextSpan>[
            TextSpan(
                text: ' ' + '$buttonText',
                style: GoogleFonts.inter(
                    color: AppColors.hint_text_color,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()..onTap = onTap)
          ]),
    );
  }
}
