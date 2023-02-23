import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:zzang_gu_mbti/domain/models/models.dart';

class ResultMockService {
  late final ResultListModel _resultListModel;
  late ResultDetail _resultDetail = ResultDetail(type: '', detail: ResultContent(name: '', contents: '', path: ''));

  void loadResult() async {
    final jsonStr = await rootBundle.loadString('asset/data/result.json');
    final json = jsonDecode(jsonStr);
    _resultListModel = ResultListModel.fromJson(json);
  }

  Future<Response<Result<List<ResultDetail>>>> resultTypeList() {
    List<ResultDetail> nameList = [];

    for(ResultDetail detail in _resultListModel.resultList) {
      nameList.add(detail);
    }

    return Future.value(
      Response(
        http.Response(
          'Dummy',
          200,
          request: null
        ),
        Success<List<ResultDetail>>(nameList)
      )
    );
  }

  Future<Response<Result<ResultDetail>>> queryResult({required String mbti}) {
    _resultDetail = _resultListModel.resultList.firstWhereOrNull((e) => e.type == mbti)!;

    return Future.value(
      Response(
          http.Response(
            'Dummy',
            200,
            request: null
          ),
          Success<ResultDetail>(_resultDetail)
      )
    );
  }
}