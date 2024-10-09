import 'package:flutter/material.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';

class FaqQuestionAnswer extends StatelessWidget {
  final String question;
  final String answer;

  const FaqQuestionAnswer({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                title: 'Q. ',
                fontWeight: FontWeight.w500,
              ),
              Expanded(
                child: AppText(
                  title: question,
                  overFlow: TextOverflow.visible,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                title: 'A. ',
                fontWeight: FontWeight.w500,
              ),
              Expanded(
                child: AppText(
                  title: answer,
                  overFlow: TextOverflow.visible,
                  textAlign: TextAlign.justify,
                  size: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
