import 'package:flutter/material.dart';

// Define a QuestionAnswer class to hold question and answer data
class QuestionAnswer {
  final String question;
  final String answer;

  QuestionAnswer({
    required this.question,
    required this.answer,
  });
}

// Create a reusable QuestionAnswerTile widget
class QuestionAnswerTile extends StatelessWidget {
  final QuestionAnswer questionAnswer;

  QuestionAnswerTile({
    required this.questionAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      title: Text(
        'Q. ${questionAnswer.question}',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 10.0,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          'A. ${questionAnswer.answer}',
          style: TextStyle(
          fontWeight: FontWeight.w400,
            fontSize: 8.0,
            color: Colors.black.withOpacity(0.8),
            height: 1.5, // Add line spacing if needed
          ),
        ),
      ),
    );
  }
}
