import 'dart:convert';

import 'package:binh_thuan/constants/api_path.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/modules/notification/noti_model.dart';
import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';

class NotificationRepo {
  Dio dio = Dio();
  Future<List<NotiModel>> getAllNotification() async {
    dio.options.headers['Authorization'] =
        'Bearer MDZhNzk1MzktYmRlZS00M2RhLWFjOTctZTlhMDFmNzJlYTYx';

    Response response;

    response = await dio.get(
      ApiPath.oneSignal,
      queryParameters: {'app_id': '1f643336-9d73-4c65-ac00-38d499b8c462'},
    );
    List<NotiModel> result = ((response.data)['notifications'] as List)
        .map((e) => NotiModel.fromJson(e))
        .toList();
    return result;
  }

  Future<List<NotiModel>> getListMessages() async {
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    Response response;
    response = await dio.get(
      ApiPath.listNotification,
    );
    return List<NotiModel>.from(
      (response.data ?? []).map(
        (model) => NotiModel.fromJson(model),
      ),
    );
  }

  Future getDetailNoti(String id) async {
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    Response response;
    response = await dio.get(ApiPath.detailNoti,
        data: jsonEncode({
          'id': id,
        }));
    return response;
  }
}
