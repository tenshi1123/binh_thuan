import 'package:intl/intl.dart';

class ConversationModel {
  final String? chatName;
  final String chatType;
  final String teacherChatName;
  final DateTime createdAt;
  final String content;
  final String chatId;
  final String messageType;
  final String? teacherName;
  final String unreadMessage;
  final String teacherAvatar;
  ConversationModel({
    required this.chatName,
    required this.chatType,
    required this.teacherChatName,
    required this.createdAt,
    required this.content,
    required this.chatId,
    required this.messageType,
    required this.teacherName,
    required this.unreadMessage,
    required this.teacherAvatar,
  });
  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
        chatName: json['chat_name'],
        chatType: json['chat_type'],
        teacherChatName: json['teachers_chat_full_name'],
        createdAt: DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['created_at']),
        content: json['content'],
        chatId: json['chat_id'],
        messageType: json['message_type'],
        teacherName: json['teachers_full_name'],
        unreadMessage: json['unread_messages_count'],
        teacherAvatar: json['teachers_chat_avatar'] ?? '');
  }
}

class MessageModel {
  var content;
  final String messageType;
  final String senderId;
  final String senderType;
  final DateTime createdAt;
  final String? teacherName;
  final String? studentName;
  final String? teacherAvatar;
  MessageModel({
    required this.content,
    required this.messageType,
    required this.senderId,
    required this.senderType,
    required this.createdAt,
    required this.teacherName,
    required this.studentName,
    required this.teacherAvatar,
  });
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      content: json['content'],
      messageType: json['message_type'] ?? '',
      senderId: json['sender_id'],
      senderType: json['sender_type'],
      createdAt: DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['created_at']),
      teacherName: json['teachers_full_name'],
      studentName: json['students_full_name'],
      teacherAvatar: json['teachers_avatar'],
    );
  }
}
