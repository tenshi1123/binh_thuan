import 'package:binh_thuan/constants/api_path.dart';
import 'package:binh_thuan/models/login_model.dart';
import 'package:binh_thuan/repo/repo/login_repo.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  Future home({required String token}) async {
    Dio dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    try {
      response = await dio.get(
        ApiPath.home,
      );
      return HomeModel.fromJson(response.data["data"]);
    } on DioException {
      // in case of a code that is not success, you can get it here through object 'e'
      String newToken = await LoginRepo().refreshToken();
      dio.options.headers['Authorization'] = 'Bearer $newToken';
      response = await dio.get(
        ApiPath.home,
      );
      return HomeModel.fromJson(response.data["data"]);
    }
  }
}
