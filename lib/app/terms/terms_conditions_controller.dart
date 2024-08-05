import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobilegarage/components/cards/terms_condition_listile.dart';

class TermsConditionsController extends GetxController {
  static TermsConditionsController instance = Get.find();
  

  final List<TermsConditionQuestionAnswer> questionsAndAnswers = [
    TermsConditionQuestionAnswer(
      question: 'How can I delete my account?',
      answer: 'Conditions of use: By using this app, you certify that you have read and reviewed this Agreement and that you agree to comply with its terms.',
    ),
    TermsConditionQuestionAnswer(
      question: 'How to reset my password?',
      answer: 'To reset your password, go to the settings page and click on "Reset Password". Follow the instructions provided.',
    ),
    TermsConditionQuestionAnswer(
      question: 'How to contact support?',
      answer: 'You can contact support through the app by going to the "Help" section and clicking on "Contact Support".',
    ),
    
  ];
 
  
}
