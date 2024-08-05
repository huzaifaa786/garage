import 'package:flutter/material.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';

class TermsConditionQuestionAnswer extends StatelessWidget {
  final String question;
  final String answer;

  TermsConditionQuestionAnswer({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return 
    ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),

      title: AppText(
        title: question,
        size: 10,
        fontWeight: FontWeight.w500,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: AppText(
            title: answer,
            size: 8,
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(0.8),
            height: 1.5),
      ),
    );
  }
}
