import 'dart:convert';
import 'dart:io';

import 'package:binh_thuan/constants/api_path.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/models/chat_model.dart';
import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';

class ChatRepo {
  Future<List<ConversationModel>> getListChat() async {
    Dio dio = Dio();
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

  Future<List<MessageModel>> getListMessage(String id) async {
    Dio dio = Dio();
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
    Dio dio = Dio();
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
    Dio dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    var formData = FormData.fromMap({
      'chat_id': int.parse(id),
      'files': [
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
