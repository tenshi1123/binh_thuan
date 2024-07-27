class InfoModel {
  final String name;
  final String teacherName;
  final String semesterName;
  final String timeType;
  final String timeStart;
  final String timeEnd;
  final String hinhThuc;
  final String day;
  final String videoType;
  final String streamingUrl;
  final String videoContent;
  final String startUrl;
  InfoModel({
    required this.timeEnd,
    required this.hinhThuc,
    required this.day,
    required this.videoType,
    required this.videoContent,
    required this.startUrl,
    required this.name,
    required this.teacherName,
    required this.semesterName,
    required this.timeType,
    required this.timeStart,
    required this.streamingUrl,
  });
  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      name: (json['name']) ?? json['day'],
      teacherName: json['teachers_full_name'] ?? 'không xác định',
      semesterName: json['semester_name'] ?? 'không xác định',
      timeType: json['time_slot_type'] ?? 'không xác định',
      timeStart: json['time_start'] ?? 'không xác định',
      timeEnd: json['time_end'] ?? '',
      hinhThuc: json['hinh_thuc_hoc'] ?? '',
      day: json['day'] ?? '',
      videoType: json['video_type'] ?? '',
      videoContent: json['video_content'] ?? '',
      startUrl: json['start_url'] ?? '',
      streamingUrl: json['streaming'] ?? '',
    );
  }
}

class DocumentModel {
  final String name;
  final String fileName;
  final String urlFile;
  final String fileType;
  DocumentModel({
    required this.name,
    required this.fileName,
    required this.urlFile,
    required this.fileType,
  });
  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      name: json['name'] ?? 'Không có tài liệu cần chuẩn bị',
      fileName: json['file_name'] ?? 'không tồn tại',
      urlFile: json['url_file'] ?? 'không tồn tại',
      fileType: json['file_type'] ?? 'không tồn tại',
    );
  }
}

class ChiTietBuoiHocModel {
  final String libraryId;
  final InfoModel info;
  final List<DocumentModel> document;

  ChiTietBuoiHocModel({
    required this.libraryId,
    required this.info,
    required this.document,
  });
  factory ChiTietBuoiHocModel.fromJson(Map<String, dynamic> json) {
    return ChiTietBuoiHocModel(
      libraryId: (json['libraryId']),
      info: InfoModel.fromJson(json['info']),
      document: (json['document'] != [])
          ? List<DocumentModel>.from(
              (json['document'] ?? []).map(
                (model) => DocumentModel.fromJson(model),
              ),
            )
          : [],
    );
  }
}
