import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:zzang_gu_mbti/domain/models/models.dart';

class QuestionMockService {
  late final QuestionListModel _questionListModel;

  void loadQuestion() async {
    final jsonStr = await rootBundle.loadString('asset/data/test.json');
    final json = jsonDecode(jsonStr);
    _questionListModel = QuestionListModel.fromJson(json);
  }

  Future<Response<Result<QuestionListModel>>> queryQuestion() {
    return Future.value(
      Response(
        http.Response(
          'Dummy',
          200,
          request: null
        ),
        Success<QuestionListModel>(_questionListModel)
      )
    );
  }
}