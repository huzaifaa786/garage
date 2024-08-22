import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/search_result/components/radioButton.dart';
import 'package:mobilegarage/user_app/app/search_result/searchResult_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';

class SearchresultView extends StatefulWidget {
  const SearchresultView({super.key});
  

  @override
  State<SearchresultView> createState() => _SearchresultViewState();
}

class _SearchresultViewState extends State<SearchresultView> {
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchResultController>(
      builder: (controller) => Scaffold(
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
              title: TopBar(title: 'Date & Time'),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(30),
                  Row(
                    children: [
                      Gap(20),
                      SvgPicture.asset('assets/icons/clock.svg'),
                      Gap(10),
                      Text('Delivery Time'),
                    ],
                  ),
                  RadioButton1(
                    value: 1,
                    text: "Quick Service",   ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
