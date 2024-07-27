import 'dart:convert';

import 'package:binh_thuan/constants/api_path.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';
import 'package:crypto/crypto.dart';

class LoginRepo {
  Future<bool> login(String code, String password) async {
    Dio dio = Dio();
    dio.options.headers['Token'] = 'BT123456789';
    Response response;

    //String type = response.data['type'];
    //if (type == 'success') {
    //}
    try {
      response = await dio.post(ApiPath.login,
          data: jsonEncode({
            'code': code,
            'password': password,
          }));
      SpUtil.putString(ConstString.token, response.data["token"]);
      SpUtil.putString('id_user', response.data["student_id"]);
      SpUtil.putString(ConstString.idStudent, code);
      SpUtil.putString(ConstString.md5Pass, password);
    } on DioException {
      // in case of a code that is not success, you can get it here through object 'e'
      return false;
    }

    return response.data["token"] != null;
  }

  static String? get idUser => SpUtil.getString('id_user', defValue: null);
  Future<String> refreshToken() async {
    // Dio dio = Dio();
    // dio.options.headers['Authorization'] =
    //     'Bearer ${SpUtil.getString(ConstString.token)}';

    // Response response;

    // response = await dio.post(
    //   ApiPath.refreshToken,
    // );
    // SpUtil.putString(ConstString.token, response.data["token"]);
    // return response.data["token"];
    Dio dio = Dio();
    dio.options.headers['Token'] = 'BT123456789';
    Response response;
    response = await dio.post(ApiPath.login,
        data: jsonEncode({
          'code': SpUtil.getString(ConstString.idStudent),
          'password': SpUtil.getString(ConstString.md5Pass),
        }));
    SpUtil.putString(ConstString.token, response.data["token"]);

    return response.data["token"];
  }

  Future<String> changePassword({
    required String oldPass,
    required String newPass,
  }) async {
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
