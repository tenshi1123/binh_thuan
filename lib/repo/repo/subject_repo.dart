import 'package:binh_thuan/constants/api_path.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/models/detail_subject_models.dart';
import 'package:binh_thuan/models/subject_models.dart';
import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';

class SubjectRepo {
  Future<List<SubjectModels>> subject({required String token}) async {
    Dio dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token, defValue: null)}';
    Response response;
    response = await dio.get(
      ApiPath.subject,
    );
    List<SubjectModels> listSubjects = List<SubjectModels>.from(
        response.data['subject'].map((model) => SubjectModels.fromJson(model)));
    return listSubjects;
  }

  Future<DetailSubjectModels> detailSubject({required String id}) async {
    Dio dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    Response response;
    response = await dio.get(ApiPath.detailSubject, data: {"id": id});
    DetailSubjectModels detailSubjects =
        DetailSubjectModels.fromJson(response.data);
    return detailSubjects;
  }
}
