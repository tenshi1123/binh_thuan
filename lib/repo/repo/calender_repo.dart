import 'package:binh_thuan/constants/api_path.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/models/models/calender_model.dart';
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
    );
    List<CalenderEventModel> listCalender = List<CalenderEventModel>.from(
      response.data.map(
        (model) => CalenderEventModel.fromJson(model),
      ),
    );
    return listCalender;
  }
}
