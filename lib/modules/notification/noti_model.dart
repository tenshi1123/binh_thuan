import 'package:intl/intl.dart';

// class NotiModel {
//   final String contents;
//   final String headings;
//   final DateTime completedAt;
//   NotiModel(
//       {required this.contents,
//       required this.headings,
//       required this.completedAt});
//   factory NotiModel.fromJson(Map<String, dynamic> json) {
//     return NotiModel(
//       contents: json['contents']['vi'] ?? json['contents']['en'] ?? '',
//       headings: json['headings']['vi'] ?? json['headings']['en'] ?? '',
//       completedAt:
//           DateTime.fromMillisecondsSinceEpoch(json['completed_at'] * 1000),
//     );
//   }
// }

class NotiModel {
  final String headings;
  final String contents;
  final DateTime createdAt;
  final String link;
  final String status;
  final String notiId;
  NotiModel(
      {required this.headings,
      required this.contents,
      required this.createdAt,
      required this.link,
      required this.status,
      required this.notiId});
  factory NotiModel.fromJson(Map<String, dynamic> json) {
    return NotiModel(
      link: json['link'] ?? '',
      headings: json['title'] ?? '',
      contents: json['content'] ?? '',
      createdAt:
          DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['created_at'] ?? ''),
      notiId: json['notification_students_id'] ?? '',
      status: (json['status'] ?? '').toString(),
    );
  }
}
