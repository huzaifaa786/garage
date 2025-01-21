import 'package:flutter/material.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class InputfiledTitle extends StatelessWidget {
  const InputfiledTitle({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          AppText(
            title: '$title',
            size: 13,
            color: AppColors.hint_text_color,
          ),
        ],
      ),
    );
  }
}
