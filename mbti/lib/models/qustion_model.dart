
enum QuestionType {
  // 질문타입
  EI,
  SN,
  TF,
  JP
}

class QuestionModel {
  final String title;
  final QuestionType type;
  final String answerA;
  final String answerB;

  // named constructor

  QuestionModel.fromMap(Map<String, dynamic> map):
    title = map['title'],
    type = parseQuestionType(map['type']),
    answerA = map['answerA'],
    answerB = map['answerB'];

  static QuestionType parseQuestionType(String type) {
    return QuestionType.values.firstWhere((element) => element.name == type);
  }

  // @override
  // String toString() {
  //   // TODO: implement toString
  //   return 'title $title , type $type , answerA : $answerA , answerB : $answerB';
  // }
}