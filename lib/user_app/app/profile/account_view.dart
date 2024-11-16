import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/user_app/app/profile/account_controller.dart';
import 'package:mobilegarage/user_app/app/order_history/order_history_controller.dart'; // Import OrderHistoryController
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/buttons/logout_button.dart';
import 'package:mobilegarage/user_app/components/cards/all_profile_card.dart';
import 'package:mobilegarage/user_app/components/cards/profile_card.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return GetBuilder<AccountController>(
      autoRemove: false,
      initState: (state) {
        Future.delayed(Duration(milliseconds: 100), () {
          state.controller!.userdata();
        });
      },
      builder: (controller) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: Container(
              decoration: const BoxDecoration(),
              child: AppBar(
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0.0,
                toolbarHeight: 95.0,
                title: TopBar(
                  showgarageicon: false,
                  showicon: false,
                  title: "Profile".tr,
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
                                Get.toNamed(AppRoutes.editprofile, parameters: {
                                  'image': controller.user!.image.toString(),
                                  'userName': controller.user!.name.toString(),
                                  'userNumber':
                                      controller.user!.phone.toString(),
                                  'userEmail':
                                      controller.user!.email.toString(),
                                })!
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
                                text2:
                                    controller.user!.addressDetail.toString(),
                                ontap: () {
                                  Get.toNamed(AppRoutes.my_location)!.then(
                                    (value) {
                                      controller.userdata();
                                    },
                                  );
                                }),
                            const Gap(15),
                            AllProfileCard(
                                height: Get.height * 0.08,
                                width: Get.width * 0.8,
                                color: AppColors.lightPink,
                                text: 'My cars'.tr,
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
                                text: 'Language'.tr,
                                textColor: AppColors.black,
                                image: 'assets/icons/language.svg',
                                text2: 'English'.tr,
                                ontap: () {
                                  Get.toNamed(AppRoutes.language);
                                }),
                            const Gap(15),
                            AllProfileCard(
                              color: AppColors.lightPink,
                              text: 'Settings'.tr,
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
                            GetBuilder<OrderHistoryController>(
                              init: OrderHistoryController(),
                              builder: (orderController) {
                                return AllProfileCard(
                                  color: AppColors.lightPink,
                                  height: Get.height * 0.08,
                                  width: Get.width * 0.8,
                                  text: 'Orders history'.tr,
                                  textColor: AppColors.black,
                                  image: 'assets/icons/order.svg',
                                  text2:
                                      "${orderController.orders?.length ?? 0} ${"items".tr}",
                                  ontap: () {
                                    Get.toNamed(AppRoutes.order_history);
                                  },
                                );
                              },
                            ),
                            const Gap(30),
                            LogoutButton(
                              image: box.read('locale') != 'ar'
                                  ? 'assets/icons/log-out.svg'
                                  : 'assets/icons/log_outleft.svg',
                              title: 'Log out'.tr,
                              buttonWidth: Get.width * 0.77,
                              height: Get.height * 0.07,
                              onTap: () {
                                UiUtilites.showConfirmationDialog(
                                  false,
                                  'Are you Sure that you want\n to log out ?'
                                      .tr,
                                  onConfirm: () async {
                                    GetStorage box = GetStorage();
                                    await box.remove('api_token');
                                    await box.remove('user_type');
                                    Get.offAllNamed(AppRoutes.selectside);
                                  },
                                );
                              },
                            ),
                            const Gap(25),
                          ],
                        ),
                      ),
                    )
                  : Text('')),
        );
      },
    );
  }
}
