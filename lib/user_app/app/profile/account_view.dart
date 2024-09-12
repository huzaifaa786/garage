import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/user_app/app/profile/account_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/buttons/logout_button.dart';
import 'package:mobilegarage/user_app/components/cards/all_profile_card.dart';
import 'package:mobilegarage/user_app/components/cards/profile_card.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/ui_utils/ui_utils.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      autoRemove: false,
      initState: (state) {
        Future.delayed(Duration(milliseconds: 100), () {
          state.controller!.userdata();
        });
      },
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Container(
            decoration: const BoxDecoration(
                // boxShadow: [appbarShadow],
                ),
            child: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0.0,
              toolbarHeight: 95.0,
              title: const TopBar(
                showgarageicon: false,
                showicon: true,
                title: "Profile",
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.grey.withOpacity(0.1),
        body: SafeArea(
            child: controller.user != null
                ? Container(
                    padding: const EdgeInsets.only(
                      left: 44,
                      right: 44,
                      top: 30,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ProfileCard(
                            userName: controller.user!.name.toString(),
                            userphone: controller.user!.phone.toString(),
                            image: controller.user!.image.toString(),
                            ontap: () {
                              Get.toNamed(
                                AppRoutes.editprofile,
                                arguments: {
                                  'image': controller.user!.image != null
                                      ? controller.user!.image.toString()
                                      : 'https://dummyimage.com/60x60/ede4ed/fff',
                                  'userName': controller.user!.name,
                                  'userNumber': controller.user!.phone,
                                  'userEmail': controller.user!.email,
                                },
                              )!
                                  .then(
                                (value) {
                                  controller.userdata();
                                },
                              );
                            },
                          ),
                          const Gap(23),
                          AllProfileCard(
                              height: Get.height * 0.08,
                              width: Get.width * 0.8,
                              color: AppColors.lightPink,
                              text: controller.user!.emirate.toString(),
                              textColor: AppColors.black,
                              image: 'assets/icons/map_pin.svg',
                              text2: controller.user!.addressDetail.toString(),
                              ontap: () {
                                Get.toNamed(AppRoutes.my_location)!.then((value) {
                                  controller.userdata();
                                },);
                              }),
                          const Gap(15),
                          AllProfileCard(
                              height: Get.height * 0.08,
                              width: Get.width * 0.8,
                              color: AppColors.lightPink,
                              text: 'My cars',
                              textColor: AppColors.black,
                              image: 'assets/icons/car.svg',
                              text2: '',
                              ontap: () {
                                Get.toNamed(AppRoutes.my_cars);
                              }),

                          const Gap(15),
                          AllProfileCard(
                              height: Get.height * 0.08,
                              width: Get.width * 0.8,
                              color: AppColors.lightPink,
                              text: 'Language',
                              textColor: AppColors.black,
                              image: 'assets/icons/language.svg',
                              text2: 'English',
                              ontap: () {
                                Get.toNamed(AppRoutes.language);
                              }),
                          const Gap(15),
                          AllProfileCard(
                            color: AppColors.lightPink,
                            text: 'Settings',
                            textColor: AppColors.black,
                            image: 'assets/icons/setting.svg',
                            ontap: () {
                              Get.toNamed(AppRoutes.setting);
                            },
                            text2: '',
                            height: Get.height * 0.08,
                            width: Get.width * 0.8,
                          ),
                          const Gap(15),
                          AllProfileCard(
                              color: AppColors.lightPink,
                              height: Get.height * 0.08,
                              width: Get.width * 0.8,
                              text: 'Orders history',
                              textColor: AppColors.black,
                              image: 'assets/icons/order.svg',
                              text2: '12 items',
                              ontap: () {
                                Get.toNamed(AppRoutes.order_history);
                              }),
                          // EmailProfileCard(
                          //     height: Get.height * 0.08,
                          //     width: Get.width * 0.8,
                          //     text: 'Contact us',
                          //     image: 'assets/icons/mail.svg',
                          //     text2: 'mobilegarage1@gmail.com',
                          //     ontap: () {}),
                          const Gap(30),
                          LogoutButton(
                            image: 'assets/icons/log-out.svg',
                            title: 'Log out',
                            buttonWidth: Get.width * 0.77,
                            height: Get.height * 0.07,
                            onTap: () {
                              UiUtilites.logoutSuccessAlert(context, () async {
                                GetStorage box = GetStorage();
                                await box.remove('api_token');
                                await box.remove('user_type');
                                Get.toNamed(AppRoutes.selectside);
                              }, () {});
                            },
                          ),
                          const Gap(25),
                        ],
                      ),
                    ),
                  )
                : Text('')),
      ),
    );
  }
}
