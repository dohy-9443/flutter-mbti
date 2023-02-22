import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionListModel {
  @JsonKey(
    name: 'list'
  )
  final List<Question> questionList;

  QuestionListModel({required this.questionList});

  factory QuestionListModel.fromJson(Map<String, dynamic> json) => _$QuestionListModelFromJson(json);
}

@JsonSerializable()
class Question {

  final String title;
  final String type;
  final String answerA;
  final String answerB;

  Question({
    required this.title,
    required this.type,
    required this.answerA,
    required this.answerB
  });

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}