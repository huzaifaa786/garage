// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          'assets/icons/home_logo.svg',
          height: 37,
          width: 143,
        ),
        Gap(45),
        Column(
          children: [
            Gap(10),
            Row(
              children: [
                SvgPicture.asset('assets/icons/bell.svg'),
                Gap(20),
                Image.asset(
                  'assets/images/chat.png',
                  height: 31,
                  width: 32,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
