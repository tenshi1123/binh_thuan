import 'dart:convert';

import 'package:binh_thuan/constants/api_path.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';

class LoginRepo {
  Future<String> login(String code, String password) async {
    Dio dio = Dio();
    dio.options.headers['Token'] = 'BT123456789';

    Response response;

    response = await dio.post(ApiPath.login,
        data: jsonEncode({
          'code': '2302682572',
          'password': 'e10adc3949ba59abbe56e057f20f883e'
        }));
    SpUtil.putString(ConstString.token, response.data["token"]);
    return response.data["token"];
  }

  Future<String> refreshToken(String code, String password) async {
    Dio dio = Dio();
    dio.options.headers['Authorization'] = SpUtil.getString(
      ConstString.token,
    );

    Response response;

    response = await dio.post(
      ApiPath.refreshToken,
    );
    SpUtil.putString(ConstString.token, response.data["token"]);
    return response.data["token"];
  }

  Future<String> changePassword(String code, String password) async {
    Dio dio = Dio();
    Response response;

    response = await dio.post(ApiPath.login,
        data: jsonEncode({
          'password_old': '2302682572',
          'pass_new': 'e10adc3949ba59abbe56e057f20f883e',
          're_pass_new': ''
        }));

    return response.data["token"];
  }
}
