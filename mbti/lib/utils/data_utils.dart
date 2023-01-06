
import 'package:mbti/constants/mbti_data.dart';
import 'package:mbti/models/qustion_model.dart';
import 'package:mbti/constants/result_data.dart';
import 'package:mbti/models/result_contents_model.dart';
import 'package:mbti/models/result_model.dart';

class DataUtils {

  static QuestionModel getQuestion({required int number}) {
    return question_answer[number];
  }

  static ResultContentsModel getResult({ required String result }) {
    switch(result) {
      case 'ISTJ':
        return resultData[ResultType.ISTJ];
      case 'ISFJ':
        return resultData[ResultType.ISFJ];
      case 'INFJ':
        return resultData[ResultType.INFJ];
      case 'INTJ':
        return resultData[ResultType.INTJ];
      case 'ISTP':
        return resultData[ResultType.ISTP];
      case 'ISFP':
        return resultData[ResultType.ISFP];
      case 'INFP':
        return resultData[ResultType.INFP];
      case 'INTP':
        return resultData[ResultType.INTP];
      case 'ESTP':
        return resultData[ResultType.ESTP];
      case 'ESFP':
        return resultData[ResultType.ESFP];
      case 'ENFP':
        return resultData[ResultType.ENFP];
      case 'ENTP':
        return resultData[ResultType.ENTP];
      case 'ESTJ':
        return resultData[ResultType.ESTJ];
      case 'ESFJ':
        return resultData[ResultType.ESFJ];
      case 'ENFJ':
        return resultData[ResultType.ENFJ];
      case 'ENTJ':
        return resultData[ResultType.ENTJ];
    }
    return resultData[result];
  }

  static List resultName() {
    List names = [];

    for (ResultType type in resultData.keys.toList()) {
      names.add(type.name);
    }

    return names;
  }

  static List resultList() {
    List names = resultName();
    
    List result = [];

    for (String name in names) {
      ResultContentsModel mbtiName = getResult(result: name);
      result.add(mbtiName);
    }

    return result;
  }


}