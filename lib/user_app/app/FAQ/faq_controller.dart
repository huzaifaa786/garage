import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobilegarage/user_app/components/cards/terms_condition_listile.dart';

class FaqController extends GetxController {
  static FaqController instance = Get.find();
  

  final List<FaqQuestionAnswer> questionsAndAnswers = [
    FaqQuestionAnswer(
      question: 'How can I delete my account?',
      answer: 'Conditions of use By using this app, you certify that you have read and reviewed this Agreement and that ',
    ),
    
    FaqQuestionAnswer(
      question: 'How can I delete my account?',
      answer: 'Conditions of use By using this app, you certify that you have read and reviewed this Agreement and that ',
    ),
    FaqQuestionAnswer(
      question: 'How can I delete my account?',
      answer: 'Conditions of use By using this app, you certify that you have read and reviewed this Agreement and that',
    ),
    
  ];
 
  
}
