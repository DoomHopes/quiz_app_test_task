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

  @override
  void initState() {
    super.initState();
    context.read<TrueFalseProvider>().getData();
    context.read<TrueFalseProvider>().score = 0;
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
                  ? Center(
                      child: Container(
                        height: 200,
                        width: 500,
                        child: Column(
                          children: <Widget>[
                            Text(
                              providerData.workList[_index].question,
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ElevatedButton(
                                  child: Text('True'),
                                  onPressed: () {
                                    providerData.checkAnswer(
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
                                ElevatedButton(
                                  child: Text('False'),
                                  onPressed: () {
                                    providerData.checkAnswer(
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
                        ),
                      ),
                    )
                  : ResultPage(providerData.score),
        ),
      ),
    );
  }
}
