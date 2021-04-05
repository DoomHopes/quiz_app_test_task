import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int _score;

  ResultPage(this._score);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Text('As a result of passing the quiz, you received $_score points'),
    );
  }
}
