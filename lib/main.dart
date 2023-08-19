import 'package:flutter/material.dart';
import 'components/quiz.dart';
import 'components/result.dart';
import '../utils/questions.dart';

void main() => runApp(const QuestionApp());

class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  @override
  QuestionAppState createState() => QuestionAppState();
}

class QuestionAppState extends State<QuestionApp> {
  var _selectedQuestionIndex = 0;
  var _totalScore = 0;

  void _answer(int score) {
    if (isValidIndex) {
      setState(() {
        _selectedQuestionIndex++;
        _totalScore += score;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedQuestionIndex = 0;
      _totalScore = 0;
    });
  }

  bool get isValidIndex {
    return _selectedQuestionIndex < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Questions'),
        ),
        body: isValidIndex
            ? Quiz(
                questions: questions,
                selectedQuestionIndex: _selectedQuestionIndex,
                onAnswer: _answer,
              )
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}
