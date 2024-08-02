// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/chats_accounts/Components/charts_card.dart';
import 'package:mobilegarage/app/chats_accounts/chats_accounts_controller.dart';
import 'package:mobilegarage/components/app_bar/icon_top_bar.dart';
import 'package:mobilegarage/components/app_bar/top_bar.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class ChatsAccountsView extends StatefulWidget {
  const ChatsAccountsView({super.key});

  @override
  State<ChatsAccountsView> createState() => _ChatsAccountsViewState();
}

class _ChatsAccountsViewState extends State<ChatsAccountsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatsAccountsController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: ChatTopBar(
                  title: "Chats",
                  showicon: true,
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
                  children: [

                    ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount:controller.item.length,
                        itemBuilder: (BuildContext context, int index) {
                           final item = controller.item[index];
                          return Container(
                              color: AppColors.grey.shade300,
                              child: ChartsCard(
                              item: item,

                              ));
                        })
                  ],
                )),
              ),
            ));
  }
}
