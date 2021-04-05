import 'package:flutter/material.dart';
import 'package:quiz_app_test_task/pages/one_answer.dart';
import 'package:quiz_app_test_task/pages/result_page.dart';
import 'package:quiz_app_test_task/pages/truefalse_page.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData.dark(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/truefalse_page': (context) => TrueFalseQuizPage(),
        '/oneanswer_page': (context) => OneAnswerQuizPage(),
        '/result_page': (context) => ResultPage(),
      },
    );
  }
}
