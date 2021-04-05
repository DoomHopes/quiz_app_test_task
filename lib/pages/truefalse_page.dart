import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_test_task/providers/truefalse_provider.dart';

class TrueFalseQuizPage extends StatefulWidget {
  @override
  _TrueFalseQuizPageState createState() => _TrueFalseQuizPageState();
}

class _TrueFalseQuizPageState extends State<TrueFalseQuizPage> {
  @override
  void initState() {
    context.read<TrueFalseProvider>().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('True or False Quiz'),
      ),
      body: Consumer<TrueFalseProvider>(
        builder: (context, providerData, child) => ListView.builder(
          itemCount: providerData.workList.length,
          itemBuilder: (context, index) {
            return Text(providerData.workList[index].question);
          },
        ),
      ),
    );
  }
}
