import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/components/cards/all_profile_card.dart';
import 'package:mobilegarage/components/cards/profile_card.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 44, right: 44, top: 56),
          child: Column(
            children: [
              ProfileCard(userName: 'User38498990', userNumber: '+971 0000 0000'),
              Gap(23),
              AllProfileCard(userName: 'User38498990', userNumber: '+971 0000 0000'),
            ],
          ),
        ),
      ),
    );
  }
}
