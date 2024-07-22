import 'dart:convert';

import 'package:binh_thuan/constants/api_path.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/models/models/login_model.dart';
import 'package:binh_thuan/repo/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';
import 'package:crypto/crypto.dart';

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

  Future<String> changePassword(
    String oldPass,
    String newPass,
  ) async {
    Dio dio = Dio();
    Response response;
    String md5OldPass = md5.convert(utf8.encode(oldPass)).toString();
    String md5NewPass = md5.convert(utf8.encode(newPass)).toString();
    response = await dio.post(
      ApiPath.changePass,
      data: jsonEncode(
        {
          'password_old': md5OldPass,
          'pass_new': md5NewPass,
          're_pass_new': md5NewPass,
        },
      ),
    );

    return response.data["type"];
  }
}
