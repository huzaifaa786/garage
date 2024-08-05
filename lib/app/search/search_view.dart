import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/search/components/search_card.dart';
import 'package:mobilegarage/app/search/search_controller.dart';
import 'package:mobilegarage/components/app_bar/top_bar.dart';
import 'package:mobilegarage/components/textfields/icon_inputfield.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';
import 'package:mobilegarage/utils/shadows/appbar_shadow.dart';
import 'package:mobilegarage/utils/ui_utils/ui_utils.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
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
                // Gap(20),
                // Row(
                //   children: [
                //     IconInputField(
                //       width: Get.width * 0.7,
                //       hasprefix: true,
                //       hint: 'Search for garages, service ..'.tr,
                //       readOnly: false,
                //       onChange: (value) {},
                //     ),
                //     Gap(15),
                //     Container(
                //       height: 40,
                //       width: 40,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(30),
                //           color: AppColors.lightprimary),
                //       child: Image.asset('assets/images/menu.png'),
                //     ),
                //   ],
                // ),
                Gap(15),
                Row(
                  children: [
                    AppText(
                      title: 'Results ',
                      size: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: controller.searchCards.length,
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = controller.searchCards[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 2.0),
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
