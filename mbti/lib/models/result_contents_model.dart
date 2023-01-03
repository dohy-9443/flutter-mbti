class ResultContentsModel {
  final String name;
  final String contents;
  final String path;

  ResultContentsModel.fromMap(Map<String, dynamic> map):
    name = map['name'],
    contents = map['contents'],
    path = map['path'];
}