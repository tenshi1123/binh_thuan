import 'dart:convert';

import 'package:binh_thuan/constants/api_path.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/models/calender_model.dart';
import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';

class CalenderRepo {
  Future<List<CalenderEventModel>> getCalender() async {
    Dio dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    Response response;
    response = await dio.get(
      ApiPath.calender,
      data: jsonEncode(
        {
          "date_start": "2024-07-01",
          "date_end": "2024-07-31",
        },
      ),
    );
    List<CalenderEventModel> listCalender = List<CalenderEventModel>.from(
      response.data.map(
        (model) => CalenderEventModel.fromJson(model),
      ),
    );
    return listCalender;
  }
}
