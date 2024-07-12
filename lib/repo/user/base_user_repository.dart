import 'package:binh_thuan/models/models.dart';

abstract class BaseUserRepository {
  Future<AppResponse<List<UserEntity>>> getUsers();
}
