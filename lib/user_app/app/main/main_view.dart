// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/home/home_controller.dart';
import 'package:mobilegarage/user_app/app/home/home_view.dart';

import 'package:mobilegarage/user_app/app/order/order_view.dart';
import 'package:mobilegarage/user_app/app/profile/account_view.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with RouteAware {
  int _bottom_index = 0;

  final List<Widget> _fragments = [
    const HomeView(),
    Container(),
    const OrderView(),
    const AccountView(),
  ];

  Widget _BuildnavigationBarItem(
    int index,
    String iconPath,
    String iconPath1,
    String label,
  ) {
    return InkWell(
      onTap: index == 1
          ? () {}
          : () {
              setState(() {
                _bottom_index = index;
              });
            },
      child: Container(
        // width: Get.width * 0.22,
        color: AppColors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                index == 1
                    ? ""
                    : _bottom_index == index
                        ? iconPath
                        : iconPath1,
                // height: 15,
                // width: 15,
              ),
              Text(
                label,
                style: TextStyle(
                  color: index == 1
                      ? Colors.transparent
                      : _bottom_index == index
                          ? AppColors.red.shade900
                          : AppColors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _BuildnavigationB() {
    return Container(
      margin: EdgeInsets.only(top: 34),
      height: 7,
      width: 7,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: GetBuilder<HomeController>(
        autoRemove: false,
        builder: (controller) {
          return Scaffold(
            extendBody: true,
            body: SafeArea(
              child: _fragments[_bottom_index],
            ),
            floatingActionButton: FloatingActionButton(
              shape: CircleBorder(),
              onPressed: () {},
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: BottomAppBar(
                shape: CircularNotchedRectangle(),
                height: Get.height * 0.1 / 1.2,
                shadowColor: AppColors.black,
                notchMargin: 5,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _BuildnavigationBarItem(
                      0,
                      "assets/icons/redHome.svg",
                      "assets/icons/home.svg",
                      'Home',
                    ),
                    _BuildnavigationBarItem(
                      1,
                      "",
                      "",
                      'Home',
                    ),
                    _BuildnavigationB(),
                    _BuildnavigationBarItem(
                      2,
                      "assets/icons/redCart.svg",
                      "assets/icons/cart.svg",
                      'Carts',
                    ),
                    _BuildnavigationBarItem(
                      3,
                      "assets/icons/redUser.svg",
                      "assets/icons/user.svg",
                      'Profile',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
