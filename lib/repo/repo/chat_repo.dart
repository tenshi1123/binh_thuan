import 'dart:convert';
import 'dart:io';

import 'package:binh_thuan/constants/api_path.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/models/chat_model.dart';
import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';

class ChatRepo {
  Dio dio = Dio();
  Future<List<ConversationModel>> getListChat() async {
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    Response response;
    response = await dio.post(
      ApiPath.chat,
    );
    return List<ConversationModel>.from(
      (response.data ?? []).map(
        (model) => ConversationModel.fromJson(model),
      ),
    );
  }

  Future<List<TeacherModel>> getTeacher() async {
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    Response response;
    response = await dio.post(
      ApiPath.listTeachers,
    );
    return List<TeacherModel>.from(
      (response.data ?? []).map(
        (e) => TeacherModel.fromJson(e),
      ),
    );
  }

  Future<String> getChatTeacherStudent({required String teacherId}) async {
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    Response response;
    response = await dio.post(
      ApiPath.chatTeacher,
      data: jsonEncode(
        {
          'teachers_id': teacherId,
        },
      ),
    );
    return response.data['chat_id'];
  }

  Future<List<MessageModel>> getListMessage(String id) async {
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    Response response;
    response = await dio.post(
      ApiPath.chatMessage,
      data: jsonEncode(
        {
          'chat_id': int.parse(id),
        },
      ),
    );
    return List<MessageModel>.from(
      (response.data['chat_messages'] ?? []).map(
        (model) => MessageModel.fromJson(model),
      ),
    );
  }

  Future sendTextMessage(String id, String content) async {
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    Response response;
    response = await dio.post(
      ApiPath.sendMessage,
      data: jsonEncode(
        {
          'chat_id': int.parse(id),
          'content': content,
        },
      ),
    );
    return response.data['type'];
  }

  Future sendImageMessage(String id, List<File> photo) async {
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    var formData = FormData.fromMap({
      'chat_id': int.parse(id),
      'files[]': [
        await MultipartFile.fromFile(photo[0].path,
            filename: photo[0].path.split('/').last),
      ]
    });
    for (var file in photo) {
      formData.files.addAll([
        MapEntry(
            "files",
            await MultipartFile.fromFile(file.path,
                filename: file.path.split('/').last)),
      ]);
    }
    await dio.post(ApiPath.sendImg, data: formData);
  }
}
