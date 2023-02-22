// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionListModel _$QuestionListModelFromJson(Map<String, dynamic> json) =>
    QuestionListModel(
      questionList: (json['list'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionListModelToJson(QuestionListModel instance) =>
    <String, dynamic>{
      'list': instance.questionList,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      title: json['title'] as String,
      type: json['type'] as String,
      answerA: json['answerA'] as String,
      answerB: json['answerB'] as String,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'answerA': instance.answerA,
      'answerB': instance.answerB,
    };
