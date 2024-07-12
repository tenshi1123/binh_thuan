import 'dart:convert';

import 'package:binh_thuan/constants/api_path.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  Future<String> home(String code, String password) async {
    Dio dio = Dio();
    dio.options.headers['Token'] = 'BT123456789';
    Response response;
    response = await dio.post(ApiPath.login,
        data: jsonEncode({
          'code': '2302682572',
          'password': 'e10adc3949ba59abbe56e057f20f883e'
        }));

    return response.data["token"];
  }
}
