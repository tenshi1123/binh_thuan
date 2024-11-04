import 'package:intl/intl.dart';
import 'dart:convert';

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
      timeDeadline: DateFormat("yyyy-MM-dd hh:mm:ss")
          .parse(json['time_deadline'] ?? '0000-00-00 00:00:00'),
      urlFile: json['url_file'] ?? '',
      type: json['type'] ?? '',
      typeExcercise: json['loai_bai_tap'] ?? '',
    );
  }
}

class QuestionsModel {
  final String id;
  final String title;
  final String content;
  final String videoAttachment;
  final String audioAttachment;
  final List<QuizModel> value;
  QuestionsModel({
    required this.id,
    required this.title,
    required this.content,
    required this.videoAttachment,
    required this.audioAttachment,
    required this.value,
  });
  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    Map result = json['value'] ?? {};
    List newList = result.entries.map((e) => e.value).toList();
    return QuestionsModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      videoAttachment: json['video_attachment'] ?? '',
      audioAttachment: json['audio_attachment'] ?? '',
      value: List<QuizModel>.from(
        newList.map(
          (model) => QuizModel.fromJson(model),
        ),
      ),
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
  final List<Map>? listQuestions;
  QuizModel({
    required this.id,
    required this.title,
    required this.content,
    required this.mark,
    required this.questions,
    required this.type,
    this.listQuestions,
  });
  factory QuizModel.fromJson(Map<String, dynamic> json1) {
    return QuizModel(
      id: json1['id'] ?? '',
      title: json1['title'] ?? '',
      content: json1['content'] ?? '',
      mark: json1['mark'] ?? '',
      questions: json1['questions'] ?? '',
      type: json1['type'] ?? '',
      listQuestions: json1['questions'] == ''
          ? []
          : json
                  .decode(json1['questions'].replaceAll(RegExp(r'\\'), ''))
                  .cast<Map>()
                  .toList() ??
              [],
    );
  }
}
