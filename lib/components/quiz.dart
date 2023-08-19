import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestionIndex;
  final void Function(int) onAnswer;

  const Quiz({
    required this.questions,
    required this.selectedQuestionIndex,
    required this.onAnswer,
    super.key,
  });

  bool get isValidIndex {
    return selectedQuestionIndex < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        isValidIndex ? questions[selectedQuestionIndex].cast()['answers'] : [];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Question(
          questions[selectedQuestionIndex]["text"].toString(),
        ),
        ...answers.map((resp) {
          return Answer(
            resp['text'].toString(),
            () => onAnswer(int.parse(resp['score'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
