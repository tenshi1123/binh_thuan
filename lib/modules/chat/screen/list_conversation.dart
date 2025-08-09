import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/models/chat_model.dart';
import 'package:binh_thuan/modules/chat/screen/chat_screen.dart';
import 'package:binh_thuan/modules/chat/screen/list_teacher_screen.dart';
import 'package:binh_thuan/repo/repo/chat_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ListConversation extends StatelessWidget {
  const ListConversation({super.key, required this.listConversation});
  final List<ConversationModel> listConversation;
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
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    List<TeacherModel> listTeacher =
                        await ChatRepo().getTeacher();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListTeacher(
                          listTeacher: listTeacher,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Danh sách giáo viên',
                    style: defaultBoldText.copyWith(fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  width: 20.h,
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              //itemExtent: 390.0.w,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              itemCount: listConversation.length,
              itemBuilder: (BuildContext context, int index) {
                return ConversationItem(model: listConversation[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ConversationItem extends StatefulWidget {
  final ConversationModel model;
  const ConversationItem({
    super.key,
    required this.model,
  });

  @override
  State<ConversationItem> createState() => _ConversationItemState();
}

class _ConversationItemState extends State<ConversationItem> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          _isLoading = true;
        });
        List<MessageModel> listMessage =
            await ChatRepo().getListMessage(widget.model.chatId);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              groupId: widget.model.chatId,
              groupName: widget.model.chatName ?? widget.model.teacherChatName,
              userName: '',
              listMessage: listMessage,
            ),
          ),
        );
        setState(() {
          _isLoading = false;
        });
      },
      child: _isLoading
          ? Center(
              child: SizedBox(
                width: 28.w,
                height: 28.h,
                child: const CircularProgressIndicator(),
              ),
            )
          : SizedBox(
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
                      CircleAvatar(
                        radius: 20.r,
                        backgroundImage: widget.model.teacherAvatar != ''
                            ? NetworkImage(widget.model.teacherAvatar)
                            : const AssetImage(
                                    'assets/images/placeholder_avatar.png')
                                as ImageProvider,
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
                              widget.model.chatName ??
                                  widget.model.teacherChatName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                              style: defaultBoldText.copyWith(fontSize: 14.sp),
                            ),
                            Text(
                              widget.model.messageType == '0'
                                  ? widget.model.content
                                  : 'Đã gửi hình ảnh',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                              style: defaultText12.copyWith(
                                  color: widget.model.unreadMessage == '0'
                                      ? keyBlack.withOpacity(0.5)
                                      : keyBlack),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 76.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              (widget.model.createdAt.day == DateTime.now().day)
                                  ? DateFormat("HH:mm")
                                      .format(widget.model.createdAt)
                                  : DateFormat("dd/MM")
                                      .format(widget.model.createdAt),
                              style:
                                  defaultText12.copyWith(color: kPrimaryColor),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            widget.model.unreadMessage == '0'
                                ? const SizedBox()
                                : Container(
                                    width: 8.w,
                                    height: 8.h,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: rec21Red,
                                    ),
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
