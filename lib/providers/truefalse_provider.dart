import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:quiz_app_test_task/models/truefalse_model.dart';

import 'package:http/http.dart' as http;

class TrueFalseProvider extends ChangeNotifier {
  List<TrueFalseQuizModel> workList = [];
  String url = 'https://demo0586388.mockable.io/truefalse';

  Future<List<TrueFalseQuizModel>> getData() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dynamic jsonData = json.decode(response.body);
      final List<dynamic> listMap = jsonData;
      return addToList(listMap);
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<TrueFalseQuizModel> addToList(List<dynamic> addList) {
    List<TrueFalseQuizModel> newList = [];
    newList = addList
        .map<TrueFalseQuizModel>((json) => TrueFalseQuizModel.fromJson(json))
        .toList();
    return newList;
  }
}
