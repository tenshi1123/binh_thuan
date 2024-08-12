import 'package:intl/intl.dart';

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

class NotificationModel {
  final String title;
  final String content;
  final DateTime completedAt;
  NotificationModel({
    required this.title,
    required this.content,
    required this.completedAt,
  });
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      completedAt:
          DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['created_at'] ?? ''),
    );
  }
}
