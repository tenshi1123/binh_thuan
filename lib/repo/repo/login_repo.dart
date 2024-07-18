import 'dart:convert';

import 'package:binh_thuan/constants/api_path.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/models/models/login_model.dart';
import 'package:binh_thuan/repo/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';

class LoginRepo {
  Future<HomeModel> login(String code, String password) async {
    Dio dio = Dio();
    dio.options.headers['Token'] = 'BT123456789';

    Response response;
    HomeModel info;
    response = await dio.post(ApiPath.login,
        data: jsonEncode({
          'code': code,
          'password': password,
        }));
    //String type = response.data['type'];
    //if (type == 'success') {
    SpUtil.putString(ConstString.token, response.data["token"]);
    info = await HomeRepo().home(token: response.data["token"]);
    //}

    return info;
  }

  Future<String> refreshToken() async {
    Dio dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';

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

    response = await dio.post(ApiPath.changePass,
        data: jsonEncode({
          'password_old': '2302682572',
          'pass_new': 'e10adc3949ba59abbe56e057f20f883e',
          're_pass_new': ''
        }));

    return response.data["token"];
  }
}
