// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class ChartsCard extends StatelessWidget {
  const ChartsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(imageUrl: "https://dummyimage.com/61x61/000/fff"),
        Column(
          children: [
            AppText(
              title: "Street garage",
              color: AppColors.darkprimary,
              size: 14,
              fontWeight: FontWeight.w600,
            ),
            RichText(text: )
          ],
        )
      ],
    );
  }
}
