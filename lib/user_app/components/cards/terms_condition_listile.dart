import 'package:flutter/material.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';

class TermsConditionQuestionAnswer extends StatelessWidget {
  final String question;
  final String answer;

  TermsConditionQuestionAnswer({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title: 'Q. ',
                fontWeight: FontWeight.bold,
              ),
              
              Expanded(
                child: AppText(
                  title: question,
                  overFlow: TextOverflow.visible, 
                ),
              ),
            ],
          ),
          SizedBox(height: 8), // Adds some space between the question and answer
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title: 'A. ',
                fontWeight: FontWeight.bold,
              ),
              
              Expanded(
                child: AppText(
                  title: answer,
                  overFlow: TextOverflow.visible, 
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
