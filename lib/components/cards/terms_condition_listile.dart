import 'package:flutter/material.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';

class FaqQuestionAnswer extends StatelessWidget {
  final String question;
  final String answer;

  FaqQuestionAnswer({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 20),

       padding:  EdgeInsets.symmetric(vertical: 16.0),
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
                  size: 10,
                  fontWeight: FontWeight.w500,
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
                  size: 8,
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
