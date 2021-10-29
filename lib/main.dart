// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your fav color?',
      'answers': [
        {'text': 'Red', 'score': 1},
        {'text': 'Blue', 'score': 2},
        {'text': 'Purple', 'score': 10},
        {'text': 'Black', 'score': 5},
      ],
    },
    {
      'questionText': 'What\'s your sign?',
      'answers': [
        {'text': 'Stop', 'score': 1},
        {'text': 'Yield', 'score': 5},
        {'text': 'No left turn', 'score': 5},
        {'text': 'Now hiring', 'score': 10},
      ],
    },
    {
      'questionText': 'What\'s your number?',
      'answers': [
        {'text': 'One', 'score': 2},
        {'text': 'Three', 'score': 2},
        {'text': 'Six', 'score': 2},
        {'text': 'Nine', 'score': 2},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
