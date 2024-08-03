import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/home/home_controller.dart';
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
  int _bottom_index = 0;

  final List<Widget> _fragments = [
    const HomeView(),
    const OrderView(),
    const HomeView(),
    // const AccountView(),
  ];

  Widget _BuildnavigationBarItem(
    int index,
    String iconPath,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                color: _bottom_index == index
                    ? AppColors.darkprimary
                    : AppColors.black,
              ),
              Text(
                label,
                style: TextStyle(
                  color: _bottom_index == index
                      ? AppColors.darkprimary
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: GetBuilder<HomeController>(
        autoRemove: false,
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: _fragments[_bottom_index],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Action for the central button
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endContained,
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 6.0,
              child: Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _BuildnavigationBarItem(
                      0,
                      "assets/icons/home.svg",
                      'Home',
                    ),
                    _BuildnavigationBarItem(
                      1,
                      "assets/icons/cart.svg",
                      'Orders',
                    ),
                    SizedBox(width: 40), // Space for the FAB
                    _BuildnavigationBarItem(
                      2,
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
