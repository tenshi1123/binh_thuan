class CalenderEventModel {
  final String subjectName;
  final String timeSlotName;
  final String timeSlotType;
  final String timeStart;
  final String timeEnd;
  final String hinhThucHoc;
  final String classRoomName;
  final String teachersFullName;
  final String id;
  final String dayOfWeek;
  final String day;
  final String classSessionsName;
  CalenderEventModel({
    required this.subjectName,
    required this.timeSlotName,
    required this.timeSlotType,
    required this.timeStart,
    required this.timeEnd,
    required this.hinhThucHoc,
    required this.classRoomName,
    required this.teachersFullName,
    required this.id,
    required this.dayOfWeek,
    required this.day,
    required this.classSessionsName,
  });
  factory CalenderEventModel.fromJson(Map<String, dynamic> json) {
    return CalenderEventModel(
      subjectName: (json['subject_name']) ?? '',
      timeSlotName: json['time_slot_name'] ?? 'không xác định',
      timeSlotType: json['time_slot_type'] ?? 'không xác định',
      timeStart: json['time_start'] ?? 'không xác định',
      timeEnd: json['time_end'] ?? 'không xác định',
      hinhThucHoc: json['hinh_thuc_hoc'] ?? '',
      classRoomName: json['class_room_name'] ?? '',
      teachersFullName: json['teachers_full_name'] ?? '',
      id: json['id'] ?? '',
      day: json['day'] ?? '',
      dayOfWeek: json['day_of_week'] ?? '',
      classSessionsName: json['class_sessions_name'] ?? '',
    );
  }
}
