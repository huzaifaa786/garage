// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/my_cars/my_cars_controllers.dart';
import 'package:mobilegarage/components/app_bar/top_bar.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';
import 'package:mobilegarage/utils/shadows/appbar_shadow.dart';

class MyCarsView extends StatefulWidget {
  const MyCarsView({super.key});

  @override
  State<MyCarsView> createState() => _MyCarsViewState();
}

class _MyCarsViewState extends State<MyCarsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCarsControllers>(
        builder: (controllers) => Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(95.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [appbarShadow],
                    ),
                    child: AppBar(
                      automaticallyImplyLeading: false,
                      scrolledUnderElevation: 0.0,
                      toolbarHeight: 95.0,
                      title: TopBar(
                        showicon: true,
                        title: "My Cars",
                      ),
                    ),
                  )),
              body: Column(
                children: [
                  Gap(47),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/cars.svg",
                        height: 17,
                        width: 17,
                      ),
                      Gap(6),
                      Text(
                        "Marked as default",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                      Gap(7),
                      Text(
                        "white Mercedes 2022",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
