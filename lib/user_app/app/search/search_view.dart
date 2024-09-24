// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/home/components/service_cards.dart';
import 'package:mobilegarage/user_app/app/search/components/search_card.dart';
import 'package:mobilegarage/user_app/app/search/search_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/cards/bottomsheet_container.dart';

import 'package:mobilegarage/user_app/components/textfields/icon_inputfield.dart';
import 'package:mobilegarage/user_app/components/filter_bottomsheet/filter_bottomsheet.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';
import 'package:mobilegarage/user_app/utils/ui_utils/ui_utils.dart';
import 'package:mobilegarage/vendor_app/utils/text_style.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(.0),
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
                showgarageicon: false,
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: IconInputField(
                        hasprefix: true,
                        hint: 'street,garages'.tr,
                        readOnly: false,
                        onChange: (text) {
                           controller.filterPosts(
                                query: text,
                                category:
                                    text);
                          Get.toNamed(AppRoutes.search);
                        },
                      ),
                    ),
                    Gap(20),
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(FilterBottomsheet(),
                            isScrollControlled: true);
                      },
                      child: Container(
                        height: 36,
                        width: 36,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.lightPink,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: SvgPicture.asset("assets/icons/filter.svg"),
                      ),
                    ),
                  ],
                ),
                Gap(25),
                Align(
                  alignment: Alignment.topLeft,
                  child: AppText(
                    title: 'Results',
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                controller.filteredPosts.isNotEmpty?
                ListView.builder(
                  itemCount: controller.filteredPosts.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = controller.filteredPosts[index];
                    return Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: SearchCard(
                        image: item.banner,
                        title: item.name,
                        logoimage:item.logo,
                        //  'https://dummyimage.com/70x70/d9c3d9/00000a'
                        onTap: () {
                          UiUtilites.SuccessAlert(context);
                        },
                        price: '',
                        services: controller.filteredPosts.length.toString()+ " services",
                        // '14 services'
                      ),
                    );
                  },
                )
                : SizedBox(
                                height: Get.height * 0.6,
                                child: Center(
                                  child: Text(
                                    "No result found!".tr,
                                    style: TextStyles.customTextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.darkblue),
                                  ),
                                ),
                              ),
                Gap(20),
                GridView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 24,
                        childAspectRatio: 0.82),
                    itemBuilder: (context, index) {
                      return ServiceCard(
                          image: "https://dummyimage.com/90x90/d9c3d9/00000a",
                          // image:    " https://dummyimage.com/132x99/000/fff",
                          time: "30 min",
                          title: "1223",
                          onTap: () {},
                          price: "222");
                    }),
                Gap(20),
              ],
            ),
          ),
        )),
      ),
    );
  }

  void settingModalBottomSheet(context, SearchScreenController controller) {
    showModalBottomSheet(
        backgroundColor: AppColors.white,
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 50),
            decoration: BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.2),
                //     spreadRadius: 1,
                //     blurRadius: 5,
                //     offset: Offset(1, -2), // changes position of shadow
                //   ),
                // ],
                ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Filter By',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Gap(5),
                Divider(
                  color: AppColors.grey.withOpacity(0.2),
                  thickness: 1,
                ),
                Gap(2),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          AppText(
                            title: 'Sort',
                            size: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Gap(5),
                      Row(
                        children: [
                          Container(
                            height: 5,
                            width: 5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.black,
                            ),
                          ),
                          Gap(5),
                          AppText(
                            title: 'Price',
                            size: 12,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                      Gap(10),
                      Row(
                        children: [
                          BottomsheetContainer(),
                          Gap(5),
                          BottomsheetContainer(),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
