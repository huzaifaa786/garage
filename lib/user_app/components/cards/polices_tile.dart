// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_rich_text.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class PoliciesTile extends StatelessWidget {
  const PoliciesTile(
      {super.key,
      this.content,
      this.title,
      this.isquestion = false,
      this.answer,
      this.question,
      this.questionqty,
      // this.appInfoModel
      });
  final title;
  final content;
  final isquestion;
  final question;
  final answer;
  final questionqty;
  // final AppInfoModel? appInfoModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              iconColor: AppColors.black,
              minTileHeight: Get.height * 0.1,
              title: AppText(
                title: title,
                size: 13,
                fontWeight: FontWeight.w600,
              ),
              children: [
                isquestion == false
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 20, right: 35),
                        child: Text(content),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 20, right: 35),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: questionqty,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  title:
                                      'Q.  How can i delete my account?',
                                  size: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                                Gap(5),
                                AuthRichText(
                                  title: 'A.   Conditions of use By using this app, you certify that you have read and reviewed this Agreement and that',
                                  description:
                                     answer,
                                  titlesize: 11,
                                  descriptiosize: 10,
                                  titlefontweight: FontWeight.w500,
                                  descriptionfontweight: FontWeight.w400,
                                ),
                                Gap(25),
                              ],
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
