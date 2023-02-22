// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultListModel _$ResultListModelFromJson(Map<String, dynamic> json) =>
    ResultListModel(
      resultList: (json['resultList'] as List<dynamic>)
          .map((e) => ResultDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultListModelToJson(ResultListModel instance) =>
    <String, dynamic>{
      'resultList': instance.resultList,
    };

ResultDetail _$ResultDetailFromJson(Map<String, dynamic> json) => ResultDetail(
      type: json['type'] as String,
      detail: ResultContent.fromJson(json['detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultDetailToJson(ResultDetail instance) =>
    <String, dynamic>{
      'type': instance.type,
      'detail': instance.detail,
    };

ResultContent _$ResultContentFromJson(Map<String, dynamic> json) =>
    ResultContent(
      name: json['name'] as String,
      contents: json['contents'] as String,
      path: json['path'] as String,
    );

Map<String, dynamic> _$ResultContentToJson(ResultContent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'contents': instance.contents,
      'path': instance.path,
    };
