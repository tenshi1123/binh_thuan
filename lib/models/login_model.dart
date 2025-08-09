import 'package:binh_thuan/models/subject_models.dart';

class StudentModel {
  final String nameClass;
  final String code;
  final String fullName;
  final String phone;
  final String email;
  final String dob;
  final String gender;
  final String avatar;
  final String address;
  final String parentName;
  StudentModel({
    required this.nameClass,
    required this.code,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.dob,
    required this.gender,
    required this.avatar,
    required this.address,
    required this.parentName,
  });
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      nameClass: json['classes_name'] ?? 'không xác định',
      code: json['code'] ?? 'không xác định',
      fullName: json['full_name'] ?? 'không xác định',
      phone: json['phone'] ?? 'không xác định',
      email: json['email'] ?? 'không xác định',
      dob: json['dob'] ?? 'không xác định',
      gender: json['gender'] ?? 'không xác định',
      avatar: json['avatar'] ?? 'không xác định',
      address: json['address'] ?? 'không xác định',
      parentName: json['father_name'] ?? json['mother_name'] ?? '',
    );
  }
}

class HomeModel {
  final StudentModel student;
  final int unfinished;
  final double average;
  final List<ComingLessonModels> comming;
  final List<ComingLessonModels> off;
  HomeModel({
    required this.student,
    required this.unfinished,
    required this.average,
    required this.comming,
    required this.off,
  });
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      student: StudentModel.fromJson(json['students'] ?? {}),
      unfinished: json['bai_tap_chua_lam'] ?? 0,
      average: json['diem_trung_binh'] ?? 'không xác định',
      comming: List<ComingLessonModels>.from(
            (json['lich_online'] ?? []).map(
              (model) => ComingLessonModels.fromJson(model),
            ),
          ) +
          List<ComingLessonModels>.from(
            (json['lich_off'] ?? []).map(
              (model) => ComingLessonModels.fromJson(model),
            ),
          ),
      off: List<ComingLessonModels>.from(
        (json['lich_off'] ?? []).map(
          (model) => ComingLessonModels.fromJson(model),
        ),
      ),
    );
  }
}
