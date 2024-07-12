import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/chat/model/chat_message_model.dart';
import 'package:binh_thuan/service/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String userName;
  const ChatScreen(
      {super.key,
      required this.groupId,
      required this.groupName,
      required this.userName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessageModel> messages = [
    ChatMessageModel(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessageModel(
        messageContent:
            "Lorem ipsum dolor sit amet, conse adi elit, sed do eiusmod temporetur ipiscing elit, sed do eiusmod por. ",
        messageType: "receiver"),
    ChatMessageModel(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessageModel(
        messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessageModel(
        messageContent:
            "Lorem ipsum dolor sit amet, conse adi elit, sed do eiusmod temporetur ipiscing elit, sed do eiusmod por. ",
        messageType: "sender"),
  ];
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 390.w,
        backgroundColor: kPrimaryColor,
        leading: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            Container(
              height: 36.h,
              width: 36.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Nhóm SD-125',
              style: defaultBoldText.copyWith(color: Colors.white),
            ),
            SizedBox(
              width: 150.w,
            ),
            SvgPicture.asset('assets/icons/group.svg')
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 10.h),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                    left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"
                          ? rec14Marine
                          : kPrimaryColor),
                    ),
                    padding: const EdgeInsets.all(16),
                    //width: 290.w,
                    child: Text(
                      messages[index].messageContent,
                      style: defaultText14.copyWith(
                        color: (messages[index].messageType == "receiver"
                            ? keyBlack
                            : keyWhite),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset('assets/icons/camera_icon.svg')),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset('assets/icons/picture_icon.svg')),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: rec14Marine,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: TextField(
                        controller: messageController,
                        decoration: const InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                        style: defaultText14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child:
                          SvgPicture.asset('assets/icons/plane_outline.svg')),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "message": messageController.text,
        "sender": widget.userName,
        "time": DateTime.now().millisecondsSinceEpoch,
      };

      DatabaseService().sendMessage(widget.groupId, chatMessageMap);
      setState(() {
        messageController.clear();
      });
    }
  }
}
