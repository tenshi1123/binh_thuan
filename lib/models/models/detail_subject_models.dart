class DetailSubjectModels {
  final InfoModels info;
  final List<LichHocModels> lichHoc;
  final List<LessonModels> lesson;
  final List<DocumentModels> document;
  DetailSubjectModels({
    required this.info,
    required this.lichHoc,
    required this.lesson,
    required this.document,
  });
  factory DetailSubjectModels.fromJson(Map<String, dynamic> json) {
    return DetailSubjectModels(
      info: InfoModels.fromJson(json['info']),
      lichHoc: List<LichHocModels>.from(
        (json['lich_hoc'] ?? []).map(
          (model) => LichHocModels.fromJson(model),
        ),
      ),
      lesson: List<LessonModels>.from(
        (json['lesson'] ?? []).map(
          (model) => LessonModels.fromJson(model),
        ),
      ),
      document: List<DocumentModels>.from(
        (json['document'] ?? []).map(
          (e) => DocumentModels.fromJson(e),
        ),
      ),
    );
  }
}

class InfoModels {
  final String subjectName;
  final String teacherName;
  final String classSubjectId;
  final String subjectId;
  InfoModels({
    required this.teacherName,
    required this.subjectName,
    required this.classSubjectId,
    required this.subjectId,
  });
  factory InfoModels.fromJson(Map<String, dynamic> json) {
    return InfoModels(
      teacherName: json['teachers_full_name'] ?? 'unknow',
      subjectName: json['subject_name'] ?? 'không xác định',
      classSubjectId: json['class_subject_id'] ?? 'không xác định',
      subjectId: json['subject_id'] ?? 'không xác định',
    );
  }
}

class LichHocModels {
  final String id;
  final String name;
  final String classroom;
  final String timeType;
  final String timeStart;
  final String timeEnd;
  final String hinhThuc;
  final String dayofWeek;
  final String day;
  final String status;
  final String statusValue;
  LichHocModels(
      {required this.id,
      required this.name,
      required this.classroom,
      required this.timeType,
      required this.timeStart,
      required this.timeEnd,
      required this.hinhThuc,
      required this.dayofWeek,
      required this.day,
      required this.status,
      required this.statusValue});
  factory LichHocModels.fromJson(Map<String, dynamic> json) {
    return LichHocModels(
      id: json['teachers_full_name'] ?? 'unknow',
      name: json['subject_name'] ?? 'không xác định',
      classroom: json['start_date'] ?? 'không xác định',
      timeType: json['end_date'] ?? 'không xác định',
      timeStart: json['time_start'] ?? '',
      timeEnd: json['time_end'] ?? '',
      status: json['status'] ?? 'không xác định',
      hinhThuc: json['hinh_thuc_hoc'] ?? '',
      dayofWeek: json['day_of_week'] ?? '',
      day: json['day'] ?? '',
      statusValue: json['status_value'] ?? '',
    );
  }
}

class LessonModels {
  final String id;
  final String name;
  final String time;
  final String streamingUrl;
  final String content;
  final String type;

  LessonModels({
    required this.id,
    required this.name,
    required this.time,
    required this.streamingUrl,
    required this.content,
    required this.type,
  });
  factory LessonModels.fromJson(Map<String, dynamic> json) {
    return LessonModels(
      id: json['id'] ?? 'unknow',
      name: json['name'] ?? 'không xác định',
      streamingUrl: json['streaming_url'] ?? 'không xác định',
      content: json['content'] ?? 'không xác định',
      type: json['type'] ?? '',
      time: json['time'] ?? '',
    );
  }
}

class DocumentModels {
  final String id;
  final String name;
  final String urlFile;
  final String fileType;
  DocumentModels({
    required this.id,
    required this.name,
    required this.urlFile,
    required this.fileType,
  });
  factory DocumentModels.fromJson(Map<String, dynamic> json) {
    return DocumentModels(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      urlFile: json['url_file'] ?? '',
      fileType: json['file_type'],
    );
  }
}
