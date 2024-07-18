import 'dart:convert';

import 'package:binh_thuan/constants/api_path.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/models/models/lesson_model.dart';
import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';

class LessonRepo {
  Future<LessonModel> lessonDetails() async {
    Dio dio = Dio();
    dio.options.headers['Authorization'] = SpUtil.getString(
      ConstString.token,
    );
    Response response;
    response = await dio.post(ApiPath.lesson,
        data: jsonEncode({
          'id': '1',
        }));
    return LessonModel.fromJson(response.data);
  }
}
