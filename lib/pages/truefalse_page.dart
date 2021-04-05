import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_test_task/pages/result_page.dart';
import 'package:quiz_app_test_task/providers/truefalse_provider.dart';

class TrueFalseQuizPage extends StatefulWidget {
  @override
  _TrueFalseQuizPageState createState() => _TrueFalseQuizPageState();
}

class _TrueFalseQuizPageState extends State<TrueFalseQuizPage> {
  int _index = 0;
  int _score = 0;

  @override
  void initState() {
    context.read<TrueFalseProvider>().getData();
    super.initState();
  }

  void _checkAnswer(bool answer, bool rightAnwer) {
    if (answer == rightAnwer) {
      setState(() {
        _score++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('True or False Quiz'),
      ),
      body: Consumer<TrueFalseProvider>(
        builder: (context, providerData, child) => Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            alignment: Alignment.bottomCenter,
            child: providerData.workList.isEmpty
                ? Center(
                    child: Text('Loading ....'),
                  )
                : _index < providerData.workList.length
                    ? Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              providerData.workList[_index].question,
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                child: Text('True'),
                                onPressed: () {
                                  _checkAnswer(
                                      true,
                                      providerData
                                          .workList[_index].rightAnswer);
                                  setState(() {
                                    _index++;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              RaisedButton(
                                child: Text('False'),
                                onPressed: () {
                                  _checkAnswer(
                                      false,
                                      providerData
                                          .workList[_index].rightAnswer);
                                  setState(() {
                                    _index++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      )
                    : ResultPage(_score)),
      ),
    );
  }
}
