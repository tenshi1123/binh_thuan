import 'package:intl/intl.dart';

class ExcerciseModel {
  final String checkId;
  final String finalMark;
  final String id;
  final String name;
  final String totalQuestion;
  final String totalTime;
  final DateTime timeDeadline;
  final String urlFile;
  final String type;
  final String typeExcercise;

  ExcerciseModel({
    required this.checkId,
    required this.finalMark,
    required this.id,
    required this.name,
    required this.totalQuestion,
    required this.totalTime,
    required this.timeDeadline,
    required this.urlFile,
    required this.type,
    required this.typeExcercise,
  });
  factory ExcerciseModel.fromJson(Map<String, dynamic> json) {
    return ExcerciseModel(
      checkId: json['student_results_class_sessions_test_id'] ?? '',
      finalMark: json['final_mark'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      totalQuestion: json['total_questions'] ?? '',
      totalTime: json['total_time'] ?? '',
      timeDeadline:
          DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['time_deadline'] ?? ''),
      urlFile: json['url_file'] ?? '',
      type: json['type'] ?? '',
      typeExcercise: json['loai_bai_tap'] ?? '',
    );
  }
}

class QuizModel {
  final String id;
  final String title;
  final String content;
  final String mark;
  final String questions;
  final String type;

  QuizModel({
    required this.id,
    required this.title,
    required this.content,
    required this.mark,
    required this.questions,
    required this.type,
  });
  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      mark: json['mark'] ?? '',
      questions: json['questions'] ?? '',
      type: json['type'] ?? '',
    );
  }
}
