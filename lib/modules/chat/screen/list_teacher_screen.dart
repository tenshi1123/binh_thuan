import 'dart:math';

import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/models/chat_model.dart';
import 'package:binh_thuan/modules/chat/screen/chat_screen.dart';
import 'package:binh_thuan/repo/repo/chat_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTeacher extends StatelessWidget {
  const ListTeacher({super.key, required this.listTeacher});
  final List<TeacherModel> listTeacher;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100.h,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: keyWhite),
          onPressed: () => Navigator.of(context).pop(),
        ),
        flexibleSpace: SizedBox(
          height: 125.h,
          child: Stack(
            children: [
              Image(
                height: 125.h,
                width: MediaQuery.of(context).size.width,
                image: const AssetImage('assets/images/appbar_background.png'),
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 250.w,
                bottom: 22.h,
                child: Text(
                  'Tin nhắn',
                  style: defaultBoldText.copyWith(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 18.h,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20.w),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const SearchField(),
            //       SvgPicture.asset(
            //         'assets/icons/add_member.svg',
            //         color: kPrimaryColor,
            //         width: 24.w,
            //         height: 24.h,
            //       )
            //     ],
            //   ),
            // ),

            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              //itemExtent: 390.0.w,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              itemCount: listTeacher.length,
              itemBuilder: (BuildContext context, int index) {
                return ConversationItem(model: listTeacher[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ConversationItem extends StatelessWidget {
  final TeacherModel model;
  const ConversationItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String chatId =
            await ChatRepo().getChatTeacherStudent(teacherId: model.id);
        List<MessageModel> listMessage =
            await ChatRepo().getListMessage(chatId);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              groupId: chatId,
              groupName: model.fullName,
              userName: '',
              listMessage: listMessage,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 390.w,
        height: 68.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                model.avatar != ''
                    ? CircleAvatar(
                        radius: 20.r,
                        backgroundImage: NetworkImage(model.avatar))
                    : CircleAvatar(
                        backgroundColor:
                            listColor[Random().nextInt(listColor.length)],
                        child: Text(getInitials(string: model.fullName)),
                      ),
                SizedBox(
                  width: 12.w,
                ),
                SizedBox(
                  width: 220.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.fullName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: defaultBoldText.copyWith(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              indent: 20.w,
              endIndent: 20.w,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}

String getInitials({required String string, int? limitTo}) {
  var buffer = StringBuffer();
  var split = string.split(' ');
  for (var i = 0; i < (limitTo ?? split.length); i++) {
    buffer.write(split[i][0]);
  }
  String result = buffer.toString();
  String newResult =
      result.substring((result.length - 2).clamp(0, result.length));
  return newResult;
}
