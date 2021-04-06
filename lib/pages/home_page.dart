import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Container(
          width: 500,
          height: 200,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ElevatedButton(
                child: Text('True False Quiz'),
                onPressed: () {
                  Navigator.pushNamed(context, '/truefalse_page');
                },
              ),
              ElevatedButton(
                child: Text('One Answer Quiz'),
                onPressed: () {
                  Navigator.pushNamed(context, '/oneanswer_page');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
