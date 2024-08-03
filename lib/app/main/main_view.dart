// ignore_for_file: non_constant_identifier_names, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/home/home_view.dart';
import 'package:mobilegarage/app/order/order_view.dart';
import 'package:mobilegarage/app/profile/account_view.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with RouteAware {
  int _bottom_index = 1;

  final List<Widget> _fragments = [
    const HomeView(),
    const OrderView(),
    const HomeView(),
    const AccountView(),
  ];
  Widget _BuildnavigationBarItem(
    int index,
    String iconPath,
    String iconPath1,
    String label,
  ) {
    return InkWell(
      onTap: () {
        setState(() {
          _bottom_index = index;
        });
      },
      child: Container(
        width: Get.width * 0.22,
        color: AppColors.white,
        child: Center(
          child: InkWell(
            onTap: () {
              setState(() {
                _bottom_index = index;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _bottom_index == index
                    ? SvgPicture.asset(
                        iconPath,
                      )
                    : SvgPicture.asset(
                        iconPath1,
                      ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
