// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/order/order_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';
import 'package:mobilegarage/user_app/utils/ui_utils/ui_utils.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

int activeStep = 0;

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        autoRemove: false,
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
                      showgarageicon: false,
                      title: 'Find Service',
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(right: 5, left: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(30),
                        SizedBox(
                          width: Get.width,
                          child: StepperListView(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              showStepperInLast: true,
                              stepperData: controller.stepperData,
                              stepAvatar: (_, data) {
                                return PreferredSize(
                                    preferredSize: Size.fromRadius(5),
                                    child: Container(
                                      height: 4,
                                      width: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.primarybg,
                                      ),
                                    ));
                              },
                              stepContentWidget: (context, value) {
                                return value.content;
                              }),
                        ),
                        Gap(40),
                        MainButton(
                          title: 'Next',
                          onTap: () {
                            Get.toNamed(AppRoutes.acceptedorder);
                            UiUtilites.successAlertDialog(
                                context: context,
                                onTap: () {
                                  Get.toNamed(AppRoutes.home);
                                },
                                title: 'Thank you!',
                                description:
                                    'A garage will accept your order from within 3-5 min.');
                          },
                        ),
                        Gap(40),
                      ]),
                ),
              ),
            ));
  }
}
