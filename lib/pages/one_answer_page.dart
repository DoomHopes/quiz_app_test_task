import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_test_task/pages/result_page.dart';
import 'package:quiz_app_test_task/providers/one_answer_provider.dart';

class OneAnswerQuizPage extends StatefulWidget {
  @override
  _OneAnswerQuizPageState createState() => _OneAnswerQuizPageState();
}

class _OneAnswerQuizPageState extends State<OneAnswerQuizPage> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    context.read<OneAnswerProvider>().getData();
    context.read<OneAnswerProvider>().score = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('One Answer Quiz'),
      ),
      body: Consumer<OneAnswerProvider>(
        builder: (context, providerData, child) => Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          alignment: Alignment.bottomCenter,
          child: providerData.workList.isEmpty
              ? Center(
                  child: Text('Loading...'),
                )
              : _index < providerData.workList.length
                  ? Center(
                      child: Container(
                        height: 500,
                        width: 500,
                        child: Column(
                          children: <Widget>[
                            Text(
                              providerData.workList[_index].question,
                              style: TextStyle(fontSize: 20),
                            ),
                            Expanded(
                              child: ListView.separated(
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(),
                                padding: const EdgeInsets.all(8),
                                itemCount: providerData
                                    .workList[_index].answers.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ElevatedButton(
                                    child: Text(providerData
                                        .workList[_index].answers[index]),
                                    onPressed: () {
                                      providerData.checkAnswer(
                                          providerData
                                              .workList[_index].answers[index],
                                          providerData
                                              .workList[_index].rightAnswer);
                                      setState(() {
                                        _index++;
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
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
