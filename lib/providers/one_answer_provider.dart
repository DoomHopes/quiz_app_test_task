import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:quiz_app_test_task/models/oneanswer_model.dart';

class OneAnswerProvider extends ChangeNotifier {
  List<OneAnswerQuizModel> workList = [];
  String url = 'https://demo0586388.mockable.io/oneanswer';

  void getData() async {
    workList = await getDataFromJson();
    notifyListeners();
  }

  Future<List<OneAnswerQuizModel>> getDataFromJson() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dynamic jsonData = json.decode(response.body);
      final List<dynamic> listMap = jsonData;
      return addToList(listMap);
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<OneAnswerQuizModel> addToList(List<dynamic> addList) {
    List<OneAnswerQuizModel> newList = [];
    newList = addList
        .map<OneAnswerQuizModel>((json) => OneAnswerQuizModel.fromJson(json))
        .toList();
    return newList;
  }
}
