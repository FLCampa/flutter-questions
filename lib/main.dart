import 'package:flutter/material.dart';
import './question.dart';
import 'answer.dart';

void main() => runApp(QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestionIndex = 0;

  void _answer() {
    setState(() {
      _selectedQuestionIndex++;
    });

    // ignore: avoid_print
    print(_selectedQuestionIndex);
  }

  //metodo build depende do estado
  @override
  Widget build(BuildContext context) {
    final List<String> questions = [
      "What's your favorite color?",
      "What's your favorite animal?",
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Questions'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Question(questions[_selectedQuestionIndex]),
            Answer('Answer 1', _answer),
            Answer('Answer 2', _answer),
            Answer('Answer 3', _answer),
          ],
        ),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  QuestionApp({super.key});

  @override
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}
