import 'package:json_annotation/json_annotation.dart';

part 'result_model.g.dart';

@JsonSerializable()
class ResultListModel {
  final List<ResultDetail> resultList;

  ResultListModel({
    required this.resultList
  });

  factory ResultListModel.fromJson(Map<String, dynamic> json) => _$ResultListModelFromJson(json);
}

@JsonSerializable()
class ResultDetail {
  final String type;
  final ResultContent detail;

  ResultDetail({
    required this.type,
    required this.detail
  });

  factory ResultDetail.fromJson(Map<String, dynamic> json) => _$ResultDetailFromJson(json);
}

@JsonSerializable()
class ResultContent {
  final String name;
  final String contents;
  final String path;

  ResultContent({
    required this.name,
    required this.contents,
    required this.path
  });

  factory ResultContent.fromJson(Map<String, dynamic> json) => _$ResultContentFromJson(json);
}