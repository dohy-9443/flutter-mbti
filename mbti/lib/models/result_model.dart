import 'package:mbti/models/result_contents_model.dart';

enum ResultType {
  ISTJ,
  ISFJ,
  INFJ,
  INTJ,
  ISTP,
  ISFP,
  INFP,
  INTP,
  ESTP,
  ESFP,
  ENFP,
  ENTP,
  ESTJ,
  ESFJ,
  ENFJ,
  ENTJ
}

class ResultModel {
  final ResultType resultType;
  final ResultContentsModel result;

  ResultModel({required this.resultType, required this.result});
}