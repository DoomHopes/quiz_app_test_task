import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_test_task/pages/one_answer.dart';
import 'package:quiz_app_test_task/pages/truefalse_page.dart';

import 'pages/home_page.dart';
import 'providers/one_answer_provider.dart';
import 'providers/truefalse_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TrueFalseProvider>(
          create: (_) => TrueFalseProvider(),
        ),
        ChangeNotifierProvider<OneAnswerProvider>(
          create: (_) => OneAnswerProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Quiz App',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomePage(),
          '/truefalse_page': (context) => TrueFalseQuizPage(),
          '/oneanswer_page': (context) => OneAnswerQuizPage(),
        },
      ),
    );
  }
}
