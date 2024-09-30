import 'dart:convert';
import 'dart:io';

import 'package:binh_thuan/constants/api_path.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/modules/exercise/exercise_model.dart';
import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';

class ExcerciseRepo {
  Dio dio = Dio();
  Future<List<QuizModel>> getListQuestion(String id) async {
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    Response response;
    try {
      response = await dio.post(
        ApiPath.listQuiz,
        data: jsonEncode(
          {
            'id': int.parse(id),
          },
        ),
      );
      Map result = (response.data['question'][0]['value']);
      List newList = result.entries.map((e) => e.value).toList();
      return [
        QuizModel.fromJson(response.data['question'][0]),
        ...List<QuizModel>.from(
          newList.map(
            (model) => QuizModel.fromJson(model),
          ),
        )
      ];
    } on DioException {
      // in case of a code that is not success, you can get it here through object 'e'
      return [];
    }
  }

  Future<List<ExcerciseModel>> getListEcercise() async {
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    Response response;
    response = await dio.post(
      ApiPath.listExcercise,
    );
    return List<ExcerciseModel>.from(
      (response.data).map(
        (model) => ExcerciseModel.fromJson(model),
      ),
    );
  }

  Future submitEssay(String id, List<File> photo) async {
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    var formData = FormData.fromMap({
      'id': int.parse(id),
      'files': [
        await MultipartFile.fromFile(photo[0].path,
            filename: photo[0].path.split('/').last),
      ]
    });
    //này là nộp nhiều file thì mở comment ra
    // for (var file in photo) {
    //   formData.files.addAll([
    //     MapEntry(
    //         "file",
    //         await MultipartFile.fromFile(file.path,
    //             filename: file.path.split('/').last)),
    //   ]);
    // }
    await dio.post(ApiPath.submitEssay, data: formData);
  }

  Future submitTest({
    required String id,
    required String statTime,
    required List<Map<String, String>> data,
  }) async {
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    await dio.post(
      ApiPath.submitTest,
      data: jsonEncode(
        {
          'id': int.parse(id),
          'start_time': statTime,
          'data': data.removeAt(0),
        },
      ),
    );
  }
}
