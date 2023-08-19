import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() onRestartQuiz;

  const Result(this.score, this.onRestartQuiz, {super.key});

  String get resultSentence {
    if (score < 8) {
      return 'Poor';
    } else if (score < 12) {
      return 'Medium';
    } else if (score < 16) {
      return 'Good';
    } else {
      return 'Excellent';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultSentence,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: onRestartQuiz,
          child: const Text(
            'Restart?',
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}
