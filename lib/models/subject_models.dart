class SubjectModels {
  final String teacherName;
  final String subjectName;
  final String startDate;
  final String endDate;
  final String status;
  final String id;
  final String statusValue;
  SubjectModels({
    required this.teacherName,
    required this.subjectName,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.id,
    required this.statusValue,
  });
  factory SubjectModels.fromJson(Map<String, dynamic> json) {
    return SubjectModels(
      teacherName: json['teachers_full_name'] ?? 'unknow',
      subjectName: json['subject_name'] ?? 'không xác định',
      startDate: json['start_date'] ?? 'không xác định',
      endDate: json['end_date'] ?? 'không xác định',
      status: json['status'] ?? 'không xác định',
      id: json['id'] ?? '',
      statusValue: json['status_value'] ?? '',
    );
  }
}

class ComingLessonModels {
  final String subjectName;
  final String timeName;
  final String timeType;
  final String timeStart;
  final String timeEnd;
  final String roomName;
  final String teacherName;
  final String dayOfWeek;
  final String day;
  final String id;
  ComingLessonModels({
    required this.subjectName,
    required this.timeName,
    required this.timeType,
    required this.timeStart,
    required this.timeEnd,
    required this.roomName,
    required this.teacherName,
    required this.dayOfWeek,
    required this.day,
    required this.id,
  });
  factory ComingLessonModels.fromJson(Map<String, dynamic> json) {
    return ComingLessonModels(
      id: json['id'] ?? '',
      teacherName: json['teachers_full_name'] ?? 'unknow',
      subjectName: json['subject_name'] ?? 'không xác định',
      timeName: json['time_slot_name'] ?? 'không xác định',
      timeType: json['time_slot_type'] ?? 'không xác định',
      timeStart: json['time_start'] ?? 'không xác định',
      timeEnd: json['time_end'] ?? '',
      roomName: json['class_room_name'] ?? '',
      dayOfWeek: json['day_of_week'] ?? '',
      day: json['day'] ?? '',
    );
  }
}
