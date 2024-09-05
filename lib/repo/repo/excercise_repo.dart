import 'dart:convert';

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
    Response response;
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
    return List<QuizModel>.from(
      newList.map(
        (model) => QuizModel.fromJson(model),
      ),
    );
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
}
