// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobilegarage/user_app/app/search/components/search_card.dart';
import 'package:mobilegarage/user_app/app/search/search_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/cards/bottomsheet_container.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';
import 'package:mobilegarage/user_app/utils/ui_utils/ui_utils.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  //   int _selectedIndex = -1;

  // void _onContainerTap(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(
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
              title: TopBar(
                showicon: true,
                title: 'Search',
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Gap(15),
                Row(
                  children: [
                    Gap(5),
                    AppText(
                      title: 'Results',
                      size: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: controller.searchCards.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = controller.searchCards[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SearchCard(
                        image: item.image,
                        title: item.title,
                        logoimage: 'https://dummyimage.com/70x70/d9c3d9/00000a',
                        onTap: () {
                          UiUtilites.SuccessAlert(context);
                        },
                        price: item.price,
                        services: '14 services',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }


}