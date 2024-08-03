import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class AuthRichText extends StatelessWidget {
  const AuthRichText(
      {super.key,
      this.title,
      this.description,
      this.onTap,
      this.descriptiosize,
      this.titlesize,
      this.descriptionfontweight,
      this.descriptionColor,
      this.titlefontweight,
      this.titleColor});
  final String? title;
  final double? titlesize;
  final Color? titleColor;

  final double? descriptiosize;
  final String? description;
  final Function()? onTap;
  final FontWeight? titlefontweight;
  final FontWeight? descriptionfontweight;
  final Color? descriptionColor;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$title ',
        style: TextStyle(
            fontSize: titlesize,
            fontWeight: titlefontweight,
            color: titleColor,
            fontFamily: 'Inter'),
        children: <TextSpan>[
          TextSpan(text: ' '),
          TextSpan(
            text: '$description',
            style: TextStyle(
              fontSize: descriptiosize,
              fontWeight: descriptionfontweight,
              color: descriptionColor,
              fontFamily: 'Inter',
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
