class NotiModel {
  final String contents;
  final String headings;
  final DateTime completedAt;
  NotiModel(
      {required this.contents,
      required this.headings,
      required this.completedAt});
  factory NotiModel.fromJson(Map<String, dynamic> json) {
    return NotiModel(
      contents: json['contents']['vi'] ?? json['contents']['en'] ?? '',
      headings: json['headings']['vi'] ?? json['headings']['en'] ?? '',
      completedAt:
          DateTime.fromMillisecondsSinceEpoch(json['completed_at'] * 1000),
    );
  }
}
