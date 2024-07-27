import 'dart:convert';

import 'package:binh_thuan/constants/api_path.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/models/lesson_model.dart';
import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';

class LessonRepo {
  Future<ChiTietBuoiHocModel> lessonDetails({String id = '1'}) async {
    Dio dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    Response response;
    response = await dio.post(
      ApiPath.lesson,
      data: jsonEncode(
        {
          'id': int.parse(id),
        },
      ),
    );
    return ChiTietBuoiHocModel.fromJson(response.data);
  }

  Future sendQuestion({required String id, required String content}) async {
    Dio dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    Response response;
    response = await dio.post(
      ApiPath.thacMac,
      data: jsonEncode(
        {
          'id': int.parse(id),
          'question': content,
        },
      ),
    );
    return response.data["type"];
  }
}
