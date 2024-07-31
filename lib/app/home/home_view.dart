// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/home/components/home_appbar.dart';
import 'package:mobilegarage/app/home/components/view_all.dart';
import 'package:mobilegarage/components/textfields/icon_inputfield.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        toolbarHeight: 80,
        title: HomeAppbar(),

        // actions: [],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 42.0, right: 42.0),
        child: Column(
          children: [
            IconInputField(
              hasprefix: true,
              hint: 'Search for garages , service ..'.tr,
              readOnly: false,
              // ontap: () {
              //   Get.toNamed(AppRoutes.);
              // },
            ),
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title: 'What are you looking for?',
                  fontWeight: FontWeight.w600,
                  size: 16.0,
                ),
                ViewMore(
                  initialText: 'View more',
                  toggledText: 'View less',
                  showIcon: true,
                ),
              ],
            ),
             GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0, 
          mainAxisSpacing: 8.0, 
        ),
        itemCount: 10, 
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: CachedNetworkImage(
              imageUrl: 'https://dummyimage.com/70x70/000/0011ff?text=$index', // Example URL with index
              height: 70,
              width: 70,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          );
        },
      ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title: 'Car wash',
                  fontWeight: FontWeight.w600,
                  size: 16.0,
                ),
                ViewMore(
                  initialText: 'See all',
                  // toggledText: 'View less',
                  showIcon: false,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
