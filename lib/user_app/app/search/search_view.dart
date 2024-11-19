// SearchView.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/chat_screen/chat_screen_view.dart';
import 'package:mobilegarage/user_app/app/search/components/search_card.dart';
import 'package:mobilegarage/user_app/app/search/components/selected_fiter_card.dart';
import 'package:mobilegarage/user_app/app/search/search_controller.dart';
import 'package:mobilegarage/user_app/components/textfields/icon_inputfield.dart';
import 'package:mobilegarage/user_app/components/filter_bottomsheet/filter_bottomsheet.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';
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
      builder: (controller) => AppLayout(
        hasBgColor: false,
        hasShadow: true,
        appBarTitle: 'Search'.tr,
        child: GestureDetector(
           onTap: () {
        // Dismiss the keyboard when tapping anywhere outside the input
        FocusScope.of(context).unfocus();
      },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Gap(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: IconInputField(
                          controller: controller.searchController,
                          hasprefix: true,
                          hint: 'street,garages'.tr,
                          readOnly: false,
                          onChange: (text) {
                            // controller.filterPosts(query: text, category: text);
                          },
                          onsubmit: (value) {
                           controller. getsearchGarages();
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
                  Gap(10),
                  Row(
                    children: [
                      if (controller.selecetedPrice != '')
                        SelectedFilterCard(
                            onCancel: () {
                              controller.selecetedPrice = '';
                              controller.selectIndexPrice(0);
                              controller.update();
                            },
                            controller: controller,
                            text: controller.selecetedPrice),
                    ],
                  ),
                  Gap(5),
                  Row(
                    children: [
                      if (controller.selecetedPlace != '')
                        SelectedFilterCard(
                            onCancel: () {
                              controller.selecetedPlace = '';
                              controller.selectIndexClosest(0);
                              controller.update();
                            },
                            controller: controller,
                            text: controller.selecetedPlace),
                    ],
                  ),
                  Gap(5),
                  if (controller.selecetedRating != '')
                    Row(
                      children: [
                        SelectedFilterCard(
                            onCancel: () {
                              controller.selecetedRating = '';
                              controller.selectIndexRating(0);
                              controller.update();
                            },
                            controller: controller,
                            text: controller.selecetedRating),
                      ],
                    ),
                  Gap(25),
                  if (controller.filteredGarages.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          AppText(
                            title: 'Results'.tr,
                            size: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  Gap(10),
                  controller.filteredGarages.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.filteredGarages.length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = controller.filteredGarages[index];
                            return Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: SearchCard(
                                image: item.banner,
                                title: item.name,
                                logoimage: item.logo,
                                currentAddress:
                                    controller.currentAddress.toString(),
                                    onChatTap: () {
                                      Get.to(() => ChatScreenView(
                                            id: item.id.toString(),
                                            name:item.name.toString(),
                                            profilePic: '',
                                            screen: 'chat'));
                                    },
                                onTap: () {
                                  Get.toNamed(AppRoutes.garage,
                                      parameters: {'id': item.id.toString()});
                                },
                                rating: item.rating.toString(),
                                price: '',
                                services: "${item.servicecount} ${"services".tr}",
                                onTapViewGarage: () {
                                  Get.toNamed(AppRoutes.garage, parameters: {
                                    'id': controller.filteredGarages[index].id
                                        .toString(),
                                  });
                                },
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
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greybg),
                            ),
                          ),
                        ),
                  Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
