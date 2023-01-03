
import 'package:mbti/constants/mbti_data.dart';
import 'package:mbti/models/qustion_model.dart';

class DataUtils {

  static QuestionModel getQuestion({required int number}) {
    return question_answer[number];
  }

}